library sheep_animation;

import 'ticker_provider.dart';
import 'package:flutter/animation.dart';

class AnimationProvider {
  AnimationController _controller;
  late Tween _tween;
  late Animation<double> _animation;

  AnimationProvider(DotsTickerProvider tickerProvider)
      : _controller = AnimationController(vsync: tickerProvider);

  /// The main method which provide controller for the animation.
  void setUpAnimation({required Function tickFunction, Curve curve = Curves.linear}) {
    _tween = Tween<double>(begin: 0, end: 0);
    _animation = _tween.animate(CurvedAnimation(
      parent: _controller,
      curve: curve,
    )) as Animation<double>
      ..addListener(() {
        tickFunction(_animation.value);
      });
  }

  /// Starts animation based on the specified parameters.
  void forward({required double begin, required double end, required Duration duration}) {
    _controller.duration = duration;
    _tween.begin = begin;
    _controller.reset();
    _tween.end = end;
    _controller.forward();
  }

  /// Returns true if animation in process, otherwise return false.
  bool isAnimationActive() {
    return (_controller.isAnimating);
  }

  /// Stops running this animation. The animation stops in its current state.
  void stop() {
    _controller.stop(canceled: false);
  }
}
