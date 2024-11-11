import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:provider/provider.dart';

class CropForm extends StatefulWidget {
  final Crop? record;

  const CropForm({this.record, super.key});

  @override
  State<CropForm> createState() => _CropFormState();
}

class _CropFormState extends State<CropForm> {
  late Crop _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = Crop();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final refProvider = Provider.of<ReferenceProvider>(context);
    return ReferenceForm<Crop>(
      reference: _record,
      isNew: _isNew,
      additionalFields: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureWidget<List<CropFamily>>(
            future: refProvider.cropFamilies,
            onData: (data) {
              if (data != null) {
                data.sort((a, b) => a.name.compareTo(b.name));
                return FutureWidget(
                  future: refProvider.access.getItemById<CropFamily>(_record.cropFamilyId, (item) => CropFamily.fromMap(item)),
                  onData: (family) {
                    return ReferenceDropDownButton<CropFamily>(
                      initialValue: family,
                      label: data.first.itemName(),
                      items: data,
                      onChanged: (value) {
                        _record.cropFamilyId = value?.id ?? "";
                      },
                    );
                  },
                  onLoading: () => CircularProgressIndicator(),
                  onError: (p0) => const Text("Failed to get field"),
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
          controllerValue: _record.daysToPottingUp,
          onChanged: (value) => _record.daysToPottingUp = value,
        ),
        IntFormField(
          label: "Days to Transplant",
          controllerValue: _record.daysToTransplant,
          onChanged: (value) => _record.daysToTransplant = value,
        ),
        IntFormField(
          label: "Days to Maturity",
          controllerValue: _record.daysToMaturity,
          onChanged: (value) => _record.daysToMaturity = value,
        ),
        IntFormField(
          label: "Harvest Window",
          controllerValue: _record.harvestWindow,
          onChanged: (value) => _record.harvestWindow = value,
        ),
      ],
    );
  }
}
