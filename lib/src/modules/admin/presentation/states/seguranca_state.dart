sealed class SegurancaState {
  const SegurancaState();
}

class SegurancaInitial extends SegurancaState {
  const SegurancaInitial();
}

class SegurancaLoading extends SegurancaState {
  const SegurancaLoading();
}

class SegurancaSuccess extends SegurancaState {
  const SegurancaSuccess();
}

class SegurancaError extends SegurancaState {
  final String message;

  const SegurancaError(this.message);
}
