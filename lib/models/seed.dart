import 'resource.dart';
import 'crop.dart';

class Seed extends Resource {
  Crop crop;

  Seed(List<String> tags, this.crop) : super(tags, (Seed).toString());
}
