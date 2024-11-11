
import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/records/records.dart';
import 'package:farm_home/models/references/references.dart';
import 'package:farm_home/models/resources/resources.dart';

export 'resources/resources.dart';
export 'references/references.dart';
export 'records/records.dart';
export 'item.dart';

dynamic initRecordByItemName(Map<String, dynamic> data) {
  switch (data["itemName"]) {
    case RecordConstants.activity:
      return ActivityRecord.fromMap(data);
    case RecordConstants.harvest:
      return HarvestRecord.fromMap(data);
    case RecordConstants.input:
      return InputRecord.fromMap(data);
    case RecordConstants.maintenance:
      return MaintenanceRecord.fromMap(data);
    case RecordConstants.observation:
      return ObservationRecord.fromMap(data);
    case RecordConstants.pottingUp:
      return PottingUpRecord.fromMap(data);
    case RecordConstants.purchase:
      return PurchaseRecord.fromMap(data);
    case RecordConstants.sale:
      return SaleRecord.fromMap(data);
    case RecordConstants.seeding:
      return SeedingRecord.fromMap(data);
    case RecordConstants.transplant:
      return TransplantRecord.fromMap(data);
    default:
      return null;
  }
}

dynamic initReferenceByItemName(Map<String, dynamic> data) {
  switch (data["itemName"]) {
    case ReferenceConstants.animalSpecies:
      return AnimalSpecies.fromMap(data);
    case ReferenceConstants.crop:
      return Crop.fromMap(data);
    case ReferenceConstants.cropFamily:
      return CropFamily.fromMap(data);
    case ReferenceConstants.materialType:
      return MaterialType.fromMap(data);
    case ReferenceConstants.season:
      return Season.fromMap(data);
    case ReferenceConstants.unit:
      return Unit.fromMap(data);
    case ReferenceConstants.recordCategory:
      return RecordCategory.fromMap(data);
    default:
      return null;
  }
}

dynamic initResourceByItemName(Map<String, dynamic> data) {
  switch (data["itemName"]) {
    case ResourceConstants.animal:
      return Animal.fromMap(data);
    case ResourceConstants.equipment:
      return Equipment.fromMap(data);
    case ResourceConstants.land:
      return Land.fromMap(data);
    case ResourceConstants.material:
      return Material.fromMap(data);
    case ResourceConstants.planting:
      return Planting.fromMap(data);
    case ResourceConstants.seed:
      return Seed.fromMap(data);
    default:
      return null;
  }
}
