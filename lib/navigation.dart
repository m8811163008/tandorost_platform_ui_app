import 'package:authentication_app/authentication.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_input_app/food_input.dart';
import 'package:tandorost_components/tandorost_components.dart';

class Navigation {
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
      initialLocation: '/${RegisterRoute.name}',
      routes: [
        GoRoute(
          path: '/${SearchRoute.name}',
          builder: (context, state) {
            return SearchRoute(
              onSeachFoodSuccess:
                  () => context.go('/${SearchRoute.name}/${ResultRoute.name}'),
            );
          },
          routes: [
            GoRoute(
              path: '/${ResultRoute.name}',
              builder: (_, state) {
                return const ResultRoute();
              },
            ),
          ],
        ),
        ShellRoute(
          builder:
              (context, state, child) => AppScaffold(
                appBar: AppBar(),
                body: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.sizeExtenstion.extraLarge,
                  ),
                  child: child,
                ),
              ),
          routes: [
            GoRoute(
              path: '/${LoginRoute.name}',
              builder: (context, state) {
                return LoginRoute();
              },
              routes: [
                GoRoute(
                  path: '/${ForgotPasswordRoute.name}',
                  builder: (context, state) {
                    return ForgotPasswordRoute();
                  },
                  routes: [
                    GoRoute(
                      path: '/${VerifyPhoneNumberRoute.name}',
                      builder: (_, state) {
                        return const VerifyPhoneNumberRoute();
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: '/${RegisterRoute.name}',
              builder: (context, state) {
                return RegisterRoute();
              },
              routes: [
                GoRoute(
                  path: '/${VerifyPhoneNumberRoute.name}',
                  builder: (_, state) {
                    return const VerifyPhoneNumberRoute();
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
