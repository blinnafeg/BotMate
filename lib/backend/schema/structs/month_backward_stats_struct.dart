// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MonthBackwardStatsStruct extends BaseStruct {
  MonthBackwardStatsStruct({
    int? totalAppointments,
    int? completedCount,
    int? actualRevenue,
    List<AppointmentsStruct>? appointments,
    List<MasterStatsStruct>? masterStats,
  })  : _totalAppointments = totalAppointments,
        _completedCount = completedCount,
        _actualRevenue = actualRevenue,
        _appointments = appointments,
        _masterStats = masterStats;

  // "totalAppointments" field.
  int? _totalAppointments;
  int get totalAppointments => _totalAppointments ?? 0;
  set totalAppointments(int? val) => _totalAppointments = val;

  void incrementTotalAppointments(int amount) =>
      totalAppointments = totalAppointments + amount;

  bool hasTotalAppointments() => _totalAppointments != null;

  // "completedCount" field.
  int? _completedCount;
  int get completedCount => _completedCount ?? 0;
  set completedCount(int? val) => _completedCount = val;

  void incrementCompletedCount(int amount) =>
      completedCount = completedCount + amount;

  bool hasCompletedCount() => _completedCount != null;

  // "actualRevenue" field.
  int? _actualRevenue;
  int get actualRevenue => _actualRevenue ?? 0;
  set actualRevenue(int? val) => _actualRevenue = val;

  void incrementActualRevenue(int amount) =>
      actualRevenue = actualRevenue + amount;

  bool hasActualRevenue() => _actualRevenue != null;

  // "appointments" field.
  List<AppointmentsStruct>? _appointments;
  List<AppointmentsStruct> get appointments => _appointments ?? const [];
  set appointments(List<AppointmentsStruct>? val) => _appointments = val;

  void updateAppointments(Function(List<AppointmentsStruct>) updateFn) {
    updateFn(_appointments ??= []);
  }

  bool hasAppointments() => _appointments != null;

  // "masterStats" field.
  List<MasterStatsStruct>? _masterStats;
  List<MasterStatsStruct> get masterStats => _masterStats ?? const [];
  set masterStats(List<MasterStatsStruct>? val) => _masterStats = val;

  void updateMasterStats(Function(List<MasterStatsStruct>) updateFn) {
    updateFn(_masterStats ??= []);
  }

  bool hasMasterStats() => _masterStats != null;

  static MonthBackwardStatsStruct fromMap(Map<String, dynamic> data) =>
      MonthBackwardStatsStruct(
        totalAppointments: castToType<int>(data['totalAppointments']),
        completedCount: castToType<int>(data['completedCount']),
        actualRevenue: castToType<int>(data['actualRevenue']),
        appointments: getStructList(
          data['appointments'],
          AppointmentsStruct.fromMap,
        ),
        masterStats: getStructList(
          data['masterStats'],
          MasterStatsStruct.fromMap,
        ),
      );

  static MonthBackwardStatsStruct? maybeFromMap(dynamic data) => data is Map
      ? MonthBackwardStatsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalAppointments': _totalAppointments,
        'completedCount': _completedCount,
        'actualRevenue': _actualRevenue,
        'appointments': _appointments?.map((e) => e.toMap()).toList(),
        'masterStats': _masterStats?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalAppointments': serializeParam(
          _totalAppointments,
          ParamType.int,
        ),
        'completedCount': serializeParam(
          _completedCount,
          ParamType.int,
        ),
        'actualRevenue': serializeParam(
          _actualRevenue,
          ParamType.int,
        ),
        'appointments': serializeParam(
          _appointments,
          ParamType.DataStruct,
          isList: true,
        ),
        'masterStats': serializeParam(
          _masterStats,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MonthBackwardStatsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MonthBackwardStatsStruct(
        totalAppointments: deserializeParam(
          data['totalAppointments'],
          ParamType.int,
          false,
        ),
        completedCount: deserializeParam(
          data['completedCount'],
          ParamType.int,
          false,
        ),
        actualRevenue: deserializeParam(
          data['actualRevenue'],
          ParamType.int,
          false,
        ),
        appointments: deserializeStructParam<AppointmentsStruct>(
          data['appointments'],
          ParamType.DataStruct,
          true,
          structBuilder: AppointmentsStruct.fromSerializableMap,
        ),
        masterStats: deserializeStructParam<MasterStatsStruct>(
          data['masterStats'],
          ParamType.DataStruct,
          true,
          structBuilder: MasterStatsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MonthBackwardStatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MonthBackwardStatsStruct &&
        totalAppointments == other.totalAppointments &&
        completedCount == other.completedCount &&
        actualRevenue == other.actualRevenue &&
        listEquality.equals(appointments, other.appointments) &&
        listEquality.equals(masterStats, other.masterStats);
  }

  @override
  int get hashCode => const ListEquality().hash([
        totalAppointments,
        completedCount,
        actualRevenue,
        appointments,
        masterStats
      ]);
}

MonthBackwardStatsStruct createMonthBackwardStatsStruct({
  int? totalAppointments,
  int? completedCount,
  int? actualRevenue,
}) =>
    MonthBackwardStatsStruct(
      totalAppointments: totalAppointments,
      completedCount: completedCount,
      actualRevenue: actualRevenue,
    );
