import 'package:flutter/material.dart';
import 'package:tracking/auto_export.dart';
import 'package:tracking/extensions/time_of_day_extension.dart';

class TimeOfDayPicker extends StatefulWidget {

  final TimeOfDay initialTimeOfDay;
  final Function onSelectTimeOfDay;

  const TimeOfDayPicker(this.initialTimeOfDay, this.onSelectTimeOfDay, { Key key }) 
    : assert(initialTimeOfDay != null && onSelectTimeOfDay != null), super(key: key);

  @override
  _TimeOfDayPickerState createState() => _TimeOfDayPickerState();
}

class _TimeOfDayPickerState extends State<TimeOfDayPicker> {

  TimeOfDay _time;

  @override
  void initState() {
    _time = widget.initialTimeOfDay;
    super.initState();
  }

  void _selectTime() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: _time,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (selectedTime != null) {
      setState(() { _time = selectedTime; });
      widget.onSelectTimeOfDay(selectedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.themeColor, width: 2)
        ),
        child: Text(
          _time?.formartToHourAndMinute ?? AppStrings.selectTimeOfDay,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
        ),
      ),
      onTap: _selectTime,
    );
  }

}
