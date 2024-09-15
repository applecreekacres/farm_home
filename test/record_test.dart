import 'package:flutter_test/flutter_test.dart';
import 'package:farm_home/models/models.dart';
import 'package:uuid/uuid.dart';

void main() {
  test("Create a new Record", () {
    final now = DateTime.now();
    final record = Record(
        "New Record",
        now,
        "Basic Description",
        false,
        List<Quantity>.empty(),
        List<Resource>.empty(),
        ["tag"],
        (Record).toString());

    expect(record.isDone, false);
    expect(record.timestamp, now);
    expect(record.title, "New Record");
    expect(record.quantities, List<Quantity>.empty());
    expect(record.resources, List<Resource>.empty());
    expect(record.tags.length, 1);
    expect(record.tags[0], "tag");
    expect(record.notes, "Basic Description");
    expect(record.recordType, "Record");
  });

  test("Load Record from Map", () {
    final now = DateTime.now().millisecondsSinceEpoch;
    final id = const Uuid().v4();
    final userId = const Uuid().v4();
    Map<String, dynamic> map = {
      "id": id,
      "userId": userId,
      "created":
          DateTime(DateTime.now().year, 1, 2, 3, 4, 5).millisecondsSinceEpoch,
      "modified":
          DateTime(DateTime.now().year, 5, 4, 3, 2, 1).millisecondsSinceEpoch,
      "title": "title",
      "notes": "description",
      "isDone": false,
      "timestamp": now,
      "tags": ["tag2"],
      "quantities": [],
      "resources": [],
      "recordType": (Record).toString()
    };

    final record = Record.fromMap(map);

    expect(record.title, "title");
  });

  test("Get Map from Record", () {
    final now = DateTime.now();
    final record =
        Record("Record", now, "", true, [], [], ["test"], (Record).toString());
    final map = record.toMap();

    expect(map["title"], "Record");
  });
}
