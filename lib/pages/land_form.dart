import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class LandForm extends StatefulWidget {
  const LandForm({super.key});

  @override
  State<StatefulWidget> createState() => _LandFormState();
}

class _LandFormState extends State<LandForm> {
  final _formKey = GlobalKey<FormState>();

  final Land _land = Land();

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Land>(
      resource: _land,
      key: _formKey,
    );
  }
}
