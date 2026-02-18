import '/components/w_i_d_g_e_tcurentorganization_widget.dart';
import '/components/w_i_d_g_e_tcurentorganizationrole_widget.dart';
import '/components/w_i_d_g_e_trecords_viewer_widget.dart';
import '/components/w_i_d_g_e_tsidebarmainmenu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  static String routeName = 'test';
  static String routePath = '/test';

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late TestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.openSansCondensed(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.165,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          wrapWithModel(
                            model: _model.wIDGETcurentorganizationModel,
                            updateCallback: () => safeSetState(() {}),
                            child: WIDGETcurentorganizationWidget(),
                          ),
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: wrapWithModel(
                                model: _model.wIDGETsidebarmainmenuModel,
                                updateCallback: () => safeSetState(() {}),
                                child: WIDGETsidebarmainmenuWidget(),
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.wIDGETcurentorganizationroleModel,
                            updateCallback: () => safeSetState(() {}),
                            child: WIDGETcurentorganizationroleWidget(),
                          ),
                        ],
                      ),
                    ),
                  ),
                Expanded(
                  flex: 6,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.66,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Divider(
                            height: 1.0,
                            thickness: 0.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          wrapWithModel(
                            model: _model.wIDGETrecordsViewerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: WIDGETrecordsViewerWidget(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.165,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Hello World',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.openSansCondensed(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
