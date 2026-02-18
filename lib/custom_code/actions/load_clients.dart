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

Future<List<ClientStruct>> loadClients(String organizationId) async {
  try {
    final supabase = SupaFlow.client;

    print('📥 Loading clients for org: $organizationId');

    final response = await supabase
        .from('crm_clients')
        .select('id, name, phone, telegram_id')
        .order('name');

    if (response == null || response is! List) {
      print('⚠️ No clients data returned');
      return [];
    }

    final clients = (response as List)
        .map((json) => ClientStruct.fromMap(json as Map<String, dynamic>))
        .toList();

    print('✅ Loaded ${clients.length} clients');

    return clients;
  } catch (e, stackTrace) {
    print('❌ Error loading clients: $e');
    print('📚 Stack trace: $stackTrace');
    return [];
  }
}
