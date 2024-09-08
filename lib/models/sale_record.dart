import 'package:farm_home/models/quantity.dart';

import 'record.dart';

class SaleRecord extends Record {
  String customer = "";
  String invoice = "";
  String lotNumber = "";

  SaleRecord(List<String> tags, String title, String description, bool isDone,
      List<Quantity> quantities, this.customer, this.invoice, this.lotNumber)
      : super(tags, title, description, isDone, quantities,
            (SaleRecord).toString());

  SaleRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    customer = data["customer"];
    invoice = data["invoice"];
    lotNumber = data["lotNumber"];
  }
}
