import '/components/wg_form_appointment_widget.dart';
import '/components/wg_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'authorization_widget.dart' show AuthorizationWidget;
import 'package:flutter/material.dart';

class AuthorizationModel extends FlutterFlowModel<AuthorizationWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WG_HEADER component.
  late WgHeaderModel wgHeaderModel;
  // Model for WG_FORM_APPOINTMENT component.
  late WgFormAppointmentModel wgFormAppointmentModel;

  @override
  void initState(BuildContext context) {
    wgHeaderModel = createModel(context, () => WgHeaderModel());
    wgFormAppointmentModel =
        createModel(context, () => WgFormAppointmentModel());
  }

  @override
  void dispose() {
    wgHeaderModel.dispose();
    wgFormAppointmentModel.dispose();
  }
}
