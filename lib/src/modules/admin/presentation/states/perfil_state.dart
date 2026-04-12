sealed class PerfilState {
  const PerfilState();
}

class PerfilInitial extends PerfilState {
  const PerfilInitial();
}

class PerfilLoading extends PerfilState {
  const PerfilLoading();
}

class PerfilSuccess extends PerfilState {
  const PerfilSuccess();
}

class PerfilError extends PerfilState {
  final String message;

  const PerfilError(this.message);
}
