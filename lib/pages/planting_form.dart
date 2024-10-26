import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PlantingForm extends StatefulWidget {
  const PlantingForm({super.key});

  @override
  State<StatefulWidget> createState() => _PlantingFormState();
}

class _PlantingFormState extends State<PlantingForm> {
  final _formKey = GlobalKey<FormState>();

  final Planting _planting = Planting();

  CropFamily? _selectableCropFamily;

  @override
  Widget build(BuildContext context) {
    final refProvider = Provider.of<ReferenceProvider>(context);
    final resProvider = Provider.of<ResourceProvider>(context);
    Crop crop;

    return ResourceForm<Planting>(
      resource: _planting,
      isNew: true,
      key: _formKey,
      additionalFields: [
        Column(
          children: [
            // FutureWidget(
            //     future: refProvider.cropFamilies,
            //     onData: (data) {
            //       if (data != null) {
            //         return ReferenceDropDownButton<CropFamily>(
            //           label: ReferenceConstants.cropFamily,
            //           items: data,
            //           onChanged: (value) {
            //             setState(() {
            //               _selectableCropFamily = value;
            //             });
            //           },
            //         );
            //       }
            //       return const Text("Error loading crop families");
            //     }),
            // FutureWidget(
            //     future: refProvider.crops,
            //     onData: (data) {
            //       if (data != null && _selectableCropFamily != null) {
            //         var items = data
            //             .where((item) =>
            //                 item.cropFamilyId == _selectableCropFamily?.id)
            //             .toList();
            //         return ReferenceDropDownButton<Crop>(
            //           label: ReferenceConstants.crop,
            //           items: items,
            //           onChanged: (value) {
            //             if (value != null) {
            //               setState(() {
            //                 crop = value;
            //               });
            //             }
            //           },
            //         );
            //       }
            //       return const Text("Select a crop family");
            //     }),
            IntFormField(
              label: "Length",
              controllerValue: _planting.length,
              onChanged: (value) {
                _planting.length = value;
              },
            ),
            IntFormField(
              label: "Rows",
              onChanged: (value) => _planting.rows = value,
              controllerValue: _planting.rows,
            ),
            IntFormField(
                label: "In-Row Spacing",
                controllerValue: _planting.inRowSpacing,
                onChanged: (value) => _planting.inRowSpacing = value),
            IntFormField(
              label: "Days to Potting Up",
              onChanged: (value) {
                _planting.daysToPottingUp = value;
              },
            ),
            IntFormField(
              label: "Days to Transplant",
              onChanged: (value) {
                _planting.daysToTransplant = value;
              },
            ),
            IntFormField(
              label: "Days to Harvest",
              onChanged: (value) {
                _planting.daysToHarvest = value;
              },
            ),
            IntFormField(
              label: "Harvest Window",
              onChanged: (value) {
                _planting.harvestWindow = value;
              },
            )
          ],
        ),
      ],
    );
  }
}
