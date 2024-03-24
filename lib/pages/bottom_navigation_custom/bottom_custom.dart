import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/detail/detail_page.dart';
import 'package:weather_app/pages/home/home_page.dart';

class BottomNavigationCustom extends StatefulWidget{
  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {
  List<BottomNavigationBarItem> listItem = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.list_bullet), label: 'List'),
  ];
  List<Widget> listPage = [HomePage(),DetailPage()];
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
          items: listItem,
        onTap: (index){
          setState(() {
            activePage=index;
          });
        },
        currentIndex: activePage,
        backgroundColor: Colors.white12,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
      ),
      body:listPage[activePage],

    );
  }
}