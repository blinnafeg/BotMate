// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TodayStatsStruct extends BaseStruct {
  TodayStatsStruct({
    int? totalAppointments,
    int? completedCount,
    int? pendingCount,
    int? confirmedCount,
    int? cancelledCount,
    int? expectedRevenue,
    int? actualRevenue,
    double? workloadPercentage,
    WorkHoursInfoStruct? workHoursInfo,
    List<AvailableSlotsStruct>? availableSlots,
    List<AppointmentsStruct>? appointments,
    List<MasterStatsStruct>? masterStats,
  })  : _totalAppointments = totalAppointments,
        _completedCount = completedCount,
        _pendingCount = pendingCount,
        _confirmedCount = confirmedCount,
        _cancelledCount = cancelledCount,
        _expectedRevenue = expectedRevenue,
        _actualRevenue = actualRevenue,
        _workloadPercentage = workloadPercentage,
        _workHoursInfo = workHoursInfo,
        _availableSlots = availableSlots,
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

  // "actualRevenue" field.
  int? _actualRevenue;
  int get actualRevenue => _actualRevenue ?? 0;
  set actualRevenue(int? val) => _actualRevenue = val;

  void incrementActualRevenue(int amount) =>
      actualRevenue = actualRevenue + amount;

  bool hasActualRevenue() => _actualRevenue != null;

  // "workloadPercentage" field.
  double? _workloadPercentage;
  double get workloadPercentage => _workloadPercentage ?? 0.0;
  set workloadPercentage(double? val) => _workloadPercentage = val;

  void incrementWorkloadPercentage(double amount) =>
      workloadPercentage = workloadPercentage + amount;

  bool hasWorkloadPercentage() => _workloadPercentage != null;

  // "workHoursInfo" field.
  WorkHoursInfoStruct? _workHoursInfo;
  WorkHoursInfoStruct get workHoursInfo =>
      _workHoursInfo ?? WorkHoursInfoStruct();
  set workHoursInfo(WorkHoursInfoStruct? val) => _workHoursInfo = val;

  void updateWorkHoursInfo(Function(WorkHoursInfoStruct) updateFn) {
    updateFn(_workHoursInfo ??= WorkHoursInfoStruct());
  }

  bool hasWorkHoursInfo() => _workHoursInfo != null;

  // "availableSlots" field.
  List<AvailableSlotsStruct>? _availableSlots;
  List<AvailableSlotsStruct> get availableSlots => _availableSlots ?? const [];
  set availableSlots(List<AvailableSlotsStruct>? val) => _availableSlots = val;

  void updateAvailableSlots(Function(List<AvailableSlotsStruct>) updateFn) {
    updateFn(_availableSlots ??= []);
  }

  bool hasAvailableSlots() => _availableSlots != null;

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

  static TodayStatsStruct fromMap(Map<String, dynamic> data) =>
      TodayStatsStruct(
        totalAppointments: castToType<int>(data['totalAppointments']),
        completedCount: castToType<int>(data['completedCount']),
        pendingCount: castToType<int>(data['pendingCount']),
        confirmedCount: castToType<int>(data['confirmedCount']),
        cancelledCount: castToType<int>(data['cancelledCount']),
        expectedRevenue: castToType<int>(data['expectedRevenue']),
        actualRevenue: castToType<int>(data['actualRevenue']),
        workloadPercentage: castToType<double>(data['workloadPercentage']),
        workHoursInfo: data['workHoursInfo'] is WorkHoursInfoStruct
            ? data['workHoursInfo']
            : WorkHoursInfoStruct.maybeFromMap(data['workHoursInfo']),
        availableSlots: getStructList(
          data['availableSlots'],
          AvailableSlotsStruct.fromMap,
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

  static TodayStatsStruct? maybeFromMap(dynamic data) => data is Map
      ? TodayStatsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalAppointments': _totalAppointments,
        'completedCount': _completedCount,
        'pendingCount': _pendingCount,
        'confirmedCount': _confirmedCount,
        'cancelledCount': _cancelledCount,
        'expectedRevenue': _expectedRevenue,
        'actualRevenue': _actualRevenue,
        'workloadPercentage': _workloadPercentage,
        'workHoursInfo': _workHoursInfo?.toMap(),
        'availableSlots': _availableSlots?.map((e) => e.toMap()).toList(),
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
        'actualRevenue': serializeParam(
          _actualRevenue,
          ParamType.int,
        ),
        'workloadPercentage': serializeParam(
          _workloadPercentage,
          ParamType.double,
        ),
        'workHoursInfo': serializeParam(
          _workHoursInfo,
          ParamType.DataStruct,
        ),
        'availableSlots': serializeParam(
          _availableSlots,
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

  static TodayStatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TodayStatsStruct(
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
        actualRevenue: deserializeParam(
          data['actualRevenue'],
          ParamType.int,
          false,
        ),
        workloadPercentage: deserializeParam(
          data['workloadPercentage'],
          ParamType.double,
          false,
        ),
        workHoursInfo: deserializeStructParam(
          data['workHoursInfo'],
          ParamType.DataStruct,
          false,
          structBuilder: WorkHoursInfoStruct.fromSerializableMap,
        ),
        availableSlots: deserializeStructParam<AvailableSlotsStruct>(
          data['availableSlots'],
          ParamType.DataStruct,
          true,
          structBuilder: AvailableSlotsStruct.fromSerializableMap,
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
  String toString() => 'TodayStatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TodayStatsStruct &&
        totalAppointments == other.totalAppointments &&
        completedCount == other.completedCount &&
        pendingCount == other.pendingCount &&
        confirmedCount == other.confirmedCount &&
        cancelledCount == other.cancelledCount &&
        expectedRevenue == other.expectedRevenue &&
        actualRevenue == other.actualRevenue &&
        workloadPercentage == other.workloadPercentage &&
        workHoursInfo == other.workHoursInfo &&
        listEquality.equals(availableSlots, other.availableSlots) &&
        listEquality.equals(appointments, other.appointments) &&
        listEquality.equals(masterStats, other.masterStats);
  }

  @override
  int get hashCode => const ListEquality().hash([
        totalAppointments,
        completedCount,
        pendingCount,
        confirmedCount,
        cancelledCount,
        expectedRevenue,
        actualRevenue,
        workloadPercentage,
        workHoursInfo,
        availableSlots,
        appointments,
        masterStats
      ]);
}

TodayStatsStruct createTodayStatsStruct({
  int? totalAppointments,
  int? completedCount,
  int? pendingCount,
  int? confirmedCount,
  int? cancelledCount,
  int? expectedRevenue,
  int? actualRevenue,
  double? workloadPercentage,
  WorkHoursInfoStruct? workHoursInfo,
}) =>
    TodayStatsStruct(
      totalAppointments: totalAppointments,
      completedCount: completedCount,
      pendingCount: pendingCount,
      confirmedCount: confirmedCount,
      cancelledCount: cancelledCount,
      expectedRevenue: expectedRevenue,
      actualRevenue: actualRevenue,
      workloadPercentage: workloadPercentage,
      workHoursInfo: workHoursInfo ?? WorkHoursInfoStruct(),
    );
