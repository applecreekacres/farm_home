import 'models.dart';

class SaleRecord extends Record {
  String customer = "";
  String invoice = "";
  String lotNumber = "";

  SaleRecord(
      List<String> tags,
      String title,
      DateTime timestamp,
      String description,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      this.customer,
      this.invoice,
      this.lotNumber)
      : super(tags, title, timestamp, description, isDone, quantities,
            resources, (SaleRecord).toString());

  SaleRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    customer = data["customer"];
    invoice = data["invoice"];
    lotNumber = data["lotNumber"];
  }
}
