import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:farm_home/models/models.dart';

Map<String, dynamic> basicRecordMap = {
  "id": Uuid().v4(),
  "userId": Uuid().v4(),
  "created":
      DateTime(DateTime.now().year, 1, 2, 3, 4, 5).millisecondsSinceEpoch,
  "modified":
      DateTime(DateTime.now().year, 5, 4, 3, 2, 1).millisecondsSinceEpoch,
  "title": "title",
  "notes": "notes",
  "isDone": false,
  "timestamp":
      DateTime(DateTime.now().year, 7, 8, 9, 10, 11).millisecondsSinceEpoch,
  "tags": [],
  "quantities": [],
  "resourceIds": [],
  "itemName": "Record",
  "itemType": "Record",
};

void expectBasicRecordMap(Map<String, dynamic> expected,
    {String id = "",
    String userId = "",
    int? modified,
    int? created,
    String title = "",
    String notes = "",
    bool? isDone,
    int? timestamp,
    String itemName = ""}) {
  if (id == "") {
    expect(expected["id"], basicRecordMap["id"]);
  } else {
    expect(expected["id"], id);
  }

  expect(true, expected.containsKey("userId"));

  // if (userId == "") {
  //   expect(expected["userId"], basicRecordMap["userId"]);
  // } else {
  //   expect(expected["userId"], userId);
  // }

  if (created == null) {
    expect(expected["created"], basicRecordMap["created"]);
  } else {
    expect(expected["created"], created);
  }

  if (modified == null) {
    expect(expected["modified"], basicRecordMap["modified"]);
  } else {
    expect(expected["modified"], modified);
  }

  if (title == "") {
    expect(expected["title"], basicRecordMap["title"]);
  } else {
    expect(expected["title"], title);
  }

  if (notes == "") {
    expect(expected["notes"], basicRecordMap["notes"]);
  } else {
    expect(expected["notes"], notes);
  }

  if (isDone == null) {
    expect(expected["isDone"], basicRecordMap["isDone"]);
  } else {
    expect(expected["isDone"], isDone);
  }

  if (timestamp == null) {
    expect(expected["timestamp"], basicRecordMap["timestamp"]);
  } else {
    expect(expected["timestamp"], timestamp);
  }

  if (itemName == "") {
    expect(expected["itemName"], basicRecordMap["itemName"]);
  } else {
    expect(expected["itemName"], itemName);
  }

  expect(expected["itemType"], basicRecordMap["itemType"]);
}

void expectBasicRecord(Record record,
    {String id = "",
    String userId = "",
    int? modified,
    int? created,
    String title = "",
    String notes = "",
    bool? isDone,
    int? timestamp,
    String itemName = ""}) {
  expectBasicRecordMap(record.toMap(),
      id: id,
      userId: userId,
      modified: modified,
      created: created,
      title: title,
      notes: notes,
      isDone: isDone,
      itemName: itemName);
}
