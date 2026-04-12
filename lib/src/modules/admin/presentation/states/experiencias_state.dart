sealed class ExperienciasState {
  const ExperienciasState();
}

class ExperienciasInitial extends ExperienciasState {
  const ExperienciasInitial();
}

class ExperienciasLoading extends ExperienciasState {
  const ExperienciasLoading();
}

class ExperienciasSuccess extends ExperienciasState {
  const ExperienciasSuccess();
}

class ExperienciasError extends ExperienciasState {
  final String message;

  const ExperienciasError(this.message);
}
