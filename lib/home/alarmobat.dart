import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'jamalarm/tiga.dart';
import 'jamalarm/dua.dart';
import 'jamalarm/namaobat.dart';

class AlarmObat extends StatelessWidget {
  AlarmObat({Key? key}) : super(key: key);
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Health News ID'),
        ),
        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Nama Obat",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                SafeArea(
                    child: Center(
                  child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          controller: myController2,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Contoh : Paracetamol')),
                      width: 283,
                      height: 50,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          color: Color.fromARGB(220, 220, 220, 220))),
                )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Minum obat berapa kali sehari?",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                SafeArea(
                    child: Center(
                  child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          controller: myController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Contoh : 3')),
                      width: 283,
                      height: 50,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          color: Color.fromARGB(220, 220, 220, 220))),
                )),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  namaobat = myController2.text;
                  if (myController.text == '3') {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            Tiga(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  }
                  if (myController.text == '2') {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => Dua(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  }
                },
                child: Text('Lanjut'))
          ],
        )));
  }
}
