import 'package:flutter/material.dart';
import 'package:pocket_exercise/components/Exercises.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:pocket_exercise/components/Colors.dart';
import 'package:pocket_exercise/pages/TimerPage.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  String getExerciseForDay(DateTime date) {
    final int dayOfRoutine =
        (date.difference(DateTime(2024, 6, 6)).inDays % 28) + 1;
    return exerciseRoutine[dayOfRoutine] ?? "Rest";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.color,
      appBar: AppBar(
        backgroundColor: AppColors.primary.color,
        title: Text(
          "Calendar",
          style: TextStyle(color: AppColors.third.color),
        ),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2021, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TimerPage(selectedDay: selectedDay),
            ),
          );
        },
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, date, events) {
            final exercise = getExerciseForDay(date);
            return Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: exercise == "Rest"
                    ? Colors.grey
                    : AppColors.secondary.color,
                shape: BoxShape.circle,
              ),
              child: Text(
                exercise,
                style: TextStyle(color: AppColors.third.color, fontSize: 10),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
        calendarFormat: CalendarFormat.month,
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
        },
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: AppColors.secondary.color,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: AppColors.primary.color,
            shape: BoxShape.circle,
          ),
          defaultTextStyle: TextStyle(color: AppColors.third.color),
        ),
      ),
    );
  }
}
