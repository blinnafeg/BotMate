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

Future<List<ServiceStruct>> loadServices(String organizationId) async {
  try {
    final supabase = SupaFlow.client;

    print('📥 Loading services for org: $organizationId');

    final response = await supabase.rpc(
      'get_services_for_booking',
      params: {'p_org_id': organizationId},
    );

    if (response == null || response is! List) {
      print('⚠️ No services data returned');
      return [];
    }

    final services = (response as List)
        .map((json) => ServiceStruct.fromMap(json as Map<String, dynamic>))
        .toList();

    print('✅ Loaded ${services.length} services');

    return services;
  } catch (e, stackTrace) {
    print('❌ Error loading services: $e');
    print('📚 Stack trace: $stackTrace');
    return [];
  }
}
