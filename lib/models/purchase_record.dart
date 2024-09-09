import 'models.dart';

class PurchaseRecord extends Record {
  String seller = "";
  String invoice = "";
  String lotNumber = "";

  PurchaseRecord(
      List<String> tags,
      String title,
      DateTime timestamp,
      String description,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      this.seller,
      this.invoice,
      this.lotNumber)
      : super(tags, title, timestamp, description, isDone, quantities,
            resources, (PurchaseRecord).toString());

  PurchaseRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    seller = data["seller"];
    invoice = data["invoice"];
    lotNumber = data["lotNumber"];
  }
}
