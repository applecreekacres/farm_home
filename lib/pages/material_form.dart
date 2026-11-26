import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart' hide Material, MaterialType;

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:farm_home/widgets/widgets.dart';

class MaterialForm extends ConsumerStatefulWidget {
  final Material? resource;

  const MaterialForm({super.key, this.resource});

  @override
  ConsumerState<MaterialForm> createState() => _MaterialFormState();
}

class _MaterialFormState extends ConsumerState<MaterialForm> {
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
    final materialTypes = ref.watch(materialTypesProvider);

    return [
      AsyncValueView<List<MaterialType>>(
        value: materialTypes,
        onData: (data) {
          if (data.isEmpty) {
            return const Text("There are no material types to load");
          }
          final MaterialType materialType;
          if (_material.materialTypeId == "") {
            materialType = data.first;
          } else {
            materialType = data.where((item) => item.id == _material.id).first;
          }
          return ReferenceDropDownButton(
            initialValue: materialType,
            label: ReferenceConstants.materialType,
            items: data,
          );
        },
      ),
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
