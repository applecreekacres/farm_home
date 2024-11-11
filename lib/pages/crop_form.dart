import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:provider/provider.dart';

class CropForm extends StatefulWidget {
  final Crop? crop;

  const CropForm({this.crop, super.key});

  @override
  State<CropForm> createState() => _CropFormState();
}

class _CropFormState extends State<CropForm> {
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
    final refProvider = Provider.of<ReferenceProvider>(context);
    return ReferenceForm<Crop>(
      reference: _crop,
      isNew: _isNew,
      additionalFields: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureWidget<List<CropFamily>>(
            future: refProvider.cropFamilies,
            onData: (data) {
              if (data != null) {
                data.sort((a, b) => a.name.compareTo(b.name));
                    return ReferenceDropDownButton<CropFamily>(
                      initialValue: data.where((item) => item.id == _crop.cropFamilyId).firstOrNull,
                      label: data.first.itemName(),
                      items: data,
                      onChanged: (value) {
                        _crop.cropFamilyId = value?.id ?? "";
                      },
                    );
              } else {
                return const Text("No Crop families");
              }
            },
            onLoading: () => CircularProgressIndicator(),
            onError: (p0) => const Text("Failed to load crop families"),
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
