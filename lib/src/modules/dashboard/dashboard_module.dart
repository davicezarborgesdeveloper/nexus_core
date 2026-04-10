import 'presentation/controllers/dashboard_controller.dart';
import 'presentation/pages/dashboard_page.dart';

class DashboardModule {
  DashboardModule();

  DashboardController createController() {
    return DashboardController();
  }

  DashboardPage createPage({String title = 'Dashboard'}) {
    return DashboardPage(controller: createController(), title: title);
  }
}
