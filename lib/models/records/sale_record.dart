import 'records.dart';

class SaleRecord extends Record {
  String? customer = "";
  String? invoice = "";
  String? lotNumber = "";

  SaleRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resources,
      super.tags,
      this.customer,
      this.invoice,
      this.lotNumber});

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

  @override
  String itemName() {
    return "Sale";
  }
}
