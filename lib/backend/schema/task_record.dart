import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskRecord extends FirestoreRecord {
  TaskRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "isCompleated" field.
  bool? _isCompleated;
  bool get isCompleated => _isCompleated ?? false;
  bool hasIsCompleated() => _isCompleated != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isCompleated = snapshotData['isCompleated'] as bool?;
    _content = snapshotData['content'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('task')
          : FirebaseFirestore.instance.collectionGroup('task');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('task').doc(id);

  static Stream<TaskRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaskRecord.fromSnapshot(s));

  static Future<TaskRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaskRecord.fromSnapshot(s));

  static TaskRecord fromSnapshot(DocumentSnapshot snapshot) => TaskRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaskRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaskRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaskRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaskRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaskRecordData({
  bool? isCompleated,
  String? content,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isCompleated': isCompleated,
      'content': content,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaskRecordDocumentEquality implements Equality<TaskRecord> {
  const TaskRecordDocumentEquality();

  @override
  bool equals(TaskRecord? e1, TaskRecord? e2) {
    return e1?.isCompleated == e2?.isCompleated && e1?.content == e2?.content;
  }

  @override
  int hash(TaskRecord? e) =>
      const ListEquality().hash([e?.isCompleated, e?.content]);

  @override
  bool isValidKey(Object? o) => o is TaskRecord;
}
