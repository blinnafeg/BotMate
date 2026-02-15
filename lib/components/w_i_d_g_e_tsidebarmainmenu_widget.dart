import '/components/icontext_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'w_i_d_g_e_tsidebarmainmenu_model.dart';
export 'w_i_d_g_e_tsidebarmainmenu_model.dart';

class WIDGETsidebarmainmenuWidget extends StatefulWidget {
  const WIDGETsidebarmainmenuWidget({super.key});

  @override
  State<WIDGETsidebarmainmenuWidget> createState() =>
      _WIDGETsidebarmainmenuWidgetState();
}

class _WIDGETsidebarmainmenuWidgetState
    extends State<WIDGETsidebarmainmenuWidget> {
  late WIDGETsidebarmainmenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WIDGETsidebarmainmenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
          child: wrapWithModel(
            model: _model.icontextModel1,
            updateCallback: () => safeSetState(() {}),
            child: IcontextWidget(
              icon: Icon(
                FFIcons.kdroneLight,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              text: 'ДАШБОРД',
              textSize: 14,
              iconSize: 20,
              spacing: 10,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
          child: wrapWithModel(
            model: _model.icontextModel2,
            updateCallback: () => safeSetState(() {}),
            child: IcontextWidget(
              icon: Icon(
                FFIcons.kuserListLight,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              text: 'КЛИЕНТЫ',
              textSize: 14,
              iconSize: 20,
              spacing: 10,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
          child: wrapWithModel(
            model: _model.icontextModel3,
            updateCallback: () => safeSetState(() {}),
            child: IcontextWidget(
              icon: Icon(
                FFIcons.khandArrowDownLight,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              text: 'УСЛУГИ',
              textSize: 14,
              iconSize: 20,
              spacing: 10,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
          child: wrapWithModel(
            model: _model.icontextModel4,
            updateCallback: () => safeSetState(() {}),
            child: IcontextWidget(
              icon: Icon(
                FFIcons.kclockUserLight,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              text: 'ЗАПИСИ',
              textSize: 14,
              iconSize: 20,
              spacing: 10,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
          child: wrapWithModel(
            model: _model.icontextModel5,
            updateCallback: () => safeSetState(() {}),
            child: IcontextWidget(
              icon: Icon(
                FFIcons.kpersonSimpleHikeLight,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              text: 'СОТРУДНИКИ',
              textSize: 14,
              iconSize: 20,
              spacing: 10,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
          child: wrapWithModel(
            model: _model.icontextModel6,
            updateCallback: () => safeSetState(() {}),
            child: IcontextWidget(
              icon: Icon(
                FFIcons.kcpuLight,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              text: 'ИНТЕГРАЦИИ',
              textSize: 14,
              iconSize: 20,
              spacing: 10,
            ),
          ),
        ),
      ]
          .divide(SizedBox(height: 10.0))
          .addToStart(SizedBox(height: 20.0))
          .addToEnd(SizedBox(height: 20.0)),
    );
  }
}
