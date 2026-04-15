import 'package:flutter/foundation.dart';
import 'configuracoes_state.dart';

class ConfiguracoesController extends ValueNotifier<ConfiguracoesState> {
  ConfiguracoesController() : super(const ConfiguracoesInitial());

  void reset() {
    value = const ConfiguracoesInitial();
  }
}
