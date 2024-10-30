import 'package:flutter/material.dart';

class DateTimeTextField extends StatefulWidget {
  final String labelText;
  final DateTime? value;
  final ValueChanged<DateTime?>? onChanged;
  final DateTime initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool pickTime;

  const DateTimeTextField({
    super.key,
    required this.labelText,
    required this.value,
    required this.onChanged,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.pickTime = true,
  });

  @override
  State<DateTimeTextField> createState() => _DateTimeTextFieldState();
}

class _DateTimeTextFieldState extends State<DateTimeTextField> {
  late DateTime _dateString;
  bool _selectionMade = false;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      _dateString = widget.value!;
    } else {
      _dateString = DateTime.now();
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: widget.firstDate ?? DateTime(1970),
        lastDate: widget.lastDate ?? DateTime(DateTime.now().year + 50));

    if (pickedDate != null) {
      _dateString = pickedDate;
      _selectionMade = true;
      if (widget.pickTime) {
        // ignore: use_build_context_synchronously
        await _selectTime(context);
      }

      if (_selectionMade) {
        setState(() {
          widget.onChanged?.call(_dateString);
        });
      }
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (pickedTime != null) {
      _dateString = DateTime(_dateString.year, _dateString.month,
          _dateString.day, pickedTime.hour, pickedTime.minute);
      _selectionMade = true;
    } else {
      _selectionMade = false;
    }
  }

  String? _getDateString() {
    if (widget.value == null) {
      // Return null so that text box is empty
      return null;
    } else if (!widget.pickTime) {
      // Return date without time since we did not pick a time
      return _dateString.toString().substring(0, 10);
    }
    // Return the date and time but no millisecond on down since we don't pick those
    return _dateString.toString().substring(0, 19);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: TextEditingController(text: _getDateString()),
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: () {
            _selectionMade = false;
            _selectDate(context);
          },
          icon: const Icon(Icons.calendar_today),
        ),
      ),
    );
  }
}
