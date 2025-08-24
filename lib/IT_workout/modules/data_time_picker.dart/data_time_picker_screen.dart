import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class DataTimePickerScreen extends StatefulWidget {
  final String? initialTimeString; // الوقت القادم من الباك اند
  final void Function(String) onTimeSelected; // دالة إرسال الوقت للباك

  const DataTimePickerScreen({
    Key? key,
    this.initialTimeString,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  State<DataTimePickerScreen> createState() => _DataTimePickerScreenState();
}

class _DataTimePickerScreenState extends State<DataTimePickerScreen> {
  late DateTime _selectedTime;

  @override
  void initState() {
    super.initState();
    if (widget.initialTimeString != null) {
      final parts = widget.initialTimeString!.split(':');
      _selectedTime = DateTime(
        int.parse(parts[0]),
        int.parse(parts[1]),
        int.parse(parts[2]),
      );
    } else {
      _selectedTime = DateTime.now();
    }
  }

  String get formattedTime {
    return "${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}:${_selectedTime.second.toString().padLeft(2, '0')}";
  }

  void _pickTime() {
    DatePicker.showTimePicker(
      context,
      showSecondsColumn: false,
      currentTime: _selectedTime,
      onConfirm: (time) {
        setState(() {
          _selectedTime = time;
        });

        widget.onTimeSelected(formattedTime);
      },
      locale: LocaleType.en,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickTime,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          formattedTime,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
