// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DaydateStruct extends BaseStruct {
  DaydateStruct({
    String? day,
    DateTime? date,
  })  : _day = day,
        _date = date;

  // "DAY" field.
  String? _day;
  String get day => _day ?? '';
  set day(String? val) => _day = val;

  bool hasDay() => _day != null;

  // "DATE" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static DaydateStruct fromMap(Map<String, dynamic> data) => DaydateStruct(
        day: data['DAY'] as String?,
        date: data['DATE'] as DateTime?,
      );

  static DaydateStruct? maybeFromMap(dynamic data) =>
      data is Map ? DaydateStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'DAY': _day,
        'DATE': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'DAY': serializeParam(
          _day,
          ParamType.String,
        ),
        'DATE': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DaydateStruct fromSerializableMap(Map<String, dynamic> data) =>
      DaydateStruct(
        day: deserializeParam(
          data['DAY'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['DATE'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DaydateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DaydateStruct && day == other.day && date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([day, date]);
}

DaydateStruct createDaydateStruct({
  String? day,
  DateTime? date,
}) =>
    DaydateStruct(
      day: day,
      date: date,
    );
