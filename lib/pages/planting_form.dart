import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart' hide Material;
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

  @override
  void initState() {
    if (widget.resource != null) {
      _planting = widget.resource!;
    } else {
      _planting = Planting();
    }
    super.initState();
  }

  List<Widget> buildFields(BuildContext context) {
    final refProvider = Provider.of<ReferenceProvider>(context);
    var theme = Theme.of(context);
    Season? season;
    Crop? _crop;

    var fields = [
      FutureWidget(
        future: refProvider.seasons,
        onData: (data) {
          if (data != null) {
            if (_planting.seasonId == "") {
              season = data.first;
              _planting.seasonId = data.first.id;
            } else {
              season ??=
                  data.where((item) => item.id == _planting.seasonId).first;
            }
            return ReferenceDropDownButton<Season>(
              initialValue: season,
              label: ReferenceConstants.season,
              items: data,
              onChanged: (data) {
                _planting.seasonId = data!.id;
                setState(() {
                  season = data;
                });
              },
            );
          }
          return Text("No Seasons to load");
        },
      ),
      FutureWidget(
        future: refProvider.crops,
        onData: (data) {
          if (data != null) {
            if (_planting.cropId == "") {
              _crop = data.first;
              _planting.cropId = data.first.id;
            } else {
              _crop ??= data.where((item) => item.id == _planting.cropId).first;
            }
            return ReferenceDropDownButton(
              initialValue: _crop,
              label: ReferenceConstants.crop,
              items: data,
              onChanged: (data) {
                _planting.cropId = data!.id;
                _planting.daysToPottingUp = data.daysToPottingUp;
                _planting.daysToTransplant = data.daysToTransplant;
                _planting.daysToHarvest = data.daysToMaturity;
                setState(() {
                  _crop = data;
                });
              },
            );
          } else {
            return Text("No crop to load");
          }
        },
      ),
      ExpandedRowBox(
        children: [
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
        ],
      ),
    ];

    if (_planting.plantingMethod == PlantingMethod.greenhouseSow) {
      fields.add(
        ExpandedRowBox(
          children: [
            IntFormField(
              label: "Days to Potting Up",
              controllerValue: _planting.daysToPottingUp,
              onChanged: (value) {
                _planting.daysToPottingUp = value;
              },
            ),
          ],
        ),
      );
    }

    if (_planting.plantingMethod == PlantingMethod.greenhouseSow ||
        _planting.plantingMethod == PlantingMethod.transplantFromPurchased) {
      fields.add(
        ExpandedRowBox(
          children: [
            IntFormField(
              label: "Days to Transplant",
              controllerValue: _planting.daysToTransplant,
              onChanged: (value) {
                _planting.daysToTransplant = value;
              },
            ),
          ],
        ),
      );
    }

    fields.add(
      ExpandedRowBox(
        children: [
          IntFormField(
            label: "Days to Harvest",
            controllerValue: _planting.daysToHarvest,
            onChanged: (value) {
              _planting.daysToHarvest = value;
            },
          ),
          IntFormField(
            label: "Harvest Window",
            controllerValue: _planting.harvestWindow,
            onChanged: (value) {
              _planting.harvestWindow = value;
            },
          ),
        ],
      ),
    );

    return [
      Column(
        children: fields,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Planting>(
      resource: _planting,
      isNew: widget.resource != null ? false : true,
      key: _formKey,
      additionalFields: buildFields(context),
    );
  }
}
