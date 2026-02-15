import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'icontext_model.dart';
export 'icontext_model.dart';

class IcontextWidget extends StatefulWidget {
  const IcontextWidget({
    super.key,
    this.icon,
    String? text,
    this.textColor,
    int? textSize,
    int? iconSize,
    int? spacing,
  })  : this.text = text ?? 'Текст с иконкой',
        this.textSize = textSize ?? 12,
        this.iconSize = iconSize ?? 24,
        this.spacing = spacing ?? 5;

  final Widget? icon;
  final String text;
  final Color? textColor;
  final int textSize;
  final int iconSize;
  final int spacing;

  @override
  State<IcontextWidget> createState() => _IcontextWidgetState();
}

class _IcontextWidgetState extends State<IcontextWidget> {
  late IcontextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IcontextModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.icon!,
        Flexible(
          child: ClipRRect(
            child: Container(
              decoration: BoxDecoration(),
              child: AutoSizeText(
                widget.text,
                minFontSize: 8.0,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.openSans(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: widget.textColor,
                      fontSize: widget.textSize.toDouble(),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ].divide(SizedBox(
          width: valueOrDefault<double>(
        widget.spacing.toDouble(),
        5.0,
      ))),
    );
  }
}
