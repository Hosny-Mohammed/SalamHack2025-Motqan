import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'target_box_model.dart';
export 'target_box_model.dart';

class TargetBoxWidget extends StatefulWidget {
  const TargetBoxWidget({
    super.key,
    required this.targetDoc,
  });

  final TargetRecord? targetDoc;

  @override
  State<TargetBoxWidget> createState() => _TargetBoxWidgetState();
}

class _TargetBoxWidgetState extends State<TargetBoxWidget> {
  late TargetBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TargetBoxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          TargetPlanWidget.routeName,
          queryParameters: {
            'targetCollection': serializeParam(
              widget.targetDoc,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'targetCollection': widget.targetDoc,
          },
        );
      },
      child: Container(
        width: 150.0,
        height: 150.0,
        constraints: BoxConstraints(
          minWidth: 200.0,
          minHeight: 200.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x10000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).success,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.targetDoc?.name,
                            'Target Namef ',
                          ).maybeHandleOverflow(
                            maxChars: 50,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.more_vert_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'ssui59wo' /* Total Days:  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.targetDoc?.achivePeriod.toString(),
                      '90',
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              LinearPercentIndicator(
                percent: valueOrDefault<double>(
                  widget.targetDoc?.progress,
                  0.5,
                ),
                lineHeight: 20.0,
                animation: true,
                animateFromLastPercent: true,
                progressColor: FlutterFlowTheme.of(context).primary,
                backgroundColor: FlutterFlowTheme.of(context).alternate,
                center: Text(
                  valueOrDefault<String>(
                    formatNumber(
                      widget.targetDoc?.progress,
                      formatType: FormatType.percent,
                    ),
                    '50%',
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
                barRadius: Radius.circular(10.0),
                padding: EdgeInsets.zero,
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
