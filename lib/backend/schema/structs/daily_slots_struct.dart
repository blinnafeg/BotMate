// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailySlotsStruct extends BaseStruct {
  DailySlotsStruct({
    String? date,
    DayWorkHoursStruct? dayWorkHours,
    int? totalSlots,
    int? bookedSlots,
    int? availableSlots,
    double? workloadByTime,
  })  : _date = date,
        _dayWorkHours = dayWorkHours,
        _totalSlots = totalSlots,
        _bookedSlots = bookedSlots,
        _availableSlots = availableSlots,
        _workloadByTime = workloadByTime;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "dayWorkHours" field.
  DayWorkHoursStruct? _dayWorkHours;
  DayWorkHoursStruct get dayWorkHours => _dayWorkHours ?? DayWorkHoursStruct();
  set dayWorkHours(DayWorkHoursStruct? val) => _dayWorkHours = val;

  void updateDayWorkHours(Function(DayWorkHoursStruct) updateFn) {
    updateFn(_dayWorkHours ??= DayWorkHoursStruct());
  }

  bool hasDayWorkHours() => _dayWorkHours != null;

  // "totalSlots" field.
  int? _totalSlots;
  int get totalSlots => _totalSlots ?? 0;
  set totalSlots(int? val) => _totalSlots = val;

  void incrementTotalSlots(int amount) => totalSlots = totalSlots + amount;

  bool hasTotalSlots() => _totalSlots != null;

  // "bookedSlots" field.
  int? _bookedSlots;
  int get bookedSlots => _bookedSlots ?? 0;
  set bookedSlots(int? val) => _bookedSlots = val;

  void incrementBookedSlots(int amount) => bookedSlots = bookedSlots + amount;

  bool hasBookedSlots() => _bookedSlots != null;

  // "availableSlots" field.
  int? _availableSlots;
  int get availableSlots => _availableSlots ?? 0;
  set availableSlots(int? val) => _availableSlots = val;

  void incrementAvailableSlots(int amount) =>
      availableSlots = availableSlots + amount;

  bool hasAvailableSlots() => _availableSlots != null;

  // "workloadByTime" field.
  double? _workloadByTime;
  double get workloadByTime => _workloadByTime ?? 0.0;
  set workloadByTime(double? val) => _workloadByTime = val;

  void incrementWorkloadByTime(double amount) =>
      workloadByTime = workloadByTime + amount;

  bool hasWorkloadByTime() => _workloadByTime != null;

  static DailySlotsStruct fromMap(Map<String, dynamic> data) =>
      DailySlotsStruct(
        date: data['date'] as String?,
        dayWorkHours: data['dayWorkHours'] is DayWorkHoursStruct
            ? data['dayWorkHours']
            : DayWorkHoursStruct.maybeFromMap(data['dayWorkHours']),
        totalSlots: castToType<int>(data['totalSlots']),
        bookedSlots: castToType<int>(data['bookedSlots']),
        availableSlots: castToType<int>(data['availableSlots']),
        workloadByTime: castToType<double>(data['workloadByTime']),
      );

  static DailySlotsStruct? maybeFromMap(dynamic data) => data is Map
      ? DailySlotsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'dayWorkHours': _dayWorkHours?.toMap(),
        'totalSlots': _totalSlots,
        'bookedSlots': _bookedSlots,
        'availableSlots': _availableSlots,
        'workloadByTime': _workloadByTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'dayWorkHours': serializeParam(
          _dayWorkHours,
          ParamType.DataStruct,
        ),
        'totalSlots': serializeParam(
          _totalSlots,
          ParamType.int,
        ),
        'bookedSlots': serializeParam(
          _bookedSlots,
          ParamType.int,
        ),
        'availableSlots': serializeParam(
          _availableSlots,
          ParamType.int,
        ),
        'workloadByTime': serializeParam(
          _workloadByTime,
          ParamType.double,
        ),
      }.withoutNulls;

  static DailySlotsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DailySlotsStruct(
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        dayWorkHours: deserializeStructParam(
          data['dayWorkHours'],
          ParamType.DataStruct,
          false,
          structBuilder: DayWorkHoursStruct.fromSerializableMap,
        ),
        totalSlots: deserializeParam(
          data['totalSlots'],
          ParamType.int,
          false,
        ),
        bookedSlots: deserializeParam(
          data['bookedSlots'],
          ParamType.int,
          false,
        ),
        availableSlots: deserializeParam(
          data['availableSlots'],
          ParamType.int,
          false,
        ),
        workloadByTime: deserializeParam(
          data['workloadByTime'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DailySlotsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DailySlotsStruct &&
        date == other.date &&
        dayWorkHours == other.dayWorkHours &&
        totalSlots == other.totalSlots &&
        bookedSlots == other.bookedSlots &&
        availableSlots == other.availableSlots &&
        workloadByTime == other.workloadByTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        date,
        dayWorkHours,
        totalSlots,
        bookedSlots,
        availableSlots,
        workloadByTime
      ]);
}

DailySlotsStruct createDailySlotsStruct({
  String? date,
  DayWorkHoursStruct? dayWorkHours,
  int? totalSlots,
  int? bookedSlots,
  int? availableSlots,
  double? workloadByTime,
}) =>
    DailySlotsStruct(
      date: date,
      dayWorkHours: dayWorkHours ?? DayWorkHoursStruct(),
      totalSlots: totalSlots,
      bookedSlots: bookedSlots,
      availableSlots: availableSlots,
      workloadByTime: workloadByTime,
    );
