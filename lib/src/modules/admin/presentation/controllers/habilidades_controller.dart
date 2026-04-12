import 'package:flutter/foundation.dart';
import '../states/habilidades_state.dart';

class HabilidadesController extends ValueNotifier<HabilidadesState> {
  HabilidadesController() : super(const HabilidadesInitial());

  void reset() {
    value = const HabilidadesInitial();
  }
}
