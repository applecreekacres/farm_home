import 'models.dart';

class PurchaseRecord extends Record {
  String seller = "";
  String invoice = "";
  String lotNumber = "";

  PurchaseRecord(
      String title,
      DateTime timestamp,
      String description,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      List<String> tags,
      this.seller,
      this.invoice,
      this.lotNumber)
      : super(title, timestamp, description, isDone, quantities, resources,
            tags, (PurchaseRecord).toString());

  PurchaseRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    seller = data["seller"];
    invoice = data["invoice"];
    lotNumber = data["lotNumber"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"seller": seller, "invoice": invoice, "lotNumber": lotNumber});
    return map;
  }
}
