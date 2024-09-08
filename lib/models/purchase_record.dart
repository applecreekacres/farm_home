import 'package:farm_home/models/quantity.dart';

import 'record.dart';

class PurchaseRecord extends Record {
  String seller = "";
  String invoice = "";
  String lotNumber = "";

  PurchaseRecord(List<String> tags, String title,
      DateTime timestamp, String description, bool isDone,
      List<Quantity> quantities, this.seller, this.invoice, this.lotNumber)
      : super(tags, title, timestamp, description, isDone, quantities,
            (PurchaseRecord).toString());

  PurchaseRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    seller = data["seller"];
    invoice = data["invoice"];
    lotNumber = data["lotNumber"];
  }
}
