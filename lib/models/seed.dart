import 'resource.dart';
import 'crop.dart';

class Seed extends Resource {
  Crop crop;

  Seed(super.name, super.notes, this.crop) : super();
}
