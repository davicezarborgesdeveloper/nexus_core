sealed class ProjetosState {
  const ProjetosState();
}

class ProjetosInitial extends ProjetosState {
  const ProjetosInitial();
}

class ProjetosLoading extends ProjetosState {
  const ProjetosLoading();
}

class ProjetosSuccess extends ProjetosState {
  const ProjetosSuccess();
}

class ProjetosError extends ProjetosState {
  final String message;

  const ProjetosError(this.message);
}
