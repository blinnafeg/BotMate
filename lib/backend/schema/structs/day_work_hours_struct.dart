// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DayWorkHoursStruct extends BaseStruct {
  DayWorkHoursStruct({
    String? start,
    String? end,
    bool? isWorkingDay,
  })  : _start = start,
        _end = end,
        _isWorkingDay = isWorkingDay;

  // "start" field.
  String? _start;
  String get start => _start ?? '';
  set start(String? val) => _start = val;

  bool hasStart() => _start != null;

  // "end" field.
  String? _end;
  String get end => _end ?? '';
  set end(String? val) => _end = val;

  bool hasEnd() => _end != null;

  // "isWorkingDay" field.
  bool? _isWorkingDay;
  bool get isWorkingDay => _isWorkingDay ?? false;
  set isWorkingDay(bool? val) => _isWorkingDay = val;

  bool hasIsWorkingDay() => _isWorkingDay != null;

  static DayWorkHoursStruct fromMap(Map<String, dynamic> data) =>
      DayWorkHoursStruct(
        start: data['start'] as String?,
        end: data['end'] as String?,
        isWorkingDay: data['isWorkingDay'] as bool?,
      );

  static DayWorkHoursStruct? maybeFromMap(dynamic data) => data is Map
      ? DayWorkHoursStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'start': _start,
        'end': _end,
        'isWorkingDay': _isWorkingDay,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'start': serializeParam(
          _start,
          ParamType.String,
        ),
        'end': serializeParam(
          _end,
          ParamType.String,
        ),
        'isWorkingDay': serializeParam(
          _isWorkingDay,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DayWorkHoursStruct fromSerializableMap(Map<String, dynamic> data) =>
      DayWorkHoursStruct(
        start: deserializeParam(
          data['start'],
          ParamType.String,
          false,
        ),
        end: deserializeParam(
          data['end'],
          ParamType.String,
          false,
        ),
        isWorkingDay: deserializeParam(
          data['isWorkingDay'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DayWorkHoursStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DayWorkHoursStruct &&
        start == other.start &&
        end == other.end &&
        isWorkingDay == other.isWorkingDay;
  }

  @override
  int get hashCode => const ListEquality().hash([start, end, isWorkingDay]);
}

DayWorkHoursStruct createDayWorkHoursStruct({
  String? start,
  String? end,
  bool? isWorkingDay,
}) =>
    DayWorkHoursStruct(
      start: start,
      end: end,
      isWorkingDay: isWorkingDay,
    );
