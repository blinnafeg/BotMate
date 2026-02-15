import '/components/w_i_d_g_e_tappointmentscentertop_widget.dart';
import '/components/w_i_d_g_e_tcurentorganization_widget.dart';
import '/components/w_i_d_g_e_tcurentorganizationrole_widget.dart';
import '/components/w_i_d_g_e_trecords_viewer_widget.dart';
import '/components/w_i_d_g_e_tsidebarmainmenu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_widget.dart' show TestWidget;
import 'package:flutter/material.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WIDGETcurentorganization component.
  late WIDGETcurentorganizationModel wIDGETcurentorganizationModel;
  // Model for WIDGETsidebarmainmenu component.
  late WIDGETsidebarmainmenuModel wIDGETsidebarmainmenuModel;
  // Model for WIDGETcurentorganizationrole component.
  late WIDGETcurentorganizationroleModel wIDGETcurentorganizationroleModel;
  // Model for WIDGETappointmentscentertop component.
  late WIDGETappointmentscentertopModel wIDGETappointmentscentertopModel;
  // Model for WIDGETrecordsViewer component.
  late WIDGETrecordsViewerModel wIDGETrecordsViewerModel;

  @override
  void initState(BuildContext context) {
    wIDGETcurentorganizationModel =
        createModel(context, () => WIDGETcurentorganizationModel());
    wIDGETsidebarmainmenuModel =
        createModel(context, () => WIDGETsidebarmainmenuModel());
    wIDGETcurentorganizationroleModel =
        createModel(context, () => WIDGETcurentorganizationroleModel());
    wIDGETappointmentscentertopModel =
        createModel(context, () => WIDGETappointmentscentertopModel());
    wIDGETrecordsViewerModel =
        createModel(context, () => WIDGETrecordsViewerModel());
  }

  @override
  void dispose() {
    wIDGETcurentorganizationModel.dispose();
    wIDGETsidebarmainmenuModel.dispose();
    wIDGETcurentorganizationroleModel.dispose();
    wIDGETappointmentscentertopModel.dispose();
    wIDGETrecordsViewerModel.dispose();
  }
}
