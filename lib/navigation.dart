import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:authentication_app/authentication.dart';
import 'package:domain_model/domain_model.dart';
import 'package:fitness_profile_app/fitness_profile.dart';
import 'package:flutter/material.dart';
import 'package:food_report_app/food_report.dart';
import 'package:go_router/go_router.dart';
import 'package:food_input_app/food_input.dart';
import 'package:introduction_app/introduction.dart';
import 'package:profile/profile.dart';
import 'package:profile_app/profile.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tandorost/notification_helper.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:vo2max_calculator/vo2max_calculator.dart';

class Navigation {
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
      initialLocation: RoutesNames.searchRoute.path,
      observers: [SentryNavigatorObserver()],
      routes: [
        GoRoute(
          path: RoutesNames.searchRoute.path,
          builder: (context, state) {
            return SearchRoute(
              goToResultRoute:
                  () => context.go(
                    '${RoutesNames.searchRoute.path}${RoutesNames.resultRoute.path}',
                  ),
              onBottomNavigationChanged: (index) {
                _onBottomNavigationChanged(context, index);
              },
              bottomNavigationIndex: _bottomNavigationIndex(state),
              onDrawerNavigationChanged: (index) {
                _onDrawerNavigationChanged(context, index);
              },
              drawerNavigationIndex: _drawerNavigationIndex(state),
            );
          },
          routes: [
            GoRoute(
              path: RoutesNames.resultRoute.path,
              builder: (context, state) {
                return ResultRoute(
                  onBottomNavigationChanged: (index) {
                    _onBottomNavigationChanged(context, index);
                  },
                  bottomNavigationIndex: _bottomNavigationIndex(state),
                );
              },
            ),
          ],
        ),
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create:
                  (context) => RegisterCubit(
                    RepositoryProvider.of<AuthenticationRepository>(context),
                  ),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: RoutesNames.registerRoute.path,
              builder: (context, state) {
                return RegisterRoute(
                  goToHomeRoute: () => _goToHomeRoute(context),
                  goToLoginRoute:
                      () => context.go(RoutesNames.searchRoute.path),
                  goToVerificationRoute:
                      () => context.go(
                        '${RoutesNames.registerRoute.path}${RoutesNames.verificationRoute.path}',
                      ),
                );
              },
              routes: [
                GoRoute(
                  path: RoutesNames.verificationRoute.path,
                  builder: (context, state) {
                    return RegisterVerifyPhoneNumberRoute(
                      goToLoginRoute:
                          () => context.go(RoutesNames.loginRoute.path),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create:
                  (context) => LoginCubit(
                    RepositoryProvider.of<AuthenticationRepository>(context),
                  ),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: RoutesNames.loginRoute.path,
              builder: (context, state) {
                return LoginRoute(
                  goToForgotPasswordRoute: () {
                    context.go(RoutesNames.forgotPassRoute.path);
                  },
                  goToHomeRoute: () => _goToHomeRoute(context),
                  goToRegisterRoute: () {
                    context.go(RoutesNames.registerRoute.path);
                  },
                );
              },
            ),
          ],
        ),
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create:
                  (context) => ForgotPasswordCubit(
                    RepositoryProvider.of<AuthenticationRepository>(context),
                  ),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: RoutesNames.forgotPassRoute.path,
              builder: (context, state) {
                return ForgotPasswordRoute(
                  goToLoginRoute: () => context.go(RoutesNames.loginRoute.path),
                  goToVerificationRoute:
                      () => context.go(
                        '${RoutesNames.forgotPassRoute.path}${RoutesNames.verificationRoute.path}',
                      ),
                  goToRegisterRoute:
                      () => context.go(RoutesNames.registerRoute.path),
                );
              },
              routes: [
                GoRoute(
                  path: RoutesNames.verificationRoute.path,
                  builder: (context, state) {
                    return ForgotPasswordVerifyPhoneNumberRoute(
                      goToLoginRoute:
                          () => context.go(RoutesNames.loginRoute.path),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: RoutesNames.profileRoute.path,
          builder: (context, state) {
            return NotificationPermissionHandler(
              child: ProfileRoute(
                onBottomNavigationChanged: (index) {
                  _onBottomNavigationChanged(context, index);
                },
                onDrawerNavigationChanged: (index) {
                  _onDrawerNavigationChanged(context, index);
                },
                bottomNavigationIndex: _bottomNavigationIndex(state),
                drawerNavigationIndex: _drawerNavigationIndex(state),
              ),
            );
          },
        ),
        GoRoute(
          path: RoutesNames.fitnessProfileRoute.path,
          builder: (context, state) {
            return FitnessProfileRoute(
              onBottomNavigationChanged: (index) {
                _onBottomNavigationChanged(context, index);
              },
              onDrawerNavigationChanged: (index) {
                _onDrawerNavigationChanged(context, index);
              },
              bottomNavigationIndex: _bottomNavigationIndex(state),
              drawerNavigationIndex: _drawerNavigationIndex(state),
            );
          },
        ),
        GoRoute(
          path: RoutesNames.foodReportRoute.path,
          builder: (context, state) {
            return FoodReportRoute(
              goToFoodInputRoute:
                  () => context.go(RoutesNames.searchRoute.path),
              goToFitnessProfileRoute:
                  () => context.go(RoutesNames.fitnessProfileRoute.path),
              onBottomNavigationChanged: (index) {
                _onBottomNavigationChanged(context, index);
              },
              onDrawerNavigationChanged: (index) {
                _onDrawerNavigationChanged(context, index);
              },
              bottomNavigationIndex: _bottomNavigationIndex(state),
              drawerNavigationIndex: _drawerNavigationIndex(state),
            );
          },
        ),
        GoRoute(
          path: RoutesNames.vo2maxCalculator.path,
          builder: (context, state) {
            return Vo2maxCalculatorRoute(
              onBottomNavigationChanged: (index) {
                _onBottomNavigationChanged(context, index);
              },
              onDrawerNavigationChanged: (index) {
                _onDrawerNavigationChanged(context, index);
              },
              bottomNavigationIndex: _bottomNavigationIndex(state),
              drawerNavigationIndex: _drawerNavigationIndex(state),
            );
          },
        ),
        GoRoute(
          path: RoutesNames.introductionRoute.path,
          builder: (context, state) {
            return IntroductionRoute(
              onDoneIntroduction:
                  () => context.go(RoutesNames.searchRoute.path),
            );
          },
        ),
      ],

      redirect: (_, state) async {
        final isVisitedIntroductionRoute =
            await RepositoryProvider.of<ProfileRepository>(
              context,
            ).isVisitedIntroductionRoute;
        if (!isVisitedIntroductionRoute) {
          return RoutesNames.introductionRoute.path;
        }

        final authStatus =
            await RepositoryProvider.of<AuthenticationRepository>(
              context,
            ).authenticationStatusStream.first;

        final fullPath = state.fullPath ?? '';

        final isAuthRoute = [
          RoutesNames.loginRoute.path,
          RoutesNames.registerRoute.path,
          RoutesNames.forgotPassRoute.path,
        ].any(fullPath.contains);

        if (!authStatus.isAuthorized && !isAuthRoute) {
          return RoutesNames.loginRoute.path;
        }
        return fullPath;
      },
      refreshListenable: RedirectListenable(
        authenticationStream:
            RepositoryProvider.of<AuthenticationRepository>(
              context,
            ).authenticationStatusStream,
      ),
    );
  }

  static void _goToHomeRoute(BuildContext context) {
    final currentBottomNavigationRoute = BottomNavigationRoutes.routes[0]!.path;
    context.go(currentBottomNavigationRoute);
  }

  static void _onBottomNavigationChanged(BuildContext context, int index) {
    context.go(BottomNavigationRoutes.routes[index]!.path);
  }

  static void _onDrawerNavigationChanged(BuildContext context, int index) {
    context.go(DrawerNavigationRoutes.routes[index]!.path);
  }

  static int _bottomNavigationIndex(GoRouterState state) {
    try {
      return BottomNavigationRoutes.routes.entries
          .singleWhere((entry) => entry.value.path == state.fullPath)
          .key;
    } catch (e) {
      return 0;
    }
  }

  static int _drawerNavigationIndex(GoRouterState state) {
    try {
      return DrawerNavigationRoutes.routes.entries
          .singleWhere((entry) => entry.value.path == state.fullPath)
          .key;
    } catch (e) {
      return 0;
    }
  }
}

class RedirectListenable extends ChangeNotifier {
  final Stream<AuthenticationStatus> authenticationStream;
  late final StreamSubscription<AuthenticationStatus> subscription;

  RedirectListenable({required this.authenticationStream}) {
    subscription = authenticationStream.listen((event) {
      notifyListeners();
    });
  }
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
