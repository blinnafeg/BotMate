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

Future createAppointment(
  String organizationId,
  String clientId,
  String serviceId,
  String masterId,
  String appointmentDate,
  String appointmentTime,
  String? notes,
  Future Function() onSuccess,
  Future Function(String error) onError,
) async {
  try {
    final supabase = SupaFlow.client;
    final result = await supabase.rpc('create_appointment', params: {
      'p_org_id': organizationId,
      'p_client_id': clientId,
      'p_service_id': serviceId,
      'p_master_id': masterId,
      'p_appointment_date': appointmentDate,
      'p_appointment_time': appointmentTime,
      'p_notes': notes ?? ''
    });

    if (result['success'] == true) {
      await onSuccess();
    } else {
      await onError(result['error'] ?? 'Ошибка создания записи');
    }
  } catch (e) {
    await onError('Ошибка: $e');
  }
}
