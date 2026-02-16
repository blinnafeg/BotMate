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

Future getAvailableSlots(
  String organizationId,
  String masterId,
  String targetDate,
  Future Function(List<String> slots) onSlotsLoaded,
) async {
  try {
    final supabase = SupaFlow.client;
    final data = await supabase.rpc('get_available_slots', params: {
      'p_org_id': organizationId,
      'p_master_id': masterId,
      'p_target_date': targetDate
    });

    final slots = (data as List).map((j) => j['time'] as String).toList();
    await onSlotsLoaded(slots);
  } catch (e) {
    await onSlotsLoaded([]);
  }
}
