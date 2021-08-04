library sheep_animation;

import 'ticker_provider.dart';
import 'package:flutter/animation.dart';

class AnimationProvider {
  AnimationController? _controller;
  late Tween _tween;
  late Animation<double> _animation;

  AnimationProvider(DotsTickerProvider tickerProvider) {
    _controller = AnimationController(vsync: tickerProvider);
  }

  void setUpAnimation({required Function tickFunction, Curve curve = Curves.linear}) {
    _tween = Tween<double>(begin: 0, end: 0);
    _animation = _tween.animate(CurvedAnimation(
      parent: _controller!,
      curve: curve,
    )) as Animation<double>
      ..addListener(() {
        tickFunction(_animation.value);
      });
  }

  void forward(double begin, double end, int duration) {
    _controller!.duration = Duration(milliseconds: duration);
    _tween.begin = begin;
    _controller!.reset();
    _tween.end = end;
    _controller!.forward();
  }

  bool isAnimationActive() {
    return (_controller != null && _controller!.isAnimating);
  }

  void stop() {
    _controller!.stop(canceled: false);
  }
}
