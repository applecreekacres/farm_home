import 'package:farm_home/models/models.dart';
import 'package:farm_home/pages/animal_form.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

class AnimalListPage extends ConsumerWidget {
  const AnimalListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animals = ref.watch(animalsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Animals"),
      ),
      drawer: const FarmHomeDrawer(),
      body: AsyncValueView<List<Animal>>(
        value: animals,
        onData: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final animal = data[index];
              return ListTile(
                title: Text(animal.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimalForm(resource: animal),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AnimalForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
