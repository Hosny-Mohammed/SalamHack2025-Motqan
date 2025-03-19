import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/target/phase_list_viewer/phase_list_viewer_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'target_plan_model.dart';
export 'target_plan_model.dart';

class TargetPlanWidget extends StatefulWidget {
  const TargetPlanWidget({
    super.key,
    required this.targetCollection,
  });

  final TargetRecord? targetCollection;

  static String routeName = 'TargetPlan';
  static String routePath = '/targetPlan';

  @override
  State<TargetPlanWidget> createState() => _TargetPlanWidgetState();
}

class _TargetPlanWidgetState extends State<TargetPlanWidget> {
  late TargetPlanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TargetPlanModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              valueOrDefault<String>(
                widget.targetCollection?.name,
                'Target',
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              ' - Phases',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Total Days: ',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget.targetCollection?.achivePeriod.toString(),
                    '11',
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
              child: AutoSizeText(
                valueOrDefault<String>(
                  widget.targetCollection?.details,
                  'Target Details',
                ),
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Manrope',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Builder(
                builder: (context) {
                  final targetPhaseRef =
                      widget.targetCollection?.pheses.toList() ?? [];

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: targetPhaseRef.length,
                    itemBuilder: (context, targetPhaseRefIndex) {
                      final targetPhaseRefItem =
                          targetPhaseRef[targetPhaseRefIndex];
                      return StreamBuilder<PhaseRecord>(
                        stream: PhaseRecord.getDocument(targetPhaseRefItem),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitDoubleBounce(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }

                          final phaseListViewerPhaseRecord = snapshot.data!;

                          return PhaseListViewerWidget(
                            key: Key(
                                'Key76c_${targetPhaseRefIndex}_of_${targetPhaseRef.length}'),
                            phaseItem: phaseListViewerPhaseRecord,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
