import 'item.dart';

class Resource extends Item {
  Resource(super.id, super.created, super.modified, super.tags);

  Resource.fromMap(super.data) : super.fromMap();

}