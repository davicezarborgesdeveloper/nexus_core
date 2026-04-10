sealed class DashboardState {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  const DashboardInitial();
}

class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

class DashboardSuccess extends DashboardState {
  const DashboardSuccess();
}

class DashboardError extends DashboardState {
  final String message;

  const DashboardError(this.message);
}
