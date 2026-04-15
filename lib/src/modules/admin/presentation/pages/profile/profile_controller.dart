import 'package:flutter/foundation.dart';

import '../../../domain/usecases/get_admin_usecase.dart';
import 'profile_state.dart';

class ProfileController extends ValueNotifier<ProfileState> {
  final IGetAdminUsecase _usecase;

  ProfileController(this._usecase) : super(const ProfileInitial());

  void reset() {
    value = const ProfileInitial();
  }
}
