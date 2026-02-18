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

Future getMastersForService(
  String serviceId,
  String organizationId,
  Future Function(List<DropdownItemStruct> masters) onMastersLoaded,
) async {
  try {
    final supabase = SupaFlow.client;

    print('📥 Loading masters for service: $serviceId');

    final data = await supabase.rpc('get_masters_for_service',
        params: {'p_service_id': serviceId, 'p_org_id': organizationId});

    if (data == null || data is! List) {
      print('⚠️ No masters data returned');
      await onMastersLoaded([]);
      return;
    }

    final masters = (data as List).map((json) {
      final map = json as Map<String, dynamic>;
      return DropdownItemStruct(
        id: map['id'] as String,
        name: map['name'] as String,
        phone: map['phone'] as String? ?? '',
      );
    }).toList();

    print('✅ Loaded ${masters.length} masters');

    await onMastersLoaded(masters);
  } catch (e, stackTrace) {
    print('❌ Error loading masters: $e');
    print('📚 Stack trace: $stackTrace');
    await onMastersLoaded([]);
  }
}
