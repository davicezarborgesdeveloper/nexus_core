sealed class ConfiguracoesState {
  const ConfiguracoesState();
}

class ConfiguracoesInitial extends ConfiguracoesState {
  const ConfiguracoesInitial();
}

class ConfiguracoesLoading extends ConfiguracoesState {
  const ConfiguracoesLoading();
}

class ConfiguracoesSuccess extends ConfiguracoesState {
  const ConfiguracoesSuccess();
}

class ConfiguracoesError extends ConfiguracoesState {
  final String message;

  const ConfiguracoesError(this.message);
}
