import 'dart:async';
import 'package:flutter/material.dart';

class TimerApp extends StatefulWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  static const duration = Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  late Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    timer = Timer.periodic(duration, (Timer t) {
      handleTick();
    });

    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LabelText(
                label: 'HRS',
                value: hours.toString().padLeft(2, '0'),
              ),
              LabelText(
                label: 'MIN',
                value: minutes.toString().padLeft(2, '0'),
              ),
              LabelText(
                label: 'SEC',
                value: seconds.toString().padLeft(2, '0'),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(top: 3),
            child: ElevatedButton(
              child: Text(isActive ? 'STOP' : 'START'),
              onPressed: () {
                setState(
                  () {
                    isActive = !isActive;
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  const LabelText({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.teal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
