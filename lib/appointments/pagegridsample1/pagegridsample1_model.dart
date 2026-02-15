import '/backend/schema/structs/index.dart';
import '/components/pagegrid_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pagegridsample1_widget.dart' show Pagegridsample1Widget;
import 'package:flutter/material.dart';

class Pagegridsample1Model extends FlutterFlowModel<Pagegridsample1Widget> {
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

  // Model for PAGEGRID component.
  late PagegridModel pagegridModel;

  @override
  void initState(BuildContext context) {
    pagegridModel = createModel(context, () => PagegridModel());
  }

  @override
  void dispose() {
    pagegridModel.dispose();
  }
}
