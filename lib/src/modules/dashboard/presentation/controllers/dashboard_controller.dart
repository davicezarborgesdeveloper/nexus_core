import 'package:flutter/foundation.dart';
import '../states/dashboard_state.dart';

class DashboardController extends ValueNotifier<DashboardState> {
  DashboardController() : super(const DashboardInitial());

  void reset() {
    value = const DashboardInitial();
  }
}
