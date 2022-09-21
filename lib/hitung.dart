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

import 'package:gridview_menu/gridview_menu.dart';

class HitungScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,

        child: Scaffold(
            body: Center(
                child: Hitung()
            )
        )
    );
  }
}


class Hitung extends StatefulWidget {
  @override
  HitungState createState() => HitungState();
}
class HitungState extends State {
  int _selectedIndex = 1;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      if (index==0){
        Navigator.push(
          context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => MyApp(),
              transitionDuration: Duration(seconds: 0),
            ),
        );
        print("Berita");
      } else if (index==1){
        print("Hitung");
        

      }else if (index==2){
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Health News ID"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text("Tes")
      ),
     bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "Berita"),
        BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Hitung Kesehatan"),
    BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: "Rumah Sakit"),
      ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}