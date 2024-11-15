import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class StructureForm extends StatefulWidget {
  final Structure? resource;

  const StructureForm({super.key, this.resource});

  @override
  State<StatefulWidget> createState() => _StructureFormState();
}

class _StructureFormState extends State<StructureForm> {
  late Structure _structure;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.resource == null) {
      _structure = Structure();
      _isNew = true;
    } else {
      _structure = widget.resource!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Structure>(
      resource: _structure,
      isNew: _isNew,
    );
  }
}
