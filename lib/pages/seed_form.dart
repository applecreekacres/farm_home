import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Seed>(
      resource: _seed,
      isNew: _isNew,
    );
  }
}
