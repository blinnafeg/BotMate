import '/components/pagegrid_widget.dart';
import '/components/w_i_d_g_e_tcurentorganization_widget.dart';
import '/components/w_i_d_g_e_tcurentorganizationrole_widget.dart';
import '/components/w_i_d_g_e_trecordscalendar_widget.dart';
import '/components/w_i_d_g_e_tsidebarmainmenu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pagegridsample1_model.dart';
export 'pagegridsample1_model.dart';

class Pagegridsample1Widget extends StatefulWidget {
  const Pagegridsample1Widget({super.key});

  static String routeName = 'pagegridsample1';
  static String routePath = '/pagegridsample1';

  @override
  State<Pagegridsample1Widget> createState() => _Pagegridsample1WidgetState();
}

class _Pagegridsample1WidgetState extends State<Pagegridsample1Widget> {
  late Pagegridsample1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Pagegridsample1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'leadBOT',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.openSansCondensed(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              Text(
                '\'',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.openSansCondensed(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondary,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              Text(
                'mate',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.openSansCondensed(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.pagegridModel,
            updateCallback: () => safeSetState(() {}),
            child: PagegridWidget(
              leftFlexHORIZONTAL: 1,
              centerFlexHORIZONTAL: 5,
              rightFlexHORIZONTAL: 1,
              leftTopContent: () => WIDGETcurentorganizationWidget(),
              leftMiddleContent: () => WIDGETsidebarmainmenuWidget(),
              leftBottomContent: () => WIDGETcurentorganizationroleWidget(),
              centerMiddleContent: () => WIDGETrecordscalendarWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
