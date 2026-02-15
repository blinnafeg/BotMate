import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'w_i_d_g_e_tcurentorganizationrole_model.dart';
export 'w_i_d_g_e_tcurentorganizationrole_model.dart';

class WIDGETcurentorganizationroleWidget extends StatefulWidget {
  const WIDGETcurentorganizationroleWidget({super.key});

  @override
  State<WIDGETcurentorganizationroleWidget> createState() =>
      _WIDGETcurentorganizationroleWidgetState();
}

class _WIDGETcurentorganizationroleWidgetState
    extends State<WIDGETcurentorganizationroleWidget> {
  late WIDGETcurentorganizationroleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WIDGETcurentorganizationroleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Вы авторилованы как администратор',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        font: GoogleFonts.openSans(
                          fontWeight:
                              FlutterFlowTheme.of(context).bodySmall.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodySmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'ВЫЙТИ',
            icon: Icon(
              FFIcons.kdoorOpenLight,
              size: 15.0,
            ),
            options: FFButtonOptions(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.openSans(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
              elevation: 0.0,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ].addToEnd(SizedBox(width: 15.0)),
      ),
    );
  }
}
