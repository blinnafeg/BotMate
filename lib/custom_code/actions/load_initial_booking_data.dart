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
  Future Function(List<ServiceStruct> services, List<ClientStruct> clients)
      onDataLoaded,
) async {
  // Add your function code here!
  try {
    final supabase = SupaFlow.client;

    final servicesData = await supabase
        .rpc('get_services_for_booking', params: {'p_org_id': organizationId});
    final clientsData = await supabase.rpc('get_clients_for_booking');

    final services =
        (servicesData as List).map((j) => ServiceStruct.fromMap(j)).toList();
    final clients =
        (clientsData as List).map((j) => ClientStruct.fromMap(j)).toList();

    await onDataLoaded(services, clients);
  } catch (e) {
    await onDataLoaded([], []);
  }
}
