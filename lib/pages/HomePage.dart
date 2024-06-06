import 'package:flutter/material.dart';
import 'package:pocket_exercise/components/Colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _quote = "Loading...";

  @override
  void initState() {
    super.initState();
    _fetchQuote();
  }

  Future<void> _fetchQuote() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      setState(() {
        _quote = json.decode(response.body)['content'];
      });
    } else {
      setState(() {
        _quote = "Failed to load quote";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.primary.color, // Establece el color de fondo aquí
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rutinas de la Semana',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.third.color,
              ),
            ),
            SizedBox(height: 10),
            _buildMiniCalendar(),
            SizedBox(height: 20),
            Text(
              'Frase Motivacional',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.third.color,
              ),
            ),
            SizedBox(height: 10),
            _buildQuoteCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2021, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.week,
      availableCalendarFormats: const {
        CalendarFormat.week: 'Week',
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
    );
  }

  Widget _buildQuoteCard() {
    return Card(
      color: AppColors.secondary.color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          _quote,
          style: TextStyle(color: AppColors.third.color, fontSize: 16),
        ),
      ),
    );
  }
}
