import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progit_activity_booker/widgets/common/chip_button.dart';

class TimeDateInput extends StatefulWidget {
  final DateTime? initialTime;
  final void Function(DateTime newDate) onDateSelected;
  final String label;

  const TimeDateInput({
    this.initialTime,
    required this.label,
    required this.onDateSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<TimeDateInput> createState() => _TimeDateInputState();
}

class _TimeDateInputState extends State<TimeDateInput> {
  final _controller = TextEditingController();
  final _formatter = DateFormat('HH:mm dd-MM-yyyy');

  Future<void> _selectTime(BuildContext context) async {
    final _initialTime = widget.initialTime ?? DateTime.now();

    final _selectedDate = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDate: _initialTime,
      lastDate: _initialTime.add(const Duration(days: 365)),
      firstDate: DateTime.now(),
      context: context,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      },
    );
    if (_selectedDate == null) return;
    final _selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        _initialTime,
      ),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      },
    );
    if (_selectedTime != null) {
      final newTimeDate = DateTime(_selectedDate.year, _selectedDate.month,
          _selectedDate.day, _selectedTime.hour, _selectedTime.minute);
      widget.onDateSelected(newTimeDate);
      setState(() {
        _controller.text = _formatter.format(newTimeDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.initialTime != null) {
        _controller.text = _formatter.format(widget.initialTime!);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      autocorrect: false,
      readOnly: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Velg ${widget.label.toLowerCase()}';
        }
      },
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
        hintText: 'Endre ${widget.label.toLowerCase()}',
        suffix: ChipButton(
          label: 'Endre',
          onClick: () => _selectTime(context),
        ),
      ),
    );
  }
}
