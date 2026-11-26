import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class SeedForm extends ConsumerStatefulWidget {
  final Seed? resource;

  const SeedForm({super.key, this.resource});

  @override
  ConsumerState<SeedForm> createState() => _SeedFormState();
}

class _SeedFormState extends ConsumerState<SeedForm> {
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
    final crops = ref.watch(cropsProvider);
    return [
      AsyncValueView<List<Crop>>(
        value: crops,
        onData: (data) {
          return ReferenceDropDownButton<Crop>(
            initialValue: selectInitial(data),
            label: ReferenceConstants.crop,
            items: data,
            onChanged: (data) {
              _seed.cropId = (data as Crop).id;
            },
          );
        },
        onLoading: () => CircularProgressIndicator(),
        onError: (error) => const Text("No Data to load."),
      ),
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
