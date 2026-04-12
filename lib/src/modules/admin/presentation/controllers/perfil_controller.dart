import 'package:flutter/foundation.dart';

import '../../domain/usecases/get_admin_usecase.dart';
import '../states/perfil_state.dart';

class PerfilController extends ValueNotifier<PerfilState> {
  final IGetAdminUsecase _usecase;

  PerfilController(this._usecase) : super(const PerfilInitial());

  void reset() {
    value = const PerfilInitial();
  }
}
