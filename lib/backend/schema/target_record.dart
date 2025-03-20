import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

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

  // "achivePeriod" field.
  int? _achivePeriod;
  int get achivePeriod => _achivePeriod ?? 0;
  bool hasAchivePeriod() => _achivePeriod != null;

  // "pheses" field.
  List<DocumentReference>? _pheses;
  List<DocumentReference> get pheses => _pheses ?? const [];
  bool hasPheses() => _pheses != null;

  // "minPhasePeriod" field.
  int? _minPhasePeriod;
  int get minPhasePeriod => _minPhasePeriod ?? 0;
  bool hasMinPhasePeriod() => _minPhasePeriod != null;

  // "progress" field.
  double? _progress;
  double get progress => _progress ?? 0.0;
  bool hasProgress() => _progress != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _details = snapshotData['details'] as String?;
    _achivePeriod = castToType<int>(snapshotData['achivePeriod']);
    _pheses = getDataList(snapshotData['pheses']);
    _minPhasePeriod = castToType<int>(snapshotData['minPhasePeriod']);
    _progress = castToType<double>(snapshotData['progress']);
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
  int? achivePeriod,
  int? minPhasePeriod,
  double? progress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'details': details,
      'achivePeriod': achivePeriod,
      'minPhasePeriod': minPhasePeriod,
      'progress': progress,
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
        e1?.achivePeriod == e2?.achivePeriod &&
        listEquality.equals(e1?.pheses, e2?.pheses) &&
        e1?.minPhasePeriod == e2?.minPhasePeriod &&
        e1?.progress == e2?.progress;
  }

  @override
  int hash(TargetRecord? e) => const ListEquality().hash([
        e?.name,
        e?.details,
        e?.achivePeriod,
        e?.pheses,
        e?.minPhasePeriod,
        e?.progress
      ]);

  @override
  bool isValidKey(Object? o) => o is TargetRecord;
}
