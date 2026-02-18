import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wg_header_widget.dart' show WgHeaderWidget;
import 'package:flutter/material.dart';

class WgHeaderModel extends FlutterFlowModel<WgHeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - loadServices] action in Button widget.
  List<ServiceStruct>? servicesData;
  // Stores action output result for [Custom Action - loadClients] action in Button widget.
  List<ClientStruct>? clientsData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
