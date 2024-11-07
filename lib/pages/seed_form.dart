import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SeedForm extends StatefulWidget {
  final Seed? resource;

  const SeedForm({super.key, this.resource});

  @override
  State<StatefulWidget> createState() => _SeedFormState();
}

class _SeedFormState extends State<SeedForm> {
  late Seed _seed;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.resource == null) {
      _seed = Seed();
      _isNew = true;
    } else {
      _seed = widget.resource!;
    }
    super.initState();
  }

  Crop selectInitial(List<Crop> items) {
    if (_seed.cropId == "") {
      return items.first;
    } else {
      return items.where((item) => item.id == _seed.cropId).first;
    }
  }

  List<Widget> buildFields(BuildContext context) {
    var refProvider = Provider.of<ReferenceProvider>(context);
    return [
      FutureWidget(
        future: refProvider.crops,
        onData: (data) {
          if (data != null) {
            return ReferenceDropDownButton<Crop>(
              initialValue: selectInitial(data),
              label: ReferenceConstants.crop,
              items: data,
              onChanged: (data) {
                _seed.cropId = (data as Crop).id;
              },
            );
          } else {
            return Text("No Data to load.");
          }
        },
        onLoading: () => CircularProgressIndicator(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Seed>(
      resource: _seed,
      isNew: _isNew,
      additionalFields: buildFields(context),
    );
  }
}
