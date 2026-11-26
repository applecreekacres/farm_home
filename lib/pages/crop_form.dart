import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:farm_home/providers/providers.dart';

class CropForm extends ConsumerStatefulWidget {
  final Crop? crop;

  const CropForm({this.crop, super.key});

  @override
  ConsumerState<CropForm> createState() => _CropFormState();
}

class _CropFormState extends ConsumerState<CropForm> {
  late Crop _crop;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.crop == null) {
      _crop = Crop();
      _isNew = true;
    } else {
      _crop = widget.crop!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final families = ref.watch(cropFamiliesProvider);
    return ReferenceForm<Crop>(
      reference: _crop,
      isNew: _isNew,
      additionalFields: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AsyncValueView<List<CropFamily>>(
            value: families,
            onData: (data) {
              if (data.isEmpty) {
                return const Text("No Crop families");
              }
              final sorted = [...data]
                ..sort((a, b) => a.name.compareTo(b.name));
              return ReferenceDropDownButton<CropFamily>(
                initialValue: sorted
                    .where((item) => item.id == _crop.cropFamilyId)
                    .firstOrNull,
                label: sorted.first.itemName(),
                items: sorted,
                onChanged: (value) {
                  _crop.cropFamilyId = value?.id ?? "";
                },
              );
            },
            onLoading: () => CircularProgressIndicator(),
            onError: (error) => const Text("Failed to load crop families"),
          ),
        ),
        IntFormField(
          label: "Days to Potting Up",
          controllerValue: _crop.daysToPottingUp,
          onChanged: (value) => _crop.daysToPottingUp = value,
        ),
        IntFormField(
          label: "Days to Transplant",
          controllerValue: _crop.daysToTransplant,
          onChanged: (value) => _crop.daysToTransplant = value,
        ),
        IntFormField(
          label: "Days to Maturity",
          controllerValue: _crop.daysToMaturity,
          onChanged: (value) => _crop.daysToMaturity = value,
        ),
        IntFormField(
          label: "Harvest Window",
          controllerValue: _crop.harvestWindow,
          onChanged: (value) => _crop.harvestWindow = value,
        ),
      ],
    );
  }
}
