import '/components/w_i_d_g_e_tcurentorganizationrole_widget.dart';
import '/components/w_i_d_g_e_tservicerecord_widget.dart';
import '/components/w_i_d_g_e_tsidebarmainmenu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WIDGETsidebarmainmenu component.
  late WIDGETsidebarmainmenuModel wIDGETsidebarmainmenuModel;
  // Model for WIDGETservicerecord component.
  late WIDGETservicerecordModel wIDGETservicerecordModel;
  // Model for WIDGETcurentorganizationrole component.
  late WIDGETcurentorganizationroleModel wIDGETcurentorganizationroleModel;

  @override
  void initState(BuildContext context) {
    wIDGETsidebarmainmenuModel =
        createModel(context, () => WIDGETsidebarmainmenuModel());
    wIDGETservicerecordModel =
        createModel(context, () => WIDGETservicerecordModel());
    wIDGETcurentorganizationroleModel =
        createModel(context, () => WIDGETcurentorganizationroleModel());
  }

  @override
  void dispose() {
    wIDGETsidebarmainmenuModel.dispose();
    wIDGETservicerecordModel.dispose();
    wIDGETcurentorganizationroleModel.dispose();
  }
}
