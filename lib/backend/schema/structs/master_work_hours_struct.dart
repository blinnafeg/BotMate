// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MasterWorkHoursStruct extends BaseStruct {
  MasterWorkHoursStruct({
    String? start,
    String? end,
    String? breakStart,
    String? breakEnd,
  })  : _start = start,
        _end = end,
        _breakStart = breakStart,
        _breakEnd = breakEnd;

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

  // "breakStart" field.
  String? _breakStart;
  String get breakStart => _breakStart ?? '';
  set breakStart(String? val) => _breakStart = val;

  bool hasBreakStart() => _breakStart != null;

  // "breakEnd" field.
  String? _breakEnd;
  String get breakEnd => _breakEnd ?? '';
  set breakEnd(String? val) => _breakEnd = val;

  bool hasBreakEnd() => _breakEnd != null;

  static MasterWorkHoursStruct fromMap(Map<String, dynamic> data) =>
      MasterWorkHoursStruct(
        start: data['start'] as String?,
        end: data['end'] as String?,
        breakStart: data['breakStart'] as String?,
        breakEnd: data['breakEnd'] as String?,
      );

  static MasterWorkHoursStruct? maybeFromMap(dynamic data) => data is Map
      ? MasterWorkHoursStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'start': _start,
        'end': _end,
        'breakStart': _breakStart,
        'breakEnd': _breakEnd,
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
        'breakStart': serializeParam(
          _breakStart,
          ParamType.String,
        ),
        'breakEnd': serializeParam(
          _breakEnd,
          ParamType.String,
        ),
      }.withoutNulls;

  static MasterWorkHoursStruct fromSerializableMap(Map<String, dynamic> data) =>
      MasterWorkHoursStruct(
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
        breakStart: deserializeParam(
          data['breakStart'],
          ParamType.String,
          false,
        ),
        breakEnd: deserializeParam(
          data['breakEnd'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MasterWorkHoursStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MasterWorkHoursStruct &&
        start == other.start &&
        end == other.end &&
        breakStart == other.breakStart &&
        breakEnd == other.breakEnd;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([start, end, breakStart, breakEnd]);
}

MasterWorkHoursStruct createMasterWorkHoursStruct({
  String? start,
  String? end,
  String? breakStart,
  String? breakEnd,
}) =>
    MasterWorkHoursStruct(
      start: start,
      end: end,
      breakStart: breakStart,
      breakEnd: breakEnd,
    );
