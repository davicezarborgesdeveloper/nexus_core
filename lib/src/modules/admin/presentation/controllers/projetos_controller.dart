import 'package:flutter/foundation.dart';
import '../states/projetos_state.dart';

class ProjetosController extends ValueNotifier<ProjetosState> {
  ProjetosController() : super(const ProjetosInitial());

  void reset() {
    value = const ProjetosInitial();
  }
}
