import 'models.dart';

class Record extends Item {
  String _title = "";
  String _description = "";
  bool _isDone = false;
  List<Quantity> _quantities = List<Quantity>.empty();
  String _recordType = "";
  DateTime _timestamp = DateTime.now();
  List<Resource> _resources = List<Resource>.empty();

  String get title => _title;

  String get description => _description;

  bool get isDone => _isDone;

  List<Quantity> get quantities => _quantities;

  String get recordType => _recordType;

  DateTime get timestamp => _timestamp;

  List<Resource> get resources => _resources;

  set title(String t) {
    if (t != _title) {
      _title = t;
      update();
    }
  }

  set description(String t) {
    if (t != _description) {
      _description = t;
      update();
    }
  }

  set isDone(bool f) {
    if (f != _isDone) {
      _isDone = f;
      update();
    }
  }

  set timestamp(DateTime t) {
    if (t != _timestamp) {
      _timestamp = t;
      update();
    }
  }

  Record(super.tags, this._title, this._timestamp, this._description,
      this._isDone, this._quantities, this._resources, this._recordType);

  Record.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _title = data["title"];
    _description = data["description"];
    _isDone = data["isDone"];
    _quantities = data["quantities"];
    _recordType = data["recordType"];
    _resources = List<Resource>.from(data["resources"]);
    _timestamp = DateTime.fromMillisecondsSinceEpoch(data["timestamp"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "title": _title,
      "description": _description,
      "isDone": _isDone,
      "quantities": _quantities,
      "recordType": _recordType,
      "resources": _resources.map((res) => res.id).toList(),
      "timestamp": _timestamp.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
