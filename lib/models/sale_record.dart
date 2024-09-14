import 'models.dart';

class SaleRecord extends Record {
  String customer = "";
  String invoice = "";
  String lotNumber = "";

  SaleRecord(
      String title,
      DateTime timestamp,
      String notes,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      List<String> tags,
      this.customer,
      this.invoice,
      this.lotNumber)
      : super(title, timestamp, notes, isDone, quantities, resources,
            tags, (SaleRecord).toString());

  SaleRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    customer = data["customer"];
    invoice = data["invoice"];
    lotNumber = data["lotNumber"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll(
        {"customer": customer, "invoice": invoice, "lotNumber": lotNumber});
    return map;
  }
}
