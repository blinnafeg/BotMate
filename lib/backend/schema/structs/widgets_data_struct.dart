// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WidgetsDataStruct extends BaseStruct {
  WidgetsDataStruct({
    AppointmentsPageDataStruct? appointmentsData,
  }) : _appointmentsData = appointmentsData;

  // "appointmentsData" field.
  AppointmentsPageDataStruct? _appointmentsData;
  AppointmentsPageDataStruct get appointmentsData =>
      _appointmentsData ?? AppointmentsPageDataStruct();
  set appointmentsData(AppointmentsPageDataStruct? val) =>
      _appointmentsData = val;

  void updateAppointmentsData(Function(AppointmentsPageDataStruct) updateFn) {
    updateFn(_appointmentsData ??= AppointmentsPageDataStruct());
  }

  bool hasAppointmentsData() => _appointmentsData != null;

  static WidgetsDataStruct fromMap(Map<String, dynamic> data) =>
      WidgetsDataStruct(
        appointmentsData: data['appointmentsData'] is AppointmentsPageDataStruct
            ? data['appointmentsData']
            : AppointmentsPageDataStruct.maybeFromMap(data['appointmentsData']),
      );

  static WidgetsDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WidgetsDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'appointmentsData': _appointmentsData?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'appointmentsData': serializeParam(
          _appointmentsData,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static WidgetsDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      WidgetsDataStruct(
        appointmentsData: deserializeStructParam(
          data['appointmentsData'],
          ParamType.DataStruct,
          false,
          structBuilder: AppointmentsPageDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WidgetsDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WidgetsDataStruct &&
        appointmentsData == other.appointmentsData;
  }

  @override
  int get hashCode => const ListEquality().hash([appointmentsData]);
}

WidgetsDataStruct createWidgetsDataStruct({
  AppointmentsPageDataStruct? appointmentsData,
}) =>
    WidgetsDataStruct(
      appointmentsData: appointmentsData ?? AppointmentsPageDataStruct(),
    );
