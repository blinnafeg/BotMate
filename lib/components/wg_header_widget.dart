import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'wg_header_model.dart';
export 'wg_header_model.dart';

class WgHeaderWidget extends StatefulWidget {
  const WgHeaderWidget({
    super.key,
    String? style,
  }) : this.style = style ?? 'WG_HEDAER_appointmentStart';

  final String style;

  @override
  State<WgHeaderWidget> createState() => _WgHeaderWidgetState();
}

class _WgHeaderWidgetState extends State<WgHeaderWidget> {
  late WgHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WgHeaderModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            () {
              if (widget.style == 'WG_HEDAER_appointmentStart') {
                return 'ЗАПИСИ';
              } else if (widget.style == 'WG_HEDAER_appointmentCreatForm') {
                return 'ДОБАВЛЕНИЕ ЗАПИСИ';
              } else if (widget.style == 'WG_HEDAER_appointmentSearchForm') {
                return 'ПОИСК ЗАПИСЕЙ';
              } else {
                return 'ЗАГОЛОВОК';
              }
            }(),
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  font: GoogleFonts.openSans(
                    fontWeight:
                        FlutterFlowTheme.of(context).labelLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).labelLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.style == 'WG_HEDAER_appointmentStart')
                  FFButtonWidget(
                    onPressed: () async {
                      FFAppState().updateWIDGETSSTYLESStruct(
                        (e) => e..wgHeader = 'WG_HEDAER_appointmentSearchForm',
                      );
                      _model.updatePage(() {});
                    },
                    text: 'НАЙТИ',
                    options: FFButtonOptions(
                      height: 30.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                if (widget.style == 'WG_HEDAER_appointmentStart')
                  FFButtonWidget(
                    onPressed: () async {
                      _model.servicesData = await actions.loadServices(
                        '22222222-2222-2222-2222-222222222222',
                      );
                      _model.clientsData = await actions.loadClients(
                        '22222222-2222-2222-2222-222222222222',
                      );
                      FFAppState().updateWIDGETSSTYLESStruct(
                        (e) => e
                          ..wgHeader = 'WG_HEDAER_appointmentCreatForm'
                          ..wgFormAppointment = 'WG_FORM_appointmentStart',
                      );
                      FFAppState().updateWIDGETSDATAStruct(
                        (e) => e
                          ..updateBookingFormData(
                            (e) => e
                              ..servicesList = _model.servicesData!.toList()
                              ..clientsList = _model.clientsData!.toList(),
                          ),
                      );
                      _model.updatePage(() {});

                      safeSetState(() {});
                    },
                    text: 'СОЗДАТЬ',
                    options: FFButtonOptions(
                      height: 30.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                if ((widget.style == 'WG_HEDAER_appointmentCreatForm') ||
                    (widget.style == 'WG_HEDAER_appointmentSearchForm'))
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderRadius: 4.0,
                      buttonSize: 30.0,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).info,
                        size: 15.0,
                      ),
                      onPressed: () async {
                        FFAppState().updateWIDGETSSTYLESStruct(
                          (e) => e
                            ..wgHeader = 'WG_HEDAER_appointmentStart'
                            ..wgFormAppointment = '',
                        );
                        FFAppState().updateWIDGETSDATAStruct(
                          (e) => e..bookingFormData = null,
                        );
                        _model.updatePage(() {});
                      },
                    ),
                  ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ),
        ],
      ),
    );
  }
}
