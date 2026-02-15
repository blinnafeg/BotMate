import '/backend/schema/structs/index.dart';
import '/components/w_i_d_g_e_trecordscalendar_widget.dart';
import '/components/w_i_d_g_e_tsearchrecord_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'appointments_widget.dart' show AppointmentsWidget;
import 'package:flutter/material.dart';

class AppointmentsModel extends FlutterFlowModel<AppointmentsWidget> {
  ///  Local state fields for this page.

  bool servicerecordVISIBILITY = false;

  bool searchrecordVISIBILITY = false;

  bool mainVISIBILITY = true;

  bool searchresultsVISIBILITY = false;

  bool leadschedulerVISIBILITY = true;

  AppointmentsPageDataStruct? appointmentsData;
  void updateAppointmentsDataStruct(
      Function(AppointmentsPageDataStruct) updateFn) {
    updateFn(appointmentsData ??= AppointmentsPageDataStruct());
  }

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue2;
  FormFieldController<List<String>>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Stores action output result for [Custom Action - show24HourTimePicker] action in Button widget.
  DateTime? selectedTime;
  // Model for WIDGETsearchrecord component.
  late WIDGETsearchrecordModel wIDGETsearchrecordModel;
  // Model for WIDGETrecordscalendar component.
  late WIDGETrecordscalendarModel wIDGETrecordscalendarModel;

  @override
  void initState(BuildContext context) {
    wIDGETsearchrecordModel =
        createModel(context, () => WIDGETsearchrecordModel());
    wIDGETrecordscalendarModel =
        createModel(context, () => WIDGETrecordscalendarModel());
  }

  @override
  void dispose() {
    wIDGETsearchrecordModel.dispose();
    wIDGETrecordscalendarModel.dispose();
  }
}
