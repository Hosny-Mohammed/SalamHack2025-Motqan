import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';

Future addCheckList(
  BuildContext context, {
  required List<String>? checkList,
  required DocumentReference? phaseRef,
  required int? loopCounter,
}) async {
  if (loopCounter! < checkList!.length) {
    await TaskRecord.createDoc(phaseRef!).set(createTaskRecordData(
      isCompleated: false,
      content: checkList.elementAtOrNull(loopCounter),
    ));
    await action_blocks.addCheckList(
      context,
      checkList: checkList,
      phaseRef: phaseRef,
      loopCounter: (loopCounter) + 1,
    );
  } else {
    return;
  }
}

Future addGeneratedPhases(
  BuildContext context, {
  required List<PhaseStruct>? phasesList,
  required int? loopCounter,
  DocumentReference? targetRef,
  DocumentReference? parentRef,
}) async {
  PhaseRecord? createdPhase;

  if (loopCounter! < phasesList!.length) {
    var phaseRecordReference = PhaseRecord.collection.doc();
    await phaseRecordReference.set({
      ...createPhaseRecordData(
        name: (phasesList.elementAtOrNull(loopCounter))?.name,
        description: (phasesList.elementAtOrNull(loopCounter))?.description,
        dueDays: (phasesList.elementAtOrNull(loopCounter))?.achivePeriod,
        status: false,
        level: 0,
        parentPhase: parentRef,
      ),
      ...mapToFirestore(
        {
          'materialsURLs':
              (phasesList.elementAtOrNull(loopCounter))?.materials,
        },
      ),
    });
    createdPhase = PhaseRecord.getDocumentFromData({
      ...createPhaseRecordData(
        name: (phasesList.elementAtOrNull(loopCounter))?.name,
        description: (phasesList.elementAtOrNull(loopCounter))?.description,
        dueDays: (phasesList.elementAtOrNull(loopCounter))?.achivePeriod,
        status: false,
        level: 0,
        parentPhase: parentRef,
      ),
      ...mapToFirestore(
        {
          'materialsURLs':
              (phasesList.elementAtOrNull(loopCounter))?.materials,
        },
      ),
    }, phaseRecordReference);
    await action_blocks.addCheckList(
      context,
      checkList: (phasesList.elementAtOrNull(loopCounter))?.checkListTasks,
      phaseRef: createdPhase.reference,
      loopCounter: 0,
    );

    await targetRef!.update({
      ...mapToFirestore(
        {
          'pheses': FieldValue.arrayUnion([createdPhase.reference]),
        },
      ),
    });

    await parentRef!.update({
      ...mapToFirestore(
        {
          'sub_phases': FieldValue.arrayUnion([createdPhase.reference]),
        },
      ),
    });
    await action_blocks.addGeneratedPhases(
      context,
      phasesList: phasesList,
      loopCounter: (loopCounter) + 1,
      targetRef: targetRef,
      parentRef: parentRef,
    );
  } else {
    return;
  }
}
