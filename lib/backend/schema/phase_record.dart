import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhaseRecord extends FirestoreRecord {
  PhaseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "dueDays" field.
  int? _dueDays;
  int get dueDays => _dueDays ?? 0;
  bool hasDueDays() => _dueDays != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "materialsURLs" field.
  List<String>? _materialsURLs;
  List<String> get materialsURLs => _materialsURLs ?? const [];
  bool hasMaterialsURLs() => _materialsURLs != null;

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  bool hasLevel() => _level != null;

  // "sub_phases" field.
  List<DocumentReference>? _subPhases;
  List<DocumentReference> get subPhases => _subPhases ?? const [];
  bool hasSubPhases() => _subPhases != null;

  // "parent_phase" field.
  DocumentReference? _parentPhase;
  DocumentReference? get parentPhase => _parentPhase;
  bool hasParentPhase() => _parentPhase != null;

  // "minSubPhasePeriod" field.
  int? _minSubPhasePeriod;
  int get minSubPhasePeriod => _minSubPhasePeriod ?? 0;
  bool hasMinSubPhasePeriod() => _minSubPhasePeriod != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _dueDays = castToType<int>(snapshotData['dueDays']);
    _status = snapshotData['status'] as bool?;
    _materialsURLs = getDataList(snapshotData['materialsURLs']);
    _level = castToType<int>(snapshotData['level']);
    _subPhases = getDataList(snapshotData['sub_phases']);
    _parentPhase = snapshotData['parent_phase'] as DocumentReference?;
    _minSubPhasePeriod = castToType<int>(snapshotData['minSubPhasePeriod']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('phase');

  static Stream<PhaseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PhaseRecord.fromSnapshot(s));

  static Future<PhaseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PhaseRecord.fromSnapshot(s));

  static PhaseRecord fromSnapshot(DocumentSnapshot snapshot) => PhaseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhaseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhaseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhaseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhaseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhaseRecordData({
  String? name,
  String? description,
  int? dueDays,
  bool? status,
  int? level,
  DocumentReference? parentPhase,
  int? minSubPhasePeriod,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'dueDays': dueDays,
      'status': status,
      'level': level,
      'parent_phase': parentPhase,
      'minSubPhasePeriod': minSubPhasePeriod,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhaseRecordDocumentEquality implements Equality<PhaseRecord> {
  const PhaseRecordDocumentEquality();

  @override
  bool equals(PhaseRecord? e1, PhaseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.dueDays == e2?.dueDays &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.materialsURLs, e2?.materialsURLs) &&
        e1?.level == e2?.level &&
        listEquality.equals(e1?.subPhases, e2?.subPhases) &&
        e1?.parentPhase == e2?.parentPhase &&
        e1?.minSubPhasePeriod == e2?.minSubPhasePeriod;
  }

  @override
  int hash(PhaseRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.dueDays,
        e?.status,
        e?.materialsURLs,
        e?.level,
        e?.subPhases,
        e?.parentPhase,
        e?.minSubPhasePeriod
      ]);

  @override
  bool isValidKey(Object? o) => o is PhaseRecord;
}
