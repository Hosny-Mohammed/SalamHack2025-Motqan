// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TargetStruct extends FFFirebaseStruct {
  TargetStruct({
    String? name,
    String? details,
    int? achivePeriod,
    List<PhaseStruct>? phases,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _details = details,
        _achivePeriod = achivePeriod,
        _phases = phases,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? 'No Name';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "details" field.
  String? _details;
  String get details => _details ?? 'No Details';
  set details(String? val) => _details = val;

  bool hasDetails() => _details != null;

  // "achivePeriod" field.
  int? _achivePeriod;
  int get achivePeriod => _achivePeriod ?? 1;
  set achivePeriod(int? val) => _achivePeriod = val;

  void incrementAchivePeriod(int amount) =>
      achivePeriod = achivePeriod + amount;

  bool hasAchivePeriod() => _achivePeriod != null;

  // "phases" field.
  List<PhaseStruct>? _phases;
  List<PhaseStruct> get phases => _phases ?? const [];
  set phases(List<PhaseStruct>? val) => _phases = val;

  void updatePhases(Function(List<PhaseStruct>) updateFn) {
    updateFn(_phases ??= []);
  }

  bool hasPhases() => _phases != null;

  static TargetStruct fromMap(Map<String, dynamic> data) => TargetStruct(
        name: data['name'] as String?,
        details: data['details'] as String?,
        achivePeriod: castToType<int>(data['achivePeriod']),
        phases: getStructList(
          data['phases'],
          PhaseStruct.fromMap,
        ),
      );

  static TargetStruct? maybeFromMap(dynamic data) =>
      data is Map ? TargetStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'details': _details,
        'achivePeriod': _achivePeriod,
        'phases': _phases?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'details': serializeParam(
          _details,
          ParamType.String,
        ),
        'achivePeriod': serializeParam(
          _achivePeriod,
          ParamType.int,
        ),
        'phases': serializeParam(
          _phases,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TargetStruct fromSerializableMap(Map<String, dynamic> data) =>
      TargetStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        details: deserializeParam(
          data['details'],
          ParamType.String,
          false,
        ),
        achivePeriod: deserializeParam(
          data['achivePeriod'],
          ParamType.int,
          false,
        ),
        phases: deserializeStructParam<PhaseStruct>(
          data['phases'],
          ParamType.DataStruct,
          true,
          structBuilder: PhaseStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TargetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TargetStruct &&
        name == other.name &&
        details == other.details &&
        achivePeriod == other.achivePeriod &&
        listEquality.equals(phases, other.phases);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, details, achivePeriod, phases]);
}

TargetStruct createTargetStruct({
  String? name,
  String? details,
  int? achivePeriod,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TargetStruct(
      name: name,
      details: details,
      achivePeriod: achivePeriod,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TargetStruct? updateTargetStruct(
  TargetStruct? target, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    target
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTargetStructData(
  Map<String, dynamic> firestoreData,
  TargetStruct? target,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (target == null) {
    return;
  }
  if (target.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && target.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final targetData = getTargetFirestoreData(target, forFieldValue);
  final nestedData = targetData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = target.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTargetFirestoreData(
  TargetStruct? target, [
  bool forFieldValue = false,
]) {
  if (target == null) {
    return {};
  }
  final firestoreData = mapToFirestore(target.toMap());

  // Add any Firestore field values
  target.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTargetListFirestoreData(
  List<TargetStruct>? targets,
) =>
    targets?.map((e) => getTargetFirestoreData(e, true)).toList() ?? [];
