import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TargetRecord extends FirestoreRecord {
  TargetRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "dueDays" field.
  int? _dueDays;
  int get dueDays => _dueDays ?? 0;
  bool hasDueDays() => _dueDays != null;

  // "phases" field.
  List<DocumentReference>? _phases;
  List<DocumentReference> get phases => _phases ?? const [];
  bool hasPhases() => _phases != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _details = snapshotData['details'] as String?;
    _dueDays = castToType<int>(snapshotData['dueDays']);
    _phases = getDataList(snapshotData['phases']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('target');

  static Stream<TargetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TargetRecord.fromSnapshot(s));

  static Future<TargetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TargetRecord.fromSnapshot(s));

  static TargetRecord fromSnapshot(DocumentSnapshot snapshot) => TargetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TargetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TargetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TargetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TargetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTargetRecordData({
  String? name,
  String? details,
  int? dueDays,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'details': details,
      'dueDays': dueDays,
    }.withoutNulls,
  );

  return firestoreData;
}

class TargetRecordDocumentEquality implements Equality<TargetRecord> {
  const TargetRecordDocumentEquality();

  @override
  bool equals(TargetRecord? e1, TargetRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.details == e2?.details &&
        e1?.dueDays == e2?.dueDays &&
        listEquality.equals(e1?.phases, e2?.phases);
  }

  @override
  int hash(TargetRecord? e) =>
      const ListEquality().hash([e?.name, e?.details, e?.dueDays, e?.phases]);

  @override
  bool isValidKey(Object? o) => o is TargetRecord;
}
