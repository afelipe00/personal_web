import 'dart:async';

import 'package:flutter/material.dart';

class HomeExperienceScreen extends StatefulWidget {
  const HomeExperienceScreen({super.key});

  @override
  State<HomeExperienceScreen> createState() => _HomeExperienceScreenState();
}

class _HomeExperienceScreenState extends State<HomeExperienceScreen> {
  int _counter = 0;
  List<String> _words = ['Word 1', 'Word 2', 'Word 3']; // List of words
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 7), (timer) {
      setState(() {
        _counter = (_counter + 1) % _words.length;
      });
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fade Transition Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Text(
                '$_counter',
                key: ValueKey<int>(_counter),
                style: TextStyle(fontSize: 50),
              ),
              // transitionBuilder: (child, animation) {
              //   return FadeTransition(
              //     opacity: animation,
              //     child: SlideTransition(
              //       position: Tween<Offset>(
              //         begin: Offset(0.0, 0.5),
              //         end: Offset.zero,
              //       ).animate(animation),
              //       child: child,
              //     ),
              //   );
              // },
            ),
          ],
        ),
      ),
    );
  }
}
