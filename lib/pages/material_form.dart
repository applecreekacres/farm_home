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
  final _formKey = GlobalKey<FormState>();

  final Material _material = Material();

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Material>(
      resource: _material,
      isNew: true,
      key: _formKey,
    );
  }
}
