import 'resource.dart';
import 'crop.dart';

class Seed extends Resource {
  final Crop crop;

  Seed(super.tags, this.crop);
}
