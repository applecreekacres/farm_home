import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:farm_home/providers/providers.dart';

class CropForm extends StatefulWidget {
  final Crop? record;

  const CropForm({this.record, super.key});

  @override
  State<CropForm> createState() => _CropFormState();
}

class _CropFormState extends State<CropForm> {
  late Crop _record;
  bool _isNew = false;

  final CropFamilyProvider _family = CropFamilyProvider();

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
    return ReferenceForm<Crop>(
      reference: _record,
      isNew: _isNew,
      additionalFields: [
        StreamBuilder<List<CropFamily>>(
            stream: _family.cropFamilies,
            builder: (BuildContext context,
                AsyncSnapshot<List<CropFamily>> snapshot) {
              if (snapshot.hasError) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: const Text("Error"),
                );
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text("No crop families");
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  case ConnectionState.active:
                    return Text("No crop families retrieving");
                  case ConnectionState.done:
                    if (snapshot.data != null) {
                      var data = snapshot.data ?? [];
                      return ReferenceDropDownButton<CropFamily>(
                        label: data.first.itemName(),
                        items: data,
                        onChanged: (value) {
                          _record.cropFamilyId = value?.id;
                        },
                      );
                    }
                }
              }
              return Text("Something bad");
            }),
        IntFormField(
          label: "Days to Potting Up",
          onChanged: (value) => _record.daysToPottingUp = value ?? 0,
        ),
        IntFormField(
          label: "Days to Transplant",
          onChanged: (value) => _record.daysToTransplant = value ?? 0,
        ),
        IntFormField(
          label: "Days to Maturity",
          onChanged: (value) => _record.daysToMaturity = value ?? 0,
        ),
        IntFormField(
          label: "Harvest Window",
          onChanged: (value) => _record.harvestWindow = value ?? 0,
        ),
      ],
    );
  }
}
