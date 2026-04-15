sealed class HabilidadesState {
  const HabilidadesState();
}

class HabilidadesInitial extends HabilidadesState {
  const HabilidadesInitial();
}

class HabilidadesLoading extends HabilidadesState {
  const HabilidadesLoading();
}

class HabilidadesSuccess extends HabilidadesState {
  const HabilidadesSuccess();
}

class HabilidadesError extends HabilidadesState {
  final String message;

  const HabilidadesError(this.message);
}
