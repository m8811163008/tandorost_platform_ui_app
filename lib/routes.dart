
import 'package:authentication_app/authentication.dart';
import 'package:fitness_profile_app/fitness_profile.dart';
import 'package:food_input_app/food_input.dart';
import 'package:food_report_app/food_report.dart';
import 'package:profile_app/profile.dart';

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
  loginRoute('/${LoginRoute.name}'),
  registerRoute('/${RegisterRoute.name}'),
  searchRoute('/${SearchRoute.name}'),
  resultRoute('/${ResultRoute.name}'),
  forgotPassRoute('/${ForgotPasswordRoute.name}'),
  verificationRoute('/${RegisterVerifyPhoneNumberRoute.name}'),
  profileRoute('/${ProfileRoute.name}'),
  fitnessProfileRoute('/${FitnessProfileRoute.name}'),
  foodReportRoute('/${FoodReportRoute.name}');

  final String path;
  const RoutesNames(this.path);
}