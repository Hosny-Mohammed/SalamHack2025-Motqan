// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhaseStruct extends FFFirebaseStruct {
  PhaseStruct({
    String? name,
    String? description,
    int? achivePeriod,
    List<String>? materials,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _achivePeriod = achivePeriod,
        _materials = materials,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? 'No Name';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? 'No Description';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "achivePeriod" field.
  int? _achivePeriod;
  int get achivePeriod => _achivePeriod ?? 1;
  set achivePeriod(int? val) => _achivePeriod = val;

  void incrementAchivePeriod(int amount) =>
      achivePeriod = achivePeriod + amount;

  bool hasAchivePeriod() => _achivePeriod != null;

  // "materials" field.
  List<String>? _materials;
  List<String> get materials => _materials ?? const [];
  set materials(List<String>? val) => _materials = val;

  void updateMaterials(Function(List<String>) updateFn) {
    updateFn(_materials ??= []);
  }

  bool hasMaterials() => _materials != null;

  static PhaseStruct fromMap(Map<String, dynamic> data) => PhaseStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        achivePeriod: castToType<int>(data['achivePeriod']),
        materials: getDataList(data['materials']),
      );

  static PhaseStruct? maybeFromMap(dynamic data) =>
      data is Map ? PhaseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'achivePeriod': _achivePeriod,
        'materials': _materials,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'achivePeriod': serializeParam(
          _achivePeriod,
          ParamType.int,
        ),
        'materials': serializeParam(
          _materials,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static PhaseStruct fromSerializableMap(Map<String, dynamic> data) =>
      PhaseStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        achivePeriod: deserializeParam(
          data['achivePeriod'],
          ParamType.int,
          false,
        ),
        materials: deserializeParam<String>(
          data['materials'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'PhaseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PhaseStruct &&
        name == other.name &&
        description == other.description &&
        achivePeriod == other.achivePeriod &&
        listEquality.equals(materials, other.materials);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, description, achivePeriod, materials]);
}

PhaseStruct createPhaseStruct({
  String? name,
  String? description,
  int? achivePeriod,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PhaseStruct(
      name: name,
      description: description,
      achivePeriod: achivePeriod,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PhaseStruct? updatePhaseStruct(
  PhaseStruct? phase, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    phase
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPhaseStructData(
  Map<String, dynamic> firestoreData,
  PhaseStruct? phase,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (phase == null) {
    return;
  }
  if (phase.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && phase.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final phaseData = getPhaseFirestoreData(phase, forFieldValue);
  final nestedData = phaseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = phase.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPhaseFirestoreData(
  PhaseStruct? phase, [
  bool forFieldValue = false,
]) {
  if (phase == null) {
    return {};
  }
  final firestoreData = mapToFirestore(phase.toMap());

  // Add any Firestore field values
  phase.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPhaseListFirestoreData(
  List<PhaseStruct>? phases,
) =>
    phases?.map((e) => getPhaseFirestoreData(e, true)).toList() ?? [];
