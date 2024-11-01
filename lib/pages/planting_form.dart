import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PlantingForm extends StatefulWidget {
  final Planting? resource;

  const PlantingForm({super.key, this.resource});

  @override
  State<StatefulWidget> createState() => _PlantingFormState();
}

class _PlantingFormState extends State<PlantingForm> {
  final _formKey = GlobalKey<FormState>();

  late Planting _planting;
  late Season? _season;

  CropFamily? _selectableCropFamily;

  @override
  void initState() {
    if (widget.resource != null) {
      _planting = widget.resource!;
    } else {
      _planting = Planting();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final refProvider = Provider.of<ReferenceProvider>(context);

    return ResourceForm<Planting>(
      resource: _planting,
      isNew: true,
      key: _formKey,
      additionalFields: [
        Column(
          children: [
            FutureWidget(
                future: refProvider.seasons,
                onData: (data) {
                  if (data != null) {
                    if (_planting.seasonId == "") {
                      _season = data.first;
                      _planting.seasonId = data.first.id;
                    }
                    return ReferenceDropDownButton<Season>(
                      initialValue: _season,
                      label: ReferenceConstants.season,
                      items: data,
                      onChanged: (data) {
                        _planting.seasonId = data!.id;
                        setState(() {
                          _season = data;
                        });
                      },
                    );
                  }
                  return Text("No Seasons to load");
                }),
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
