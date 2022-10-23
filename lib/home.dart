import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'simpan.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';
import 'main.dart';
import 'dart:io';
import 'infors.dart';
import 'home/alarmobat.dart';

import 'package:flutter_grid_button/flutter_grid_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(body: Center(child: Home())));
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State {
  int _selectedIndex = 1;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => MyApp(),
            transitionDuration: Duration(seconds: 0),
          ),
        );
        print("Berita");
      } else if (index == 1) {
        print("Hitung");
      } else if (index == 2) {
        print("RS");
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => InfoRS(),
            transitionDuration: Duration(seconds: 0),
          ),
        );
      }
    });
  }

  final textStyle = TextStyle(fontSize: 26);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Health News ID"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        color: Colors.red),
                    child: Center(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: AlarmObat()),
                            );
                          },
                          color: Colors.white,
                          icon: Icon(Icons.alarm),
                        ),
                        Text(
                          "Alarm Obat",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        color: Colors.red),
                    child: Center(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: Icon(Icons.monitor_weight),
                        ),
                        Text("Hitung BMI",
                            style: TextStyle(color: Colors.white))
                      ],
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        color: Colors.red),
                    child: Center(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: Icon(Icons.restaurant),
                        ),
                        Text("Hitung Kalori",
                            style: TextStyle(color: Colors.white))
                      ],
                    ))),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: "Berita"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital), label: "Rumah Sakit"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
