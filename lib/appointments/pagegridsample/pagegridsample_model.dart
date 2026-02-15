import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pagegridsample_widget.dart' show PagegridsampleWidget;
import 'package:flutter/material.dart';

class PagegridsampleModel extends FlutterFlowModel<PagegridsampleWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
