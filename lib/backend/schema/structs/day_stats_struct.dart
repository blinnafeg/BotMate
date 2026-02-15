// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DayStatsStruct extends BaseStruct {
  DayStatsStruct({
    double? appointmentsCount,
    double? workloadPercentage,
    double? totalSlots,
    double? bookedSlots,
    double? availableSlots,
  })  : _appointmentsCount = appointmentsCount,
        _workloadPercentage = workloadPercentage,
        _totalSlots = totalSlots,
        _bookedSlots = bookedSlots,
        _availableSlots = availableSlots;

  // "appointmentsCount" field.
  double? _appointmentsCount;
  double get appointmentsCount => _appointmentsCount ?? 0.0;
  set appointmentsCount(double? val) => _appointmentsCount = val;

  void incrementAppointmentsCount(double amount) =>
      appointmentsCount = appointmentsCount + amount;

  bool hasAppointmentsCount() => _appointmentsCount != null;

  // "workloadPercentage" field.
  double? _workloadPercentage;
  double get workloadPercentage => _workloadPercentage ?? 0.0;
  set workloadPercentage(double? val) => _workloadPercentage = val;

  void incrementWorkloadPercentage(double amount) =>
      workloadPercentage = workloadPercentage + amount;

  bool hasWorkloadPercentage() => _workloadPercentage != null;

  // "totalSlots" field.
  double? _totalSlots;
  double get totalSlots => _totalSlots ?? 0.0;
  set totalSlots(double? val) => _totalSlots = val;

  void incrementTotalSlots(double amount) => totalSlots = totalSlots + amount;

  bool hasTotalSlots() => _totalSlots != null;

  // "bookedSlots" field.
  double? _bookedSlots;
  double get bookedSlots => _bookedSlots ?? 0.0;
  set bookedSlots(double? val) => _bookedSlots = val;

  void incrementBookedSlots(double amount) =>
      bookedSlots = bookedSlots + amount;

  bool hasBookedSlots() => _bookedSlots != null;

  // "availableSlots" field.
  double? _availableSlots;
  double get availableSlots => _availableSlots ?? 0.0;
  set availableSlots(double? val) => _availableSlots = val;

  void incrementAvailableSlots(double amount) =>
      availableSlots = availableSlots + amount;

  bool hasAvailableSlots() => _availableSlots != null;

  static DayStatsStruct fromMap(Map<String, dynamic> data) => DayStatsStruct(
        appointmentsCount: castToType<double>(data['appointmentsCount']),
        workloadPercentage: castToType<double>(data['workloadPercentage']),
        totalSlots: castToType<double>(data['totalSlots']),
        bookedSlots: castToType<double>(data['bookedSlots']),
        availableSlots: castToType<double>(data['availableSlots']),
      );

  static DayStatsStruct? maybeFromMap(dynamic data) =>
      data is Map ? DayStatsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'appointmentsCount': _appointmentsCount,
        'workloadPercentage': _workloadPercentage,
        'totalSlots': _totalSlots,
        'bookedSlots': _bookedSlots,
        'availableSlots': _availableSlots,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'appointmentsCount': serializeParam(
          _appointmentsCount,
          ParamType.double,
        ),
        'workloadPercentage': serializeParam(
          _workloadPercentage,
          ParamType.double,
        ),
        'totalSlots': serializeParam(
          _totalSlots,
          ParamType.double,
        ),
        'bookedSlots': serializeParam(
          _bookedSlots,
          ParamType.double,
        ),
        'availableSlots': serializeParam(
          _availableSlots,
          ParamType.double,
        ),
      }.withoutNulls;

  static DayStatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DayStatsStruct(
        appointmentsCount: deserializeParam(
          data['appointmentsCount'],
          ParamType.double,
          false,
        ),
        workloadPercentage: deserializeParam(
          data['workloadPercentage'],
          ParamType.double,
          false,
        ),
        totalSlots: deserializeParam(
          data['totalSlots'],
          ParamType.double,
          false,
        ),
        bookedSlots: deserializeParam(
          data['bookedSlots'],
          ParamType.double,
          false,
        ),
        availableSlots: deserializeParam(
          data['availableSlots'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DayStatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DayStatsStruct &&
        appointmentsCount == other.appointmentsCount &&
        workloadPercentage == other.workloadPercentage &&
        totalSlots == other.totalSlots &&
        bookedSlots == other.bookedSlots &&
        availableSlots == other.availableSlots;
  }

  @override
  int get hashCode => const ListEquality().hash([
        appointmentsCount,
        workloadPercentage,
        totalSlots,
        bookedSlots,
        availableSlots
      ]);
}

DayStatsStruct createDayStatsStruct({
  double? appointmentsCount,
  double? workloadPercentage,
  double? totalSlots,
  double? bookedSlots,
  double? availableSlots,
}) =>
    DayStatsStruct(
      appointmentsCount: appointmentsCount,
      workloadPercentage: workloadPercentage,
      totalSlots: totalSlots,
      bookedSlots: bookedSlots,
      availableSlots: availableSlots,
    );
