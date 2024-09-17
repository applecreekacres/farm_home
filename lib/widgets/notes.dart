import 'package:flutter/material.dart';

class NotesField extends StatelessWidget {
  final String modelField;

  const NotesField({required this.modelField, super.key});

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
        keyboardType: TextInputType.multiline,
        controller: TextEditingController(text: modelField),
      )
    ]);
  }
}
