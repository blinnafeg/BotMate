import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wg_form_appointment_widget.dart' show WgFormAppointmentWidget;
import 'package:flutter/material.dart';

class WgFormAppointmentModel extends FlutterFlowModel<WgFormAppointmentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - loadAvailableSlots] action in Button widget.
  List<String>? slotsDataDay1;
  // Stores action output result for [Custom Action - loadAvailableSlots] action in Button widget.
  List<String>? slotsDataWeek;
  // Stores action output result for [Custom Action - loadAvailableSlots] action in Button widget.
  List<String>? slotsDataFromMonths;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
