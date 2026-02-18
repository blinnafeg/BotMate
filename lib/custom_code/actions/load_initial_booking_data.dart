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

Future loadInitialBookingData(
  String organizationId,
  Future Function(
          List<DropdownItemStruct> services, List<DropdownItemStruct> clients)
      onDataLoaded,
) async {
  try {
    final supabase = SupaFlow.client;

    print('📥 Loading initial booking data for org: $organizationId');

    // 1. Загружаем услуги
    final servicesData = await supabase
        .rpc('get_services_for_booking', params: {'p_org_id': organizationId});

    final services = (servicesData as List).map((json) {
      final map = json as Map<String, dynamic>;
      return DropdownItemStruct(
        id: map['id'] as String,
        name: map['name'] as String,
        phone: '', // у услуг нет телефона
      );
    }).toList();

    print('✅ Loaded ${services.length} services');

    // 2. Загружаем клиентов
    final clientsData = await supabase.rpc('get_clients_for_booking');

    final clients = (clientsData as List).map((json) {
      final map = json as Map<String, dynamic>;
      return DropdownItemStruct(
        id: map['id'] as String,
        name: map['name'] as String,
        phone: map['phone'] as String? ?? '',
      );
    }).toList();

    print('✅ Loaded ${clients.length} clients');

    // 3. Вызываем callback
    await onDataLoaded(services, clients);
  } catch (e, stackTrace) {
    print('❌ Error loading initial booking data: $e');
    print('📚 Stack trace: $stackTrace');
    await onDataLoaded([], []);
  }
}
