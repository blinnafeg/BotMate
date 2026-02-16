// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WidgetsDataStruct extends BaseStruct {
  WidgetsDataStruct({
    AppointmentsPageDataStruct? appointmentsData,
    BookingFormDataStruct? bookingFormData,
  })  : _appointmentsData = appointmentsData,
        _bookingFormData = bookingFormData;

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

  // "bookingFormData" field.
  BookingFormDataStruct? _bookingFormData;
  BookingFormDataStruct get bookingFormData =>
      _bookingFormData ?? BookingFormDataStruct();
  set bookingFormData(BookingFormDataStruct? val) => _bookingFormData = val;

  void updateBookingFormData(Function(BookingFormDataStruct) updateFn) {
    updateFn(_bookingFormData ??= BookingFormDataStruct());
  }

  bool hasBookingFormData() => _bookingFormData != null;

  static WidgetsDataStruct fromMap(Map<String, dynamic> data) =>
      WidgetsDataStruct(
        appointmentsData: data['appointmentsData'] is AppointmentsPageDataStruct
            ? data['appointmentsData']
            : AppointmentsPageDataStruct.maybeFromMap(data['appointmentsData']),
        bookingFormData: data['bookingFormData'] is BookingFormDataStruct
            ? data['bookingFormData']
            : BookingFormDataStruct.maybeFromMap(data['bookingFormData']),
      );

  static WidgetsDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WidgetsDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'appointmentsData': _appointmentsData?.toMap(),
        'bookingFormData': _bookingFormData?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'appointmentsData': serializeParam(
          _appointmentsData,
          ParamType.DataStruct,
        ),
        'bookingFormData': serializeParam(
          _bookingFormData,
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
        bookingFormData: deserializeStructParam(
          data['bookingFormData'],
          ParamType.DataStruct,
          false,
          structBuilder: BookingFormDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WidgetsDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WidgetsDataStruct &&
        appointmentsData == other.appointmentsData &&
        bookingFormData == other.bookingFormData;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([appointmentsData, bookingFormData]);
}

WidgetsDataStruct createWidgetsDataStruct({
  AppointmentsPageDataStruct? appointmentsData,
  BookingFormDataStruct? bookingFormData,
}) =>
    WidgetsDataStruct(
      appointmentsData: appointmentsData ?? AppointmentsPageDataStruct(),
      bookingFormData: bookingFormData ?? BookingFormDataStruct(),
    );
