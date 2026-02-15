import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'pagegrid_model.dart';
export 'pagegrid_model.dart';

class PagegridWidget extends StatefulWidget {
  const PagegridWidget({
    super.key,
    int? leftFlexHORIZONTAL,
    int? centerFlexHORIZONTAL,
    int? rightFlexHORIZONTAL,
    this.leftTopContent,
    this.leftMiddleContent,
    this.leftBottomContent,
    this.centerTopContent,
    this.centerMiddleContent,
    this.centerBottomContent,
    this.rightTopContent,
    this.rightMiddleContent,
    this.rightBottomContent,
  })  : this.leftFlexHORIZONTAL = leftFlexHORIZONTAL ?? 1,
        this.centerFlexHORIZONTAL = centerFlexHORIZONTAL ?? 8,
        this.rightFlexHORIZONTAL = rightFlexHORIZONTAL ?? 1;

  final int leftFlexHORIZONTAL;
  final int centerFlexHORIZONTAL;
  final int rightFlexHORIZONTAL;
  final Widget Function()? leftTopContent;
  final Widget Function()? leftMiddleContent;
  final Widget Function()? leftBottomContent;
  final Widget Function()? centerTopContent;
  final Widget Function()? centerMiddleContent;
  final Widget Function()? centerBottomContent;
  final Widget Function()? rightTopContent;
  final Widget Function()? rightMiddleContent;
  final Widget Function()? rightBottomContent;

  @override
  State<PagegridWidget> createState() => _PagegridWidgetState();
}

class _PagegridWidgetState extends State<PagegridWidget> {
  late PagegridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagegridModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: widget.leftFlexHORIZONTAL,
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(builder: (_) {
                      return widget.leftTopContent != null
                          ? widget.leftTopContent!()
                          : SizedBox.shrink();
                    }),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 0.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Builder(builder: (_) {
                        return widget.leftMiddleContent != null
                            ? widget.leftMiddleContent!()
                            : SizedBox.shrink();
                      }),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 0.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(builder: (_) {
                      return widget.leftBottomContent != null
                          ? widget.leftBottomContent!()
                          : SizedBox.shrink();
                    }),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(
            width: 1.0,
            thickness: 0.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
          Expanded(
            flex: widget.centerFlexHORIZONTAL,
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(builder: (_) {
                      return widget.centerTopContent != null
                          ? widget.centerTopContent!()
                          : SizedBox.shrink();
                    }),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 0.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(builder: (_) {
                      return widget.centerMiddleContent != null
                          ? widget.centerMiddleContent!()
                          : SizedBox.shrink();
                    }),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 0.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(
            width: 1.0,
            thickness: 0.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
          Expanded(
            flex: widget.rightFlexHORIZONTAL,
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(builder: (_) {
                      return widget.rightTopContent != null
                          ? widget.rightTopContent!()
                          : SizedBox.shrink();
                    }),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 0.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Builder(builder: (_) {
                        return widget.rightMiddleContent != null
                            ? widget.rightMiddleContent!()
                            : SizedBox.shrink();
                      }),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 0.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(builder: (_) {
                      return widget.rightBottomContent != null
                          ? widget.rightBottomContent!()
                          : SizedBox.shrink();
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
