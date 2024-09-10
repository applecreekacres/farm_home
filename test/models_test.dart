import 'package:flutter_test/flutter_test.dart';
import 'package:farm_home/models/models.dart';

void main() {
  test("Create a new Record", () {
    final now = DateTime.now();
    final record = Record(
        ["tag"],
        "New Record",
        now,
        "Basic Description",
        false,
        List<Quantity>.empty(),
        List<Resource>.empty(),
        (Record).toString());

    expect(record.isDone, false);
    expect(record.timestamp, now);
    expect(record.title, "New Record");
    expect(record.quantities, List<Quantity>.empty());
    expect(record.resources, List<Resource>.empty());
    expect(record.tags.length, 1);
    expect(record.tags[0], "tag");
    expect(record.description, "Basic Description");
  });
}
