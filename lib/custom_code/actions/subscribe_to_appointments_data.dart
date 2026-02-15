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

// ⭐ ОСНОВНАЯ ФУНКЦИЯ ⭐
Future<void> subscribeToAppointmentsData(
  String organizationId,
  Future Function(AppointmentsPageDataStruct data) onDataUpdate,
) async {
  final supabase = SupaFlow.client;

  // Функция для загрузки данных
  Future<void> fetchData() async {
    try {
      print('📥 Fetching appointments data for organization: $organizationId');

      final response = await supabase.rpc(
        'get_appointments_page_data',
        params: {'org_id': organizationId},
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

        // Проверяем наличие новых полей
        if (dataMap['weekStats'] != null) {
          var weekStats = dataMap['weekStats'] as Map;

          // Проверяем dailySlots
          if (weekStats['dailySlots'] != null) {
            var dailySlots = weekStats['dailySlots'] as List;
            print('📅 dailySlots length: ${dailySlots.length}');
            if (dailySlots.isNotEmpty) {
              var firstSlot = dailySlots.first as Map;
              print(
                  '   - Has workloadByTime: ${firstSlot.containsKey('workloadByTime')}');
            }
          }

          // Проверяем appointments с timeInterval
          if (weekStats['appointments'] != null) {
            var appointments = weekStats['appointments'] as List;
            print('📋 appointments length: ${appointments.length}');
            if (appointments.isNotEmpty) {
              var firstAppt = appointments.first as Map;
              print(
                  '   - Has time_interval: ${firstAppt.containsKey('time_interval')}');
              if (firstAppt.containsKey('time_interval')) {
                print(
                    '   - time_interval example: ${firstAppt['time_interval']}');
              }
            }
          }
        }

        // Создаем структуру
        final appointmentsData = AppointmentsPageDataStruct.fromMap(dataMap);

        // Вызываем callback
        await onDataUpdate(appointmentsData);

        print('✅ Appointments data loaded successfully');
        print(
            '📊 Today appointments: ${appointmentsData.todayStats?.appointments?.length}');
        print(
            '📊 Week appointments: ${appointmentsData.weekStats?.appointments?.length}');
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
