import 'package:authentication/authentication.dart';
import 'package:authentication_app/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:food_input_app/food_input.dart';
import 'package:tandorost_components/tandorost_components.dart';

class Navigation {
  static GoRouter goRouter(BuildContext context) {
    final loginRoute = '/${LoginRoute.name}';
    final registerRoute = '/${RegisterRoute.name}';
    final searchRoute = '/${SearchRoute.name}';
    final resultRoute = '/${ResultRoute.name}';
    final forgotPassRoute = '/${ForgotPasswordRoute.name}';
    final verificationRoute = '/${RegisterVerifyPhoneNumberRoute.name}';
    return GoRouter(
      initialLocation: '/${RegisterRoute.name}',
      routes: [
        GoRoute(
          path: searchRoute,
          builder: (context, state) {
            return SearchRoute(
              goToResultRoute: () => context.go('$searchRoute$resultRoute'),
            );
          },
          routes: [
            GoRoute(
              path: resultRoute,
              builder: (_, state) {
                return const ResultRoute();
              },
            ),
          ],
        ),
        ShellRoute(
          builder: (context, state, child) {
            return AuthShell(
              createBloc:
                  (context) => RegisterCubit(
                    RepositoryProvider.of<AuthenticationRepository>(context),
                  ),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: registerRoute,
              builder: (context, state) {
                return RegisterRoute(
                  goToHomeRoute: () {},
                  goToLoginRoute: () => context.go(loginRoute),
                  goToVerificationRoute:
                      () => context.go('$registerRoute$verificationRoute'),
                );
              },
              routes: [
                GoRoute(
                  path: verificationRoute,
                  builder: (context, state) {
                    return RegisterVerifyPhoneNumberRoute(
                      goToLoginRoute: () => context.go(loginRoute),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        ShellRoute(
          builder: (context, state, child) {
            return AuthShell(
              createBloc:
                  (context) => LoginCubit(
                    RepositoryProvider.of<AuthenticationRepository>(context),
                  ),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: loginRoute,
              builder: (context, state) {
                return LoginRoute(
                  goToForgotPasswordRoute: () {
                    context.go('$loginRoute$forgotPassRoute');
                  },
                  goToHomeRoute: () {
                    // Todo nav to home for all routes
                    context.go('$loginRoute$forgotPassRoute');
                  },
                  goToRegisterRoute: () {
                    context.go(registerRoute);
                  },
                );
              },
            ),
            GoRoute(
              path: forgotPassRoute,
              builder: (context, state) {
                return ForgotPasswordRoute(
                  goToLoginRoute : () => context.go(loginRoute),
                  goToVerificationRoute : () => context.go('$loginRoute$forgotPassRoute$verificationRoute'),
                  goToRegisterRoute : () => context.go(registerRoute)
                );
              },
              routes: [
                GoRoute(
                  path: verificationRoute,
                  builder: (context, state) {
                    return ForgotPasswordVerifyPhoneNumberRoute(
                      goToLoginRoute: () => context.go(loginRoute),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class AuthShell<T extends StateStreamableSource<Object?>>
    extends StatelessWidget {
  const AuthShell({super.key, required this.child, required this.createBloc});
  final Widget child;
  final T Function(BuildContext) createBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: createBloc,
      // (context) => RegisterCubit(
      //   RepositoryProvider.of<AuthenticationRepository>(context),
      // ),
      child: AppScaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sizeExtenstion.extraLarge,
          ),
          child: child,
        ),
      ),
    );
  }
}
