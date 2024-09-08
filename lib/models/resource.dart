import 'item.dart';

class Resource extends Item {
  Resource(super.tags);

  Resource.fromMap(super.data) : super.fromMap();
}
