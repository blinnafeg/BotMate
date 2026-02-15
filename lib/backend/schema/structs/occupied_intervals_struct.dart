// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OccupiedIntervalsStruct extends BaseStruct {
  OccupiedIntervalsStruct({
    String? startTime,
    String? endTime,
    String? serviceName,
  })  : _startTime = startTime,
        _endTime = endTime,
        _serviceName = serviceName;

  // "startTime" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  set endTime(String? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "serviceName" field.
  String? _serviceName;
  String get serviceName => _serviceName ?? '';
  set serviceName(String? val) => _serviceName = val;

  bool hasServiceName() => _serviceName != null;

  static OccupiedIntervalsStruct fromMap(Map<String, dynamic> data) =>
      OccupiedIntervalsStruct(
        startTime: data['startTime'] as String?,
        endTime: data['endTime'] as String?,
        serviceName: data['serviceName'] as String?,
      );

  static OccupiedIntervalsStruct? maybeFromMap(dynamic data) => data is Map
      ? OccupiedIntervalsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'startTime': _startTime,
        'endTime': _endTime,
        'serviceName': _serviceName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startTime': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.String,
        ),
        'serviceName': serializeParam(
          _serviceName,
          ParamType.String,
        ),
      }.withoutNulls;

  static OccupiedIntervalsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OccupiedIntervalsStruct(
        startTime: deserializeParam(
          data['startTime'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.String,
          false,
        ),
        serviceName: deserializeParam(
          data['serviceName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OccupiedIntervalsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OccupiedIntervalsStruct &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        serviceName == other.serviceName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([startTime, endTime, serviceName]);
}

OccupiedIntervalsStruct createOccupiedIntervalsStruct({
  String? startTime,
  String? endTime,
  String? serviceName,
}) =>
    OccupiedIntervalsStruct(
      startTime: startTime,
      endTime: endTime,
      serviceName: serviceName,
    );
