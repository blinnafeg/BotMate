import '/components/wg_form_appointmentsubmenuitem_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wg_form_appointment_model.dart';
export 'wg_form_appointment_model.dart';

class WgFormAppointmentWidget extends StatefulWidget {
  const WgFormAppointmentWidget({
    super.key,
    String? style,
  }) : this.style = style ?? 'WG_FORM_appointmentStart';

  final String style;

  @override
  State<WgFormAppointmentWidget> createState() =>
      _WgFormAppointmentWidgetState();
}

class _WgFormAppointmentWidgetState extends State<WgFormAppointmentWidget> {
  late WgFormAppointmentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WgFormAppointmentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if ((widget.style == 'WG_FORM_appointmentStart') ||
              (widget.style == 'WG_FORM_appointmentSelelectService') ||
              (widget.style == 'WG_FORM_appointmentSelectMaster') ||
              (widget.style == 'WG_FORM_appointmentSelectDate') ||
              (widget.style == 'WG_FORM_appointmentSelectSlot') ||
              (widget.style == 'WG_FORM_appointmentSelectClient'))
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        FFAppState().updateWIDGETSSTYLESStruct(
                          (e) => e
                            ..wgFormAppointment =
                                'WG_FORM_appointmentSelelectService',
                        );
                        _model.updatePage(() {});
                      },
                      text: 'Услуга',
                      options: FFButtonOptions(
                        height: 30.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: widget.style ==
                                'WG_FORM_appointmentSelelectService'
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).secondaryBackground,
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
                    FFButtonWidget(
                      onPressed: () async {
                        FFAppState().updateWIDGETSSTYLESStruct(
                          (e) => e
                            ..wgFormAppointment =
                                'WG_FORM_appointmentSelectMaster',
                        );
                        _model.updatePage(() {});
                      },
                      text: 'Мастер',
                      options: FFButtonOptions(
                        height: 30.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: widget.style ==
                                'WG_FORM_appointmentSelectMaster'
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).secondaryBackground,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            FFAppState().updateWIDGETSDATAStruct(
                              (e) => e
                                ..updateBookingFormData(
                                  (e) => e
                                    ..selectedDate = functions
                                        .curentDateAsString(getCurrentTimestamp)
                                        .toList()
                                    ..selectedSlot = [],
                                ),
                            );
                            _model.updatePage(() {});
                            FFAppState().updateWIDGETSDATAStruct(
                              (e) => e
                                ..updateBookingFormData(
                                  (e) => e
                                    ..availableSlots =
                                        _model.slotsDataDay1!.toList()
                                    ..selectedSlot = [],
                                ),
                            );
                            _model.updatePage(() {});
                            _model.slotsDataDay1 =
                                await actions.loadAvailableSlots(
                              '22222222-2222-2222-2222-222222222222',
                              FFAppState()
                                  .WIDGETSDATA
                                  .bookingFormData
                                  .selectedMasters
                                  .firstOrNull!
                                  .id,
                              FFAppState()
                                  .WIDGETSDATA
                                  .bookingFormData
                                  .selectedDate
                                  .firstOrNull!,
                            );

                            safeSetState(() {});
                          },
                          text: 'Сегодня',
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                widget.style == 'WG_FORM_appointmentSelectDate'
                                    ? FlutterFlowTheme.of(context).alternate
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(4.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            FFAppState().updateWIDGETSSTYLESStruct(
                              (e) => e
                                ..wgFormAppointment =
                                    'WG_FORM_appointmentSelectDate',
                            );
                            _model.updatePage(() {});
                            _model.slotsDataWeek =
                                await actions.loadAvailableSlots(
                              '22222222-2222-2222-2222-222222222222',
                              FFAppState()
                                  .WIDGETSDATA
                                  .bookingFormData
                                  .selectedMasters
                                  .firstOrNull!
                                  .id,
                              FFAppState()
                                  .WIDGETSDATA
                                  .bookingFormData
                                  .selectedDate
                                  .firstOrNull!,
                            );
                            FFAppState().updateWIDGETSDATAStruct(
                              (e) => e
                                ..updateBookingFormData(
                                  (e) => e
                                    ..availableSlots =
                                        _model.slotsDataWeek!.toList()
                                    ..selectedSlot = [],
                                ),
                            );
                            _model.updatePage(() {});
                            FFAppState().updateWIDGETSDATAStruct(
                              (e) => e
                                ..updateBookingFormData(
                                  (e) => e..calendarWeekView = true,
                                ),
                            );
                            safeSetState(() {});

                            safeSetState(() {});
                          },
                          text: 'Неделя',
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                widget.style == 'WG_FORM_appointmentSelectDate'
                                    ? FlutterFlowTheme.of(context).alternate
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            FFAppState().updateWIDGETSSTYLESStruct(
                              (e) => e
                                ..wgFormAppointment =
                                    'WG_FORM_appointmentSelectDate',
                            );
                            _model.updatePage(() {});
                            _model.slotsDataFromMonths =
                                await actions.loadAvailableSlots(
                              '22222222-2222-2222-2222-222222222222',
                              FFAppState()
                                  .WIDGETSDATA
                                  .bookingFormData
                                  .selectedMasters
                                  .firstOrNull!
                                  .id,
                              FFAppState()
                                  .WIDGETSDATA
                                  .bookingFormData
                                  .selectedDate
                                  .firstOrNull!,
                            );
                            FFAppState().updateWIDGETSDATAStruct(
                              (e) => e
                                ..updateBookingFormData(
                                  (e) => e
                                    ..availableSlots =
                                        _model.slotsDataFromMonths!.toList()
                                    ..calendarWeekView = false
                                    ..selectedSlot = [],
                                ),
                            );
                            _model.updatePage(() {});

                            safeSetState(() {});
                          },
                          text: 'Месяц',
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                widget.style == 'WG_FORM_appointmentSelectDate'
                                    ? FlutterFlowTheme.of(context).alternate
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(4.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        FFAppState().updateWIDGETSSTYLESStruct(
                          (e) => e
                            ..wgFormAppointment =
                                'WG_FORM_appointmentSelectSlot',
                        );
                        _model.updatePage(() {});
                      },
                      text: 'Время',
                      options: FFButtonOptions(
                        height: 30.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: widget.style == 'WG_FORM_appointmentSelectSlot'
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).secondaryBackground,
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
                    FFButtonWidget(
                      onPressed: () async {
                        FFAppState().updateWIDGETSSTYLESStruct(
                          (e) => e
                            ..wgFormAppointment =
                                'WG_FORM_appointmentSelectClient',
                        );
                        _model.updatePage(() {});
                      },
                      text: 'Клиент',
                      options: FFButtonOptions(
                        height: 30.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: widget.style ==
                                'WG_FORM_appointmentSelectClient'
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).secondaryBackground,
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
                  ].divide(SizedBox(width: 10.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await actions.createAppointment(
                          '22222222-2222-2222-2222-222222222222',
                          FFAppState()
                              .WIDGETSDATA
                              .bookingFormData
                              .selectedClient
                              .firstOrNull!
                              .id,
                          FFAppState()
                              .WIDGETSDATA
                              .bookingFormData
                              .selectedServices
                              .firstOrNull!
                              .id,
                          FFAppState()
                              .WIDGETSDATA
                              .bookingFormData
                              .selectedMasters
                              .firstOrNull!
                              .id,
                          FFAppState()
                              .WIDGETSDATA
                              .bookingFormData
                              .selectedDate
                              .firstOrNull!,
                          FFAppState()
                              .WIDGETSDATA
                              .bookingFormData
                              .selectedSlot
                              .firstOrNull!,
                          '',
                          () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Добавлена',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          },
                          (error) async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  error,
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          },
                        );
                        FFAppState().updateWIDGETSDATAStruct(
                          (e) => e..bookingFormData = null,
                        );
                        FFAppState().updateWIDGETSSTYLESStruct(
                          (e) => e
                            ..wgHeader = 'WG_HEDAER_appointmentStart'
                            ..wgFormAppointment = 'WG_FORM_appointmentHiden',
                        );
                        _model.updatePage(() {});
                      },
                      text: 'СОЗДАТЬ',
                      options: FFButtonOptions(
                        height: 30.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
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
                  ],
                ),
              ],
            ),
          if ((widget.style == 'WG_FORM_appointmentStart') ||
              (widget.style == 'WG_FORM_appointmentSelelectService') ||
              (widget.style == 'WG_FORM_appointmentSelectMaster') ||
              (widget.style == 'WG_FORM_appointmentSelectDate') ||
              (widget.style == 'WG_FORM_appointmentSelectSlot') ||
              (widget.style == 'WG_FORM_appointmentSelectClient'))
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) {
                    final selectedServicesRow = FFAppState()
                        .WIDGETSDATA
                        .bookingFormData
                        .selectedServices
                        .toList();

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(selectedServicesRow.length,
                          (selectedServicesRowIndex) {
                        final selectedServicesRowItem =
                            selectedServicesRow[selectedServicesRowIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().updateWIDGETSDATAStruct(
                                (e) => e
                                  ..updateBookingFormData(
                                    (e) => e
                                      ..updateSelectedServices(
                                        (e) =>
                                            e.remove(selectedServicesRowItem),
                                      )
                                      ..mastersList = [],
                                  ),
                              );
                              _model.updatePage(() {});
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                height: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 3.0, 6.0, 3.0),
                                  child: Text(
                                    selectedServicesRowItem.name,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.openSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    final selectedMasterRow = FFAppState()
                        .WIDGETSDATA
                        .bookingFormData
                        .selectedMasters
                        .toList();

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(selectedMasterRow.length,
                          (selectedMasterRowIndex) {
                        final selectedMasterRowItem =
                            selectedMasterRow[selectedMasterRowIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().updateWIDGETSDATAStruct(
                                (e) => e
                                  ..updateBookingFormData(
                                    (e) => e
                                      ..mastersList = []
                                      ..updateSelectedMasters(
                                        (e) => e.remove(selectedMasterRowItem),
                                      ),
                                  ),
                              );
                              _model.updatePage(() {});
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                height: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 3.0, 6.0, 3.0),
                                  child: Text(
                                    selectedMasterRowItem.name,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.openSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    final dateRow = FFAppState()
                        .WIDGETSDATA
                        .bookingFormData
                        .selectedDate
                        .toList();

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(dateRow.length, (dateRowIndex) {
                        final dateRowItem = dateRow[dateRowIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().updateWIDGETSDATAStruct(
                                (e) => e
                                  ..updateBookingFormData(
                                    (e) => e..selectedDate = [],
                                  ),
                              );
                              _model.updatePage(() {});
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                height: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 3.0, 6.0, 3.0),
                                  child: Text(
                                    dateRowItem,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.openSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    final selecterSlotRow = FFAppState()
                        .WIDGETSDATA
                        .bookingFormData
                        .selectedSlot
                        .toList();

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(selecterSlotRow.length,
                          (selecterSlotRowIndex) {
                        final selecterSlotRowItem =
                            selecterSlotRow[selecterSlotRowIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().updateWIDGETSDATAStruct(
                                (e) => e
                                  ..updateBookingFormData(
                                    (e) => e..selectedSlot = [],
                                  ),
                              );
                              safeSetState(() {});
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                height: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 3.0, 6.0, 3.0),
                                  child: Text(
                                    selecterSlotRowItem,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.openSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    final selecterClientRow = FFAppState()
                        .WIDGETSDATA
                        .bookingFormData
                        .selectedClient
                        .toList();

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(selecterClientRow.length,
                          (selecterClientRowIndex) {
                        final selecterClientRowItem =
                            selecterClientRow[selecterClientRowIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().updateWIDGETSDATAStruct(
                                (e) => e
                                  ..updateBookingFormData(
                                    (e) => e..selectedClient = [],
                                  ),
                              );
                              safeSetState(() {});
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                height: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 3.0, 6.0, 3.0),
                                  child: Text(
                                    '${selecterClientRowItem.name} ${selecterClientRowItem.phone}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.openSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          if (widget.style == 'WG_FORM_appointmentSelelectService')
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Builder(
                  builder: (context) {
                    final servicesDataRow = FFAppState()
                        .WIDGETSDATA
                        .bookingFormData
                        .servicesList
                        .toList();

                    return Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: List.generate(servicesDataRow.length,
                          (servicesDataRowIndex) {
                        final servicesDataRowItem =
                            servicesDataRow[servicesDataRowIndex];
                        return WgFormAppointmentsubmenuitemWidget(
                          key: Key(
                              'Keyg8z_${servicesDataRowIndex}_of_${servicesDataRow.length}'),
                          text: servicesDataRowItem.name,
                          serviceDurationMin: valueOrDefault<int>(
                            servicesDataRowItem.durationMin,
                            10,
                          ),
                          servicePrice: valueOrDefault<int>(
                            servicesDataRowItem.price,
                            0,
                          ),
                          serviceName: servicesDataRowItem.name,
                          selectedServiceDataRowItem: servicesDataRowItem,
                          style: 'service',
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          if (widget.style == 'WG_FORM_appointmentSelectMaster')
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Builder(
                  builder: (context) {
                    final mastersDataRow = FFAppState()
                        .WIDGETSDATA
                        .bookingFormData
                        .mastersList
                        .toList();

                    return Wrap(
                      spacing: 10.0,
                      runSpacing: 0.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: List.generate(mastersDataRow.length,
                          (mastersDataRowIndex) {
                        final mastersDataRowItem =
                            mastersDataRow[mastersDataRowIndex];
                        return WgFormAppointmentsubmenuitemWidget(
                          key: Key(
                              'Key7xe_${mastersDataRowIndex}_of_${mastersDataRow.length}'),
                          text: mastersDataRowItem.name,
                          style: 'master',
                          selectedMasterDataRowItem: mastersDataRowItem,
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          if (widget.style == 'WG_FORM_appointmentSelectDate')
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: FlutterFlowCalendar(
                color: FlutterFlowTheme.of(context).primary,
                iconColor: FlutterFlowTheme.of(context).secondaryText,
                weekFormat:
                    FFAppState().WIDGETSDATA.bookingFormData.calendarWeekView,
                weekStartsMonday: true,
                initialDate: getCurrentTimestamp,
                rowHeight: 48.0,
                onChange: (DateTimeRange? newSelectedDate) async {
                  if (_model.calendarSelectedDay == newSelectedDate) {
                    return;
                  }
                  _model.calendarSelectedDay = newSelectedDate;
                  FFAppState().updateWIDGETSDATAStruct(
                    (e) => e
                      ..updateBookingFormData(
                        (e) => e..selectedDate = [],
                      ),
                  );
                  _model.updatePage(() {});
                  FFAppState().updateWIDGETSDATAStruct(
                    (e) => e
                      ..updateBookingFormData(
                        (e) => e
                          ..updateSelectedDate(
                            (e) => e.insert(
                                0,
                                dateTimeFormat(
                                  "yyyy-MM-dd",
                                  _model.calendarSelectedDay!.start,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )),
                          ),
                      ),
                  );
                  _model.updatePage(() {});
                  safeSetState(() {});
                },
                titleStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                dayOfWeekStyle: FlutterFlowTheme.of(context)
                    .labelMedium
                    .override(
                      font: GoogleFonts.openSans(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                dateStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                selectedDateStyle: FlutterFlowTheme.of(context)
                    .titleSmall
                    .override(
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
                inactiveDateStyle: FlutterFlowTheme.of(context)
                    .labelSmall
                    .override(
                      font: GoogleFonts.openSans(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
                locale: FFLocalizations.of(context).languageCode,
              ),
            ),
          if (widget.style == 'WG_FORM_appointmentSelectSlot')
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Builder(
                  builder: (context) {
                    final slotsDataRow = FFAppState()
                        .WIDGETSDATA
                        .bookingFormData
                        .availableSlots
                        .toList()
                        .take(50)
                        .toList();

                    return Wrap(
                      spacing: 10.0,
                      runSpacing: 0.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: List.generate(slotsDataRow.length,
                          (slotsDataRowIndex) {
                        final slotsDataRowItem =
                            slotsDataRow[slotsDataRowIndex];
                        return WgFormAppointmentsubmenuitemWidget(
                          key: Key(
                              'Keyd2z_${slotsDataRowIndex}_of_${slotsDataRow.length}'),
                          text: slotsDataRowItem,
                          style: 'slot',
                          selectedSlotDataRowItem: slotsDataRowItem,
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          if (widget.style == 'WG_FORM_appointmentSelectClient')
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Container(
                constraints: BoxConstraints(
                  minWidth: 1024.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: 15.0,
                        ),
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      height: 31.0,
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        width: 120.0,
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            Duration(milliseconds: 0),
                                            () async {
                                              safeSetState(() {});
                                            },
                                          ),
                                          autofocus: false,
                                          enabled: true,
                                          textInputAction: TextInputAction.go,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.openSans(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            hintText: 'Имя, телефон',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.openSans(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(5.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(5.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(5.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(5.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(5.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(5.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(5.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(5.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            suffixIcon: _model.textController!
                                                    .text.isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model.textController
                                                          ?.clear();
                                                      safeSetState(() {});
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.openSans(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          enableInteractiveSelection: true,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'НАЙТИ',
                                      icon: Icon(
                                        FFIcons.kmagnifyingGlassLight,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 30.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(5.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.32,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Builder(
                              builder: (context) {
                                final serarchResultsRow = functions
                                    .searchClients(
                                        FFAppState()
                                            .WIDGETSDATA
                                            .bookingFormData
                                            .clientsList
                                            .toList(),
                                        _model.textController.text)
                                    .toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: serarchResultsRow.length,
                                  itemBuilder:
                                      (context, serarchResultsRowIndex) {
                                    final serarchResultsRowItem =
                                        serarchResultsRow[
                                            serarchResultsRowIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState()
                                                .updateWIDGETSDATAStruct(
                                              (e) => e
                                                ..updateBookingFormData(
                                                  (e) => e
                                                    ..updateSelectedClient(
                                                      (e) => e.add(
                                                          serarchResultsRowItem),
                                                    ),
                                                ),
                                            );
                                            FFAppState()
                                                .updateWIDGETSSTYLESStruct(
                                              (e) => e
                                                ..wgFormAppointment =
                                                    'WG_FORM_appointmentStart',
                                            );
                                            _model.updatePage(() {});
                                          },
                                          child: Container(
                                            height: 35.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    serarchResultsRowItem.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .openSans(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    serarchResultsRowItem.phone,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .openSans(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    serarchResultsRowItem
                                                        .telegramId,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .openSans(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 15.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ]
                              .addToStart(SizedBox(height: 5.0))
                              .addToEnd(SizedBox(height: 5.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ]
            .divide(SizedBox(height: 5.0))
            .addToStart(SizedBox(height: 15.0))
            .addToEnd(SizedBox(height: 15.0)),
      ),
    );
  }
}
