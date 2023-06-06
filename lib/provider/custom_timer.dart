import 'dart:async';

class CustomTimer {
  late Timer timer;

  void cancel() => timer.cancel();
  void setTimer(Timer timer) {
    this.timer = timer;
  }
}
