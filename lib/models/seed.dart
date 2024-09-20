import 'crop.dart';
import 'resource.dart';

class Seed extends Resource {
  Crop? crop;

  Seed({super.name, super.notes, this.crop}) : super();
}
