import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_target_widget.dart' show CreateTargetWidget;
import 'package:flutter/material.dart';

class CreateTargetModel extends FlutterFlowModel<CreateTargetWidget> {
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

    if (!RegExp('^(1[0-1][0-9]|120|[1-9][0-9])\$').hasMatch(val)) {
      return 'The numbe of days only between 10 and 120';
    }
    return null;
  }

  // State field(s) for Unit widget.
  String? unitValue;
  FormFieldController<String>? unitValueController;
  // State field(s) for background widget.
  String? backgroundValue;
  FormFieldController<String>? backgroundValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TargetRecord? createdTargetDoc;
  // Stores action output result for [Custom Action - generatePhases] action in Button widget.
  List<PhaseStruct>? generatedPhases;

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
  }
}
