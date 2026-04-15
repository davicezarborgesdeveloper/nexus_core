import 'package:flutter/foundation.dart';
import 'experiencias_state.dart';

class ExperienciasController extends ValueNotifier<ExperienciasState> {
  ExperienciasController() : super(const ExperienciasInitial());

  void reset() {
    value = const ExperienciasInitial();
  }
}
