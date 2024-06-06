import 'package:flutter/material.dart';
import 'package:pocket_exercise/components/Colors.dart';
import 'package:pocket_exercise/pages/HomePage.dart'; // Asegúrate de importar las páginas correctas
import 'package:pocket_exercise/pages/TimerPage.dart';
import 'package:pocket_exercise/pages/CalendarPage.dart';

class AppLayout extends StatefulWidget {
  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 1; // Inicializa para que HomePage sea la primera página

  final List<Widget> _pages = [
    TimerPage(),
    HomePage(),
    CalendarPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary.color,
        title: Text(
          "Pocket Exercise",
          style: TextStyle(color: AppColors.third.color),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.secondary.color,
        unselectedItemColor: AppColors.third.color,
        selectedItemColor: Colors.white, // Color de los íconos seleccionados
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
        ],
      ),
    );
  }
}
