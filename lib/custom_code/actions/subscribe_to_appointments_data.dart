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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';
import 'dart:convert';

// Глобальные переменные для хранения подписок
RealtimeChannel? _appointmentsChannel;
RealtimeChannel? _clientsChannel;
RealtimeChannel? _mastersChannel;
RealtimeChannel? _servicesChannel;

Future<void> subscribeToAppointmentsData(
  String organizationId,
  Future Function(AppointmentsPageDataStruct data) onDataUpdate,
  String viewType,
  int? offset,
) async {
  final supabase = SupaFlow.client;

  // Используем 0 если offset не передан
  final effectiveOffset = offset ?? 0;

  // Функция для вычисления targetDate на основе offset
  String _getTargetDate() {
    final now = DateTime.now();
    DateTime targetDate;

    if (viewType == 'week') {
      // Смещаем на offset недель
      targetDate = now.add(Duration(days: effectiveOffset * 7));
    } else {
      // Смещаем на offset месяцев
      targetDate = DateTime(now.year, now.month + effectiveOffset, now.day);
    }

    return DateFormat('yyyy-MM-dd').format(targetDate);
  }

  // Функция для загрузки данных
  Future<void> fetchData() async {
    try {
      final targetDate = _getTargetDate();
      print('📥 Fetching appointments data for organization: $organizationId');
      print(
          '📅 View: $viewType, Offset: $effectiveOffset, Target date: $targetDate');

      final response = await supabase.rpc(
        'get_appointments_page_data',
        params: {
          'org_id': organizationId,
          'view_type': viewType,
          'target_date': targetDate,
        },
      );

      if (response != null) {
        print('📦 Response type: ${response.runtimeType}');

        // Парсим ответ
        Map<String, dynamic> dataMap;
        if (response is String) {
          dataMap = json.decode(response);
        } else {
          dataMap = Map<String, dynamic>.from(response);
        }

        print('✅ Data parsed successfully');
        print('📊 Top level keys: ${dataMap.keys.join(', ')}');

        // Создаем структуру
        final appointmentsData = AppointmentsPageDataStruct.fromMap(dataMap);

        // Вызываем callback
        await onDataUpdate(appointmentsData);

        print('✅ Appointments data loaded successfully');
      }
    } catch (e, stackTrace) {
      print('❌ Error fetching appointments data: $e');
      print('📚 Stack trace: $stackTrace');
    }
  }

  // Первичная загрузка
  await fetchData();

  // Отписываемся от старых подписок
  if (_appointmentsChannel != null) {
    await supabase.removeChannel(_appointmentsChannel!);
    _appointmentsChannel = null;
  }
  if (_clientsChannel != null) {
    await supabase.removeChannel(_clientsChannel!);
    _clientsChannel = null;
  }
  if (_mastersChannel != null) {
    await supabase.removeChannel(_mastersChannel!);
    _mastersChannel = null;
  }
  if (_servicesChannel != null) {
    await supabase.removeChannel(_servicesChannel!);
    _servicesChannel = null;
  }

  // Подписка на изменения в crm_appointments
  _appointmentsChannel = supabase
      .channel('appointments_changes_$organizationId')
      .onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: 'crm_appointments',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'organization_id',
          value: organizationId,
        ),
        callback: (payload) async {
          print('🔄 Appointment changed: ${payload.eventType}');
          await fetchData();
        },
      )
      .subscribe((status, [error]) {
    print('📡 Appointments channel: $status');
  });

  // Подписка на изменения в crm_clients
  _clientsChannel = supabase
      .channel('clients_changes_$organizationId')
      .onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: 'crm_clients',
        callback: (payload) async {
          print('🔄 Client changed: ${payload.eventType}');
          await fetchData();
        },
      )
      .subscribe((status, [error]) {
    print('📡 Clients channel: $status');
  });

  // Подписка на изменения в crm_masters
  _mastersChannel = supabase
      .channel('masters_changes_$organizationId')
      .onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: 'crm_masters',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'organization_id',
          value: organizationId,
        ),
        callback: (payload) async {
          print('🔄 Master changed: ${payload.eventType}');
          await fetchData();
        },
      )
      .subscribe((status, [error]) {
    print('📡 Masters channel: $status');
  });

  // Подписка на изменения в crm_services
  _servicesChannel = supabase
      .channel('services_changes_$organizationId')
      .onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: 'crm_services',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'organization_id',
          value: organizationId,
        ),
        callback: (payload) async {
          print('🔄 Service changed: ${payload.eventType}');
          await fetchData();
        },
      )
      .subscribe((status, [error]) {
    print('📡 Services channel: $status');
  });

  print('✅ Subscribed to real-time updates for organization: $organizationId');
}
