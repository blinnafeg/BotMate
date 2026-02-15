import '/components/icontext_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'w_i_d_g_e_tcurentorganization_widget.dart'
    show WIDGETcurentorganizationWidget;
import 'package:flutter/material.dart';

class WIDGETcurentorganizationModel
    extends FlutterFlowModel<WIDGETcurentorganizationWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for icontext component.
  late IcontextModel icontextModel;

  @override
  void initState(BuildContext context) {
    icontextModel = createModel(context, () => IcontextModel());
  }

  @override
  void dispose() {
    icontextModel.dispose();
  }
}
