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

Future<List<String>> loadAvailableSlots(
  String organizationId,
  String masterId,
  String targetDate,
) async {
  try {
    final supabase = SupaFlow.client;

    print('📥 Loading available slots for master: $masterId on $targetDate');

    final response = await supabase.rpc(
      'get_available_slots',
      params: {
        'p_org_id': organizationId,
        'p_master_id': masterId,
        'p_target_date': targetDate,
      },
    );

    if (response == null || response is! List) {
      print('⚠️ No slots data returned');
      return [];
    }

    // Извлекаем время из каждого объекта {time: "14:00"}
    final slots = (response as List).map((item) {
      final map = item as Map<String, dynamic>;
      return map['time'] as String;
    }).toList()
      ..sort(); // сортируем по времени

    print('✅ Loaded ${slots.length} slots');

    return slots;
  } catch (e, stackTrace) {
    print('❌ Error loading available slots: $e');
    print('📚 Stack trace: $stackTrace');
    return [];
  }
}
