import 'models.dart';

class PurchaseRecord extends Record {
  String? seller = "";
  String? invoice = "";
  String? lotNumber = "";

  PurchaseRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resources,
      super.tags,
      this.seller,
      this.invoice,
      this.lotNumber});

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
