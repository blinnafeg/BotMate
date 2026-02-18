// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WidgetsStylesStruct extends BaseStruct {
  WidgetsStylesStruct({
    String? wgHeader,
    String? wgFormAppointment,
  })  : _wgHeader = wgHeader,
        _wgFormAppointment = wgFormAppointment;

  // "WG_HEADER" field.
  String? _wgHeader;
  String get wgHeader => _wgHeader ?? '';
  set wgHeader(String? val) => _wgHeader = val;

  bool hasWgHeader() => _wgHeader != null;

  // "WG_FORM_APPOINTMENT" field.
  String? _wgFormAppointment;
  String get wgFormAppointment => _wgFormAppointment ?? '';
  set wgFormAppointment(String? val) => _wgFormAppointment = val;

  bool hasWgFormAppointment() => _wgFormAppointment != null;

  static WidgetsStylesStruct fromMap(Map<String, dynamic> data) =>
      WidgetsStylesStruct(
        wgHeader: data['WG_HEADER'] as String?,
        wgFormAppointment: data['WG_FORM_APPOINTMENT'] as String?,
      );

  static WidgetsStylesStruct? maybeFromMap(dynamic data) => data is Map
      ? WidgetsStylesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'WG_HEADER': _wgHeader,
        'WG_FORM_APPOINTMENT': _wgFormAppointment,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'WG_HEADER': serializeParam(
          _wgHeader,
          ParamType.String,
        ),
        'WG_FORM_APPOINTMENT': serializeParam(
          _wgFormAppointment,
          ParamType.String,
        ),
      }.withoutNulls;

  static WidgetsStylesStruct fromSerializableMap(Map<String, dynamic> data) =>
      WidgetsStylesStruct(
        wgHeader: deserializeParam(
          data['WG_HEADER'],
          ParamType.String,
          false,
        ),
        wgFormAppointment: deserializeParam(
          data['WG_FORM_APPOINTMENT'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WidgetsStylesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WidgetsStylesStruct &&
        wgHeader == other.wgHeader &&
        wgFormAppointment == other.wgFormAppointment;
  }

  @override
  int get hashCode => const ListEquality().hash([wgHeader, wgFormAppointment]);
}

WidgetsStylesStruct createWidgetsStylesStruct({
  String? wgHeader,
  String? wgFormAppointment,
}) =>
    WidgetsStylesStruct(
      wgHeader: wgHeader,
      wgFormAppointment: wgFormAppointment,
    );
