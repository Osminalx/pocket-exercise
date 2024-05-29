import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLayout extends StatefulWidget {
  final Widget child;

  AppLayout({required this.child});

  @override
  _AppLayoutState createState() => _AppLayoutState();
}

//Paleta de colores:
//bg: rgb(22, 25, 35)
//btns and extras: rgb(40, 46, 64)
//text and icons: rgb(157, 157, 168)

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _primaryColor = const Color.fromRGBO(22, 25, 35, 1);
  final _secondaryColor = const Color.fromRGBO(40, 46, 64, 1);
  final _thirdColor = const Color.fromRGBO(157, 157, 168, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        title: const Text(
          "Pocket Exercise",
          style: TextStyle(color: _thirdColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: widget.child),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _secondaryColor,
        unselectedItemColor: _thirdColor,
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
