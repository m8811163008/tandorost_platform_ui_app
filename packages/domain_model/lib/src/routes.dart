enum RoutesNames {
  loginRoute('/login'),
  registerRoute('/register'),
  searchRoute('/search-route'),
  resultRoute('/result-route'),
  forgotPassRoute('/forgot-password'),
  verificationRoute('/verify-phone-number'),
  profileRoute('/profile'),
  fitnessProfileRoute('/fitness-profile'),
  foodReportRoute('/food-report'),
  vo2maxCalculator('/vo2max-calculator'),
  introductionRoute('/introduction-route');

  final String path;
  const RoutesNames(this.path);
}
