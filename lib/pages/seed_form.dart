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
  final _formKey = GlobalKey<FormState>();

  final Seed _seed = Seed();

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Seed>(
      resource: _seed,
      isNew: true,
      key: _formKey,
    );
  }
}
