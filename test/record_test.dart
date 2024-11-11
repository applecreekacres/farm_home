import 'package:farm_home/constants/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:farm_home/models/models.dart';

import 'test_setup.dart';

void main() {
  test("Create a new Activity Record", () {
    var map = basicRecordMap;
    final record = ActivityRecord(
        title: map["title"],
        timestamp: DateTime.fromMillisecondsSinceEpoch(map["timestamp"]),
        notes: map["notes"],
        isDone: map["isDone"],
        tags: ["tag"]);

    expectBasicRecordMap(
      record.toMap(),
      id: record.id,
      userId: record.userId,
      created: record.created.millisecondsSinceEpoch,
      modified: record.modified.millisecondsSinceEpoch,
      itemName: RecordConstants.activity,
    );
  });

  test("Load Activity Record from Map", () {
    Map<String, dynamic> map = basicRecordMap;

    final record = ActivityRecord.fromMap(map);

    expectBasicRecord(record,
      itemName: RecordConstants.activity,
    );
  });

  test("Create a new Observation Record", () {
    var map = basicRecordMap;
    final record = ObservationRecord(
        title: map["title"],
        timestamp: DateTime.fromMillisecondsSinceEpoch(map["timestamp"]),
        notes: map["notes"],
        isDone: map["isDone"],
        tags: ["tag"]);

    expectBasicRecordMap(
      record.toMap(),
      id: record.id,
      userId: record.userId,
      created: record.created.millisecondsSinceEpoch,
      modified: record.modified.millisecondsSinceEpoch,
      itemName: RecordConstants.observation,
    );
  });

  test("Load Observation Record from Map", () {
    Map<String, dynamic> map = basicRecordMap;

    final record = ObservationRecord.fromMap(map);

    expectBasicRecord(
      record,
      itemName: RecordConstants.observation,
    );
  });
}
