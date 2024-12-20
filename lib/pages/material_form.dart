import 'package:flutter/material.dart' hide Material, MaterialType;

import 'package:provider/provider.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:farm_home/widgets/widgets.dart';

class MaterialForm extends StatefulWidget {
  final Material? resource;

  const MaterialForm({super.key, this.resource});

  @override
  State<StatefulWidget> createState() => _MaterialFormState();
}

class _MaterialFormState extends State<MaterialForm> {
  late Material _material;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.resource == null) {
      _material = Material();
      _isNew = true;
    } else {
      _material = widget.resource!;
    }
    super.initState();
  }

  List<Widget> buildFields(BuildContext context) {
    var refProvider = Provider.of<ReferenceProvider>(context);
    MaterialType materialType;

    return [
      FutureWidget(
          future: refProvider.materialType,
          onData: (data) {
            if (data != null) {
              if (_material.materialTypeId == "") {
                materialType = data.first;
              } else {
                materialType =
                    data.where((item) => item.id == _material.id).first;
              }
              return ReferenceDropDownButton(
                  initialValue: materialType,
                  label: ReferenceConstants.materialType,
                  items: data);
            } else {
              return const Text("There are no material types to load");
            }
          }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Material>(
      resource: _material,
      isNew: _isNew,
      additionalFields: buildFields(context),
    );
  }
}
