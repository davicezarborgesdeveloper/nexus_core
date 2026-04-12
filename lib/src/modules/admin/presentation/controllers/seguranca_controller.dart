import 'package:flutter/foundation.dart';
import '../states/seguranca_state.dart';

class SegurancaController extends ValueNotifier<SegurancaState> {
  SegurancaController() : super(const SegurancaInitial());

  void reset() {
    value = const SegurancaInitial();
  }
}
