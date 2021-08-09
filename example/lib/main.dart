import 'package:flutter/material.dart';
import 'package:sheep_animation/sheep_animation.dart';
import 'package:sheep_animation/ticker_provider.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  final AnimationProvider _offsetAnimationProvider = AnimationProvider(DotsTickerProvider(true));
  double _offset = 300.0;

  @override
  void initState() {
    _offsetAnimationProvider.setUpAnimation(tickFunction: (update) {
      setState(() {
        _offset = update;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              _offsetAnimationProvider.forward(
                begin: 80.0,
                end: 300.0,
                duration: const Duration(milliseconds: 500),
              );
            },
            child: Container(
              color: Colors.blue,
              width: _offset,
              height: _offset,
              child: Center(
                child: Text(
                  'Click here',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
