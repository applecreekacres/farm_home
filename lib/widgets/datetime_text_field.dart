import 'package:flutter/material.dart';

class DateTimeTextField extends StatefulWidget {
  final String labelText;
  final DateTime? value;
  final ValueChanged<DateTime?>? onChanged;
  final DateTime initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DateTimeTextField(
      {super.key,
      required this.labelText,
      required this.value,
      required this.onChanged,
      required this.initialDate,
      required this.firstDate,
      required this.lastDate});

  @override
  State<DateTimeTextField> createState() => _DateTimeTextFieldState();
}

class _DateTimeTextFieldState extends State<DateTimeTextField> {
  DateTime? _dateString;

  @override
  void initState() {
    super.initState();
    _dateString = widget.value;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: widget.firstDate ?? DateTime(1970),
        lastDate: widget.lastDate ?? DateTime(DateTime.now().year + 50));

    if (pickedDate != null) {
      _dateString = pickedDate;
      widget.onChanged?.call(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: IconButton(
              onPressed: () => _selectDate(context),
              icon: const Icon(Icons.calendar_today))),
      controller: TextEditingController(text: _dateString.toString()),
    );
  }
}
