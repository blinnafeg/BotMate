// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<MasterStruct>> loadMastersForServices(
  String organizationId,
  List<ServiceStruct> selectedServices,
) async {
  try {
    // Проверяем, что выбраны услуги
    if (selectedServices.isEmpty) {
      print('⚠️ No services selected');
      return [];
    }

    final supabase = SupaFlow.client;

    print('📥 Loading masters for ${selectedServices.length} services');

    // Получаем ID всех выбранных услуг
    final serviceIds = selectedServices.map((s) => s.id).toList();

    // Загружаем мастеров, которые могут выполнять ХОТЯ БЫ ОДНУ из выбранных услуг
    final response = await supabase
        .from('crm_master_services')
        .select('''
          master_id,
          crm_masters!inner (
            id,
            name,
            phone,
            telegram_id,
            is_active,
            specialization
          )
        ''')
        .inFilter('service_id', serviceIds)
        .eq('crm_masters.organization_id', organizationId)
        .eq('crm_masters.is_active', true);

    // Проверяем ответ
    if (response == null || response is! List) {
      print('⚠️ No masters data returned');
      return [];
    }

    // Извлекаем уникальных мастеров (без дубликатов)
    final Map<String, MasterStruct> uniqueMasters = {};

    for (var item in (response as List)) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Map<String, dynamic> masterData =
          itemMap['crm_masters'] as Map<String, dynamic>;
      final master = MasterStruct.fromMap(masterData);
      uniqueMasters[master.id] = master;
    }

    // Преобразуем в список и сортируем по имени
    final masters = uniqueMasters.values.toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    print('✅ Loaded ${masters.length} unique masters');

    return masters;
  } catch (e, stackTrace) {
    print('❌ Error loading masters for services: $e');
    print('📚 Stack trace: $stackTrace');
    return [];
  }
}
