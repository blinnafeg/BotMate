// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkHoursInfoStruct extends BaseStruct {
  WorkHoursInfoStruct({
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

  static WorkHoursInfoStruct fromMap(Map<String, dynamic> data) =>
      WorkHoursInfoStruct(
        start: data['start'] as String?,
        end: data['end'] as String?,
        isWorkingDay: data['isWorkingDay'] as bool?,
      );

  static WorkHoursInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkHoursInfoStruct.fromMap(data.cast<String, dynamic>())
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

  static WorkHoursInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkHoursInfoStruct(
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
  String toString() => 'WorkHoursInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorkHoursInfoStruct &&
        start == other.start &&
        end == other.end &&
        isWorkingDay == other.isWorkingDay;
  }

  @override
  int get hashCode => const ListEquality().hash([start, end, isWorkingDay]);
}

WorkHoursInfoStruct createWorkHoursInfoStruct({
  String? start,
  String? end,
  bool? isWorkingDay,
}) =>
    WorkHoursInfoStruct(
      start: start,
      end: end,
      isWorkingDay: isWorkingDay,
    );
