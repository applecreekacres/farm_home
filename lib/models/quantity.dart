class Quantity {
  String unit = "";
  double value = 0;

  // TODO Come up with something for unit types so that units can be related or better understood.

  Quantity(this.unit, this.value);

  Quantity.fromMap(Map<String, dynamic> data) {
    unit = data["unit"];
    value = data["value"];
  }

  Map<String, dynamic> toMap() {
    return {"unit": unit, "value": value};
  }
}
