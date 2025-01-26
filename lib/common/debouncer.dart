import 'dart:async';
import 'dart:ui';

class Debouncer {
  static const timeout = 1000;

  Debouncer({this.milliseconds});
  final int? milliseconds;
  Timer? _timer;
  void run(VoidCallback action, {int? timeout}) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer =
        Timer(Duration(milliseconds: timeout ?? milliseconds ?? 1000), action);
  }
}
