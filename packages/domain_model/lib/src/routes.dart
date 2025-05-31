abstract class BottomNavigationRoutes {
  static const Map<int, RoutesNames> routes = {
    1: RoutesNames.searchRoute,
    2: RoutesNames.foodReportRoute,
    3: RoutesNames.fitnessProfileRoute,
    4: RoutesNames.profileRoute,
  };
}

abstract class DrawerNavigationRoutes {
  static const Map<int, RoutesNames> routes = {
    1: RoutesNames.searchRoute,
    2: RoutesNames.foodReportRoute,
    3: RoutesNames.fitnessProfileRoute,
    4: RoutesNames.profileRoute,
    5: RoutesNames.loginRoute,
  };
}

enum RoutesNames {
  loginRoute('/login'),
  registerRoute('/register'),
  searchRoute('/search-route'),
  resultRoute('/result-route'),
  forgotPassRoute('/forgot-password'),
  verificationRoute('/verify-phone-number'),
  profileRoute('/profile'),
  fitnessProfileRoute('/fitness-profile'),
  foodReportRoute('/food-report');

  final String path;
  const RoutesNames(this.path);
}
