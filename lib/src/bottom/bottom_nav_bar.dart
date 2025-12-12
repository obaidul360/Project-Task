import 'package:flutter/material.dart';

import '../product_src_code/home/home_ui.dart';


class BottomNavigatinBartScren extends StatefulWidget {
  const BottomNavigatinBartScren({super.key});

  @override
  State<BottomNavigatinBartScren> createState() =>
      _BottomNavigatinBartScrenState();
}

class _BottomNavigatinBartScrenState extends State<BottomNavigatinBartScren> {
  int _screenIndex = 0;
  List screen = [HomeUiPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _screenIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits, size: 35,color: Colors.brown,),
            label: "Task-2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2_sharp, size: 35,color: Colors.brown),
            label: "Task-3",
          ),
        ],
      ),
    );
  }
}
