// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeekStatsStruct extends BaseStruct {
  WeekStatsStruct({
    int? totalAppointments,
    int? pendingCount,
    int? confirmedCount,
    int? cancelledCount,
    int? expectedRevenue,
    double? workloadPercentage,
    List<DailySlotsStruct>? dailySlots,
    List<AppointmentsStruct>? appointments,
    List<MasterStatsStruct>? masterStats,
  })  : _totalAppointments = totalAppointments,
        _pendingCount = pendingCount,
        _confirmedCount = confirmedCount,
        _cancelledCount = cancelledCount,
        _expectedRevenue = expectedRevenue,
        _workloadPercentage = workloadPercentage,
        _dailySlots = dailySlots,
        _appointments = appointments,
        _masterStats = masterStats;

  // "totalAppointments" field.
  int? _totalAppointments;
  int get totalAppointments => _totalAppointments ?? 0;
  set totalAppointments(int? val) => _totalAppointments = val;

  void incrementTotalAppointments(int amount) =>
      totalAppointments = totalAppointments + amount;

  bool hasTotalAppointments() => _totalAppointments != null;

  // "pendingCount" field.
  int? _pendingCount;
  int get pendingCount => _pendingCount ?? 0;
  set pendingCount(int? val) => _pendingCount = val;

  void incrementPendingCount(int amount) =>
      pendingCount = pendingCount + amount;

  bool hasPendingCount() => _pendingCount != null;

  // "confirmedCount" field.
  int? _confirmedCount;
  int get confirmedCount => _confirmedCount ?? 0;
  set confirmedCount(int? val) => _confirmedCount = val;

  void incrementConfirmedCount(int amount) =>
      confirmedCount = confirmedCount + amount;

  bool hasConfirmedCount() => _confirmedCount != null;

  // "cancelledCount" field.
  int? _cancelledCount;
  int get cancelledCount => _cancelledCount ?? 0;
  set cancelledCount(int? val) => _cancelledCount = val;

  void incrementCancelledCount(int amount) =>
      cancelledCount = cancelledCount + amount;

  bool hasCancelledCount() => _cancelledCount != null;

  // "expectedRevenue" field.
  int? _expectedRevenue;
  int get expectedRevenue => _expectedRevenue ?? 0;
  set expectedRevenue(int? val) => _expectedRevenue = val;

  void incrementExpectedRevenue(int amount) =>
      expectedRevenue = expectedRevenue + amount;

  bool hasExpectedRevenue() => _expectedRevenue != null;

  // "workloadPercentage" field.
  double? _workloadPercentage;
  double get workloadPercentage => _workloadPercentage ?? 0.0;
  set workloadPercentage(double? val) => _workloadPercentage = val;

  void incrementWorkloadPercentage(double amount) =>
      workloadPercentage = workloadPercentage + amount;

  bool hasWorkloadPercentage() => _workloadPercentage != null;

  // "dailySlots" field.
  List<DailySlotsStruct>? _dailySlots;
  List<DailySlotsStruct> get dailySlots => _dailySlots ?? const [];
  set dailySlots(List<DailySlotsStruct>? val) => _dailySlots = val;

  void updateDailySlots(Function(List<DailySlotsStruct>) updateFn) {
    updateFn(_dailySlots ??= []);
  }

  bool hasDailySlots() => _dailySlots != null;

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

  static WeekStatsStruct fromMap(Map<String, dynamic> data) => WeekStatsStruct(
        totalAppointments: castToType<int>(data['totalAppointments']),
        pendingCount: castToType<int>(data['pendingCount']),
        confirmedCount: castToType<int>(data['confirmedCount']),
        cancelledCount: castToType<int>(data['cancelledCount']),
        expectedRevenue: castToType<int>(data['expectedRevenue']),
        workloadPercentage: castToType<double>(data['workloadPercentage']),
        dailySlots: getStructList(
          data['dailySlots'],
          DailySlotsStruct.fromMap,
        ),
        appointments: getStructList(
          data['appointments'],
          AppointmentsStruct.fromMap,
        ),
        masterStats: getStructList(
          data['masterStats'],
          MasterStatsStruct.fromMap,
        ),
      );

  static WeekStatsStruct? maybeFromMap(dynamic data) => data is Map
      ? WeekStatsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalAppointments': _totalAppointments,
        'pendingCount': _pendingCount,
        'confirmedCount': _confirmedCount,
        'cancelledCount': _cancelledCount,
        'expectedRevenue': _expectedRevenue,
        'workloadPercentage': _workloadPercentage,
        'dailySlots': _dailySlots?.map((e) => e.toMap()).toList(),
        'appointments': _appointments?.map((e) => e.toMap()).toList(),
        'masterStats': _masterStats?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalAppointments': serializeParam(
          _totalAppointments,
          ParamType.int,
        ),
        'pendingCount': serializeParam(
          _pendingCount,
          ParamType.int,
        ),
        'confirmedCount': serializeParam(
          _confirmedCount,
          ParamType.int,
        ),
        'cancelledCount': serializeParam(
          _cancelledCount,
          ParamType.int,
        ),
        'expectedRevenue': serializeParam(
          _expectedRevenue,
          ParamType.int,
        ),
        'workloadPercentage': serializeParam(
          _workloadPercentage,
          ParamType.double,
        ),
        'dailySlots': serializeParam(
          _dailySlots,
          ParamType.DataStruct,
          isList: true,
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

  static WeekStatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeekStatsStruct(
        totalAppointments: deserializeParam(
          data['totalAppointments'],
          ParamType.int,
          false,
        ),
        pendingCount: deserializeParam(
          data['pendingCount'],
          ParamType.int,
          false,
        ),
        confirmedCount: deserializeParam(
          data['confirmedCount'],
          ParamType.int,
          false,
        ),
        cancelledCount: deserializeParam(
          data['cancelledCount'],
          ParamType.int,
          false,
        ),
        expectedRevenue: deserializeParam(
          data['expectedRevenue'],
          ParamType.int,
          false,
        ),
        workloadPercentage: deserializeParam(
          data['workloadPercentage'],
          ParamType.double,
          false,
        ),
        dailySlots: deserializeStructParam<DailySlotsStruct>(
          data['dailySlots'],
          ParamType.DataStruct,
          true,
          structBuilder: DailySlotsStruct.fromSerializableMap,
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
  String toString() => 'WeekStatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WeekStatsStruct &&
        totalAppointments == other.totalAppointments &&
        pendingCount == other.pendingCount &&
        confirmedCount == other.confirmedCount &&
        cancelledCount == other.cancelledCount &&
        expectedRevenue == other.expectedRevenue &&
        workloadPercentage == other.workloadPercentage &&
        listEquality.equals(dailySlots, other.dailySlots) &&
        listEquality.equals(appointments, other.appointments) &&
        listEquality.equals(masterStats, other.masterStats);
  }

  @override
  int get hashCode => const ListEquality().hash([
        totalAppointments,
        pendingCount,
        confirmedCount,
        cancelledCount,
        expectedRevenue,
        workloadPercentage,
        dailySlots,
        appointments,
        masterStats
      ]);
}

WeekStatsStruct createWeekStatsStruct({
  int? totalAppointments,
  int? pendingCount,
  int? confirmedCount,
  int? cancelledCount,
  int? expectedRevenue,
  double? workloadPercentage,
}) =>
    WeekStatsStruct(
      totalAppointments: totalAppointments,
      pendingCount: pendingCount,
      confirmedCount: confirmedCount,
      cancelledCount: cancelledCount,
      expectedRevenue: expectedRevenue,
      workloadPercentage: workloadPercentage,
    );
