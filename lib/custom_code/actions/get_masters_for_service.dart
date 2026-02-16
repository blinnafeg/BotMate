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
  Future Function(List<MasterStruct> masters) onMastersLoaded,
) async {
  try {
    final supabase = SupaFlow.client;
    final data = await supabase.rpc('get_masters_for_service',
        params: {'p_service_id': serviceId, 'p_org_id': organizationId});

    final masters = (data as List).map((j) => MasterStruct.fromMap(j)).toList();
    await onMastersLoaded(masters);
  } catch (e) {
    await onMastersLoaded([]);
  }
}
