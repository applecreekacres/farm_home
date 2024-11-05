import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class LandForm extends StatefulWidget {
  final Land? resource;

  const LandForm({super.key, this.resource});

  @override
  State<StatefulWidget> createState() => _LandFormState();
}

class _LandFormState extends State<LandForm> {
  late Land _land;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.resource == null) {
      _land = Land();
      _isNew = true;
    } else {
      _land = widget.resource!;
    }
    super.initState();
  }

  List<Widget> buildFields() {
    return [
      LabeledDropdownButton<LandType>(
        initialValue: _land.landType,
        label: "Land Type",
        items: LandType.values,
        itemView: (item) {
          return Text(item.toString().split('.')[1]);
        },
        onChanged: (item) {
          _land.landType = item!;
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Land>(
      resource: _land,
      isNew: _isNew,
      additionalFields: buildFields(),
    );
  }
}
