import 'package:flutter/scheduler.dart';

class DotsTickerProvider implements TickerProvider {

  final bool enabled;

  DotsTickerProvider(this.enabled);

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick, debugLabel: 'created by $this')..muted = !this.enabled;
  }
}