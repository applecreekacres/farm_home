import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';

class NotesField extends StatelessWidget {
  String modelField;
  final ValueChanged<String>? onChanged;

  NotesField({required this.modelField, required this.onChanged, super.key});

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
        onChanged: (value) {
          modelField = value;
          onChanged?.call(value);
        },
      )
    ]);
  }
}
