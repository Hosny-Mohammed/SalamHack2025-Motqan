import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase/task/task_widget.dart';
import '/index.dart';
import 'phase_details_widget.dart' show PhaseDetailsWidget;
import 'package:flutter/material.dart';

class PhaseDetailsModel extends FlutterFlowModel<PhaseDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for task dynamic component.
  late FlutterFlowDynamicModels<TaskModel> taskModels;
  // Stores action output result for [Custom Action - generatePhases] action in generateBtn widget.
  List<PhaseStruct>? generatedPhases;

  @override
  void initState(BuildContext context) {
    taskModels = FlutterFlowDynamicModels(() => TaskModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    taskModels.dispose();
  }
}
