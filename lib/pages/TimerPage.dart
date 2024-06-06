import 'package:flutter/material.dart';
import 'package:pocket_exercise/components/Colors.dart';

class TimerPage extends StatelessWidget {
  final DateTime selectedDay;

  TimerPage({DateTime? selectedDay})
      : selectedDay = selectedDay ?? DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.color,
      appBar: AppBar(
        title: Text(
          "Timer Page",
          style: TextStyle(color: AppColors.third.color),
        ),
        backgroundColor: AppColors.primary.color,
      ),
      body: Center(
        child: Text(
          'Timer for ${selectedDay.toLocal()}',
          style: TextStyle(color: AppColors.third.color),
        ),
      ),
    );
  }
}
