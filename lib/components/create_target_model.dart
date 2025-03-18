import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_target_widget.dart' show CreateTargetWidget;
import 'package:flutter/material.dart';

class CreateTargetModel extends FlutterFlowModel<CreateTargetWidget> {
  ///  Local state fields for this component.

  int? loopCounter = 0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for targetName widget.
  FocusNode? targetNameFocusNode;
  TextEditingController? targetNameTextController;
  String? Function(BuildContext, String?)? targetNameTextControllerValidator;
  String? _targetNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Target Name is required';
    }

    if (val.length < 5) {
      return 'Minimum is 5';
    }
    if (val.length > 50) {
      return 'Too Long';
    }

    return null;
  }

  // State field(s) for details widget.
  FocusNode? detailsFocusNode;
  TextEditingController? detailsTextController;
  String? Function(BuildContext, String?)? detailsTextControllerValidator;
  String? _detailsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Detail is required';
    }

    if (val.length < 20) {
      return 'please provide more details';
    }
    if (val.length > 300) {
      return 'too longe';
    }

    return null;
  }

  // State field(s) for achivePeriod widget.
  FocusNode? achivePeriodFocusNode;
  TextEditingController? achivePeriodTextController;
  String? Function(BuildContext, String?)? achivePeriodTextControllerValidator;
  String? _achivePeriodTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Achive Period is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for background widget.
  FocusNode? backgroundFocusNode;
  TextEditingController? backgroundTextController;
  String? Function(BuildContext, String?)? backgroundTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TargetRecord? createdTargetDoc;
  // Stores action output result for [Custom Action - generatePhases] action in Button widget.
  List<PhaseStruct>? generatedPhases;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PhaseRecord? createdPhase;

  @override
  void initState(BuildContext context) {
    targetNameTextControllerValidator = _targetNameTextControllerValidator;
    detailsTextControllerValidator = _detailsTextControllerValidator;
    achivePeriodTextControllerValidator = _achivePeriodTextControllerValidator;
  }

  @override
  void dispose() {
    targetNameFocusNode?.dispose();
    targetNameTextController?.dispose();

    detailsFocusNode?.dispose();
    detailsTextController?.dispose();

    achivePeriodFocusNode?.dispose();
    achivePeriodTextController?.dispose();

    backgroundFocusNode?.dispose();
    backgroundTextController?.dispose();
  }
}
