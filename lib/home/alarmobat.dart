import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class AlarmObat extends StatelessWidget {
  AlarmObat({Key? key}) : super(key: key);
  final myController = TextEditingController();

  tigaKali() {
    FlutterAlarmClock.createAlarm(05, 00);
    Future.delayed(Duration(seconds: 3));
    FlutterAlarmClock.createAlarm(13, 00);
    Future.delayed(Duration(seconds: 3));
    FlutterAlarmClock.createAlarm(21, 00);
  }

  duaKali() {
    FlutterAlarmClock.createAlarm(07, 00);
    Future.delayed(Duration(seconds: 3));
    FlutterAlarmClock.createAlarm(19, 00);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Health News ID'),
        ),
        body: Center(
            child: Column(
          children: [
            Text("Minum obat berapa kali sehari?"),
            TextField(
              controller: myController,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
                onPressed: () {
                  if (myController.text == '3') {
                    tigaKali();
                  }
                  if (myController.text == '2') {
                    duaKali();
                  }
                },
                child: Text('Simpan'))
          ],
        )));
  }
}
