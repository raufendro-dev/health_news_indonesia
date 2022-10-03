import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'namaobat.dart';

class Dua extends StatelessWidget {
  Dua({Key? key}) : super(key: key);
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Health News ID'),
        ),
        body: SafeArea(
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Alarm Pertama",
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
                            controller: myController1,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Contoh : 05.00')),
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
                    final jam = myController1.text.split('.');
                    var h = jam[0];
                    var m = jam[1];
                    FlutterAlarmClock.createAlarm(int.parse(h), int.parse(m),
                        title: 'Alarm Obat Pertama (' + namaobat + ')');
                  },
                  child: Text('Simpan')),
              SizedBox(
                height: 25,
              ),
              Text(
                "Alarm Kedua",
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
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Contoh : 05.00')),
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
                    final jam = myController2.text.split('.');
                    var h = jam[0];
                    var m = jam[1];
                    FlutterAlarmClock.createAlarm(int.parse(h), int.parse(m),
                        title: 'Alarm Obat Kedua (' + namaobat + ')');
                  },
                  child: Text('Simpan')),
            ],
          )),
        ));
  }
}
