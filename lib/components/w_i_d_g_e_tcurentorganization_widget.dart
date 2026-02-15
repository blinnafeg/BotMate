import '/components/icontext_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'w_i_d_g_e_tcurentorganization_model.dart';
export 'w_i_d_g_e_tcurentorganization_model.dart';

class WIDGETcurentorganizationWidget extends StatefulWidget {
  const WIDGETcurentorganizationWidget({super.key});

  @override
  State<WIDGETcurentorganizationWidget> createState() =>
      _WIDGETcurentorganizationWidgetState();
}

class _WIDGETcurentorganizationWidgetState
    extends State<WIDGETcurentorganizationWidget> {
  late WIDGETcurentorganizationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WIDGETcurentorganizationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        height: 80.0,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200.0,
                    child: wrapWithModel(
                      model: _model.icontextModel,
                      updateCallback: () => safeSetState(() {}),
                      child: IcontextWidget(
                        icon: Icon(
                          FFIcons.kbutterflyLight,
                          size: 13.0,
                        ),
                        text: 'парикмахерская',
                        textColor: FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                  ),
                  AutoSizeText(
                    'ЛЫСЫЙ  ДОМ',
                    maxLines: 1,
                    minFontSize: 8.0,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.openSans(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    overflow: TextOverflow.fade,
                  ),
                ]
                    .addToStart(SizedBox(height: 15.0))
                    .addToEnd(SizedBox(height: 15.0)),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Icon(
                Icons.settings_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
