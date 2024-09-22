import 'package:flutter/material.dart';

class NotesField extends StatelessWidget {
  final String modelField;
  final ValueChanged<String>? onChanged;

  const NotesField({required this.modelField, this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        'Notes',
        textAlign: TextAlign.left,
      ),
      TextFormField(
        minLines: 5,
        maxLines: null,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        keyboardType: TextInputType.multiline,
        controller: TextEditingController(text: modelField),
        onChanged: (value) {
          onChanged?.call(value);
        },
      )
    ]);
  }
}
