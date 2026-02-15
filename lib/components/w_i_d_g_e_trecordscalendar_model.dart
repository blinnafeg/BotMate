import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'w_i_d_g_e_trecordscalendar_widget.dart'
    show WIDGETrecordscalendarWidget;
import 'package:flutter/material.dart';

class WIDGETrecordscalendarModel
    extends FlutterFlowModel<WIDGETrecordscalendarWidget> {
  ///  Local state fields for this component.

  AppointmentsPageDataStruct? appointmentsData;
  void updateAppointmentsDataStruct(
      Function(AppointmentsPageDataStruct) updateFn) {
    updateFn(appointmentsData ??= AppointmentsPageDataStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
