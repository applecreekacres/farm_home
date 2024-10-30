import 'package:flutter/material.dart' hide Material;

import 'package:farm_home/models/models.dart';
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

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Material>(
      resource: _material,
      isNew: _isNew,
    );
  }
}
