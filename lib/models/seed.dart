import 'resource.dart';
import 'crop.dart';

class Seed extends Resource {
  final Crop crop;

  Seed(super.id, super.created, super.modified, super.tags, this.crop);
}
