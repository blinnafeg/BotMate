import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wg_form_appointmentsubmenuitem_model.dart';
export 'wg_form_appointmentsubmenuitem_model.dart';

class WgFormAppointmentsubmenuitemWidget extends StatefulWidget {
  const WgFormAppointmentsubmenuitemWidget({
    super.key,
    this.text,
    int? serviceDurationMin,
    int? servicePrice,
    this.serviceName,
    this.selectedServiceDataRowItem,
    required this.style,
    this.selectedMasterDataRowItem,
    this.selectedSlotDataRowItem,
  })  : this.serviceDurationMin = serviceDurationMin ?? 0,
        this.servicePrice = servicePrice ?? 0;

  final String? text;
  final int serviceDurationMin;
  final int servicePrice;
  final String? serviceName;
  final ServiceStruct? selectedServiceDataRowItem;
  final String? style;
  final MasterStruct? selectedMasterDataRowItem;
  final String? selectedSlotDataRowItem;

  @override
  State<WgFormAppointmentsubmenuitemWidget> createState() =>
      _WgFormAppointmentsubmenuitemWidgetState();
}

class _WgFormAppointmentsubmenuitemWidgetState
    extends State<WgFormAppointmentsubmenuitemWidget> {
  late WgFormAppointmentsubmenuitemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WgFormAppointmentsubmenuitemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.style == 'service') {
          FFAppState().updateWIDGETSDATAStruct(
            (e) => e
              ..updateBookingFormData(
                (e) => e
                  ..updateSelectedServices(
                    (e) => e.add(widget.selectedServiceDataRowItem!),
                  ),
              ),
          );
          FFAppState().updateWIDGETSSTYLESStruct(
            (e) => e..wgFormAppointment = 'WG_FORM_appointmentStart',
          );
          FFAppState().update(() {});
          _model.mastersData = await actions.loadMastersForServices(
            '22222222-2222-2222-2222-222222222222',
            FFAppState().WIDGETSDATA.bookingFormData.selectedServices.toList(),
          );
          FFAppState().updateWIDGETSDATAStruct(
            (e) => e
              ..updateBookingFormData(
                (e) => e..mastersList = _model.mastersData!.toList(),
              ),
          );
        } else if (widget.style == 'master') {
          FFAppState().updateWIDGETSDATAStruct(
            (e) => e
              ..updateBookingFormData(
                (e) => e
                  ..updateSelectedMasters(
                    (e) => e.add(widget.selectedMasterDataRowItem!),
                  ),
              ),
          );
          FFAppState().updateWIDGETSSTYLESStruct(
            (e) => e..wgFormAppointment = 'WG_FORM_appointmentStart',
          );
          FFAppState().update(() {});
        } else if (widget.style == 'slot') {
          FFAppState().updateWIDGETSDATAStruct(
            (e) => e
              ..updateBookingFormData(
                (e) => e
                  ..updateSelectedSlot(
                    (e) => e.add(widget.selectedSlotDataRowItem!),
                  ),
              ),
          );
          FFAppState().updateWIDGETSSTYLESStruct(
            (e) => e..wgFormAppointment = 'WG_FORM_appointmentStart',
          );
          FFAppState().update(() {});
        }

        safeSetState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.text,
                  'Текст',
                ),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.openSansCondensed(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
              ),
              if (widget.style == 'service')
                RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.serviceDurationMin.toString(),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.openSans(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                      ),
                      TextSpan(
                        text: 'мин.',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.openSans(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                      )
                    ],
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
                  ),
                ),
              if (widget.style == 'service')
                RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.servicePrice.toString(),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.openSans(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                      ),
                      TextSpan(
                        text: '₽',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.openSans(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                      )
                    ],
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
                  ),
                ),
            ]
                .divide(SizedBox(width: 5.0))
                .addToStart(SizedBox(width: 7.0))
                .addToEnd(SizedBox(width: 7.0)),
          ),
        ),
      ),
    );
  }
}
