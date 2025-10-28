import 'package:authentication/authentication.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppNavigation {
  static List<Widget> getDrawerChildren(BuildContext context) {
    return [
      UserAccountsDrawerHeader(
        accountName: Text(
          '${context.l10n.wellcomeMessage} ${context.select((UserAccountCubit cubit) {
            return cubit.state.userProfile?.fullName ?? '';
          })}',
        ),
        accountEmail: Text(
          '${context.select((UserAccountCubit cubit) => cubit.state.userProfile?.phoneNumber ?? '')} ',
        ),
        currentAccountPicture: BlocBuilder<UserAccountCubit, UserAccountState>(
          buildWhen: (previous, current) =>
              previous.readUserProfileImageStatus !=
              current.readUserProfileImageStatus,
          builder: (context, state) {
            final imageProfile = state.profileImage;
            return CircleAvatar(
              backgroundImage: imageProfile != null
                  ? MemoryImage(imageProfile.bytes)
                  : null,
              radius: context.sizeExtenstion.xExtraLarge,
              child: imageProfile == null ? Icon(Icons.person) : null,
            );
          },
        ),
      ),
      ...List.generate(
        DrawerNavigationRoutes.routes.length,
        (index) => NavigationDrawerDestination(
          label: Text(
            context.l10n.appRoutesName(
              DrawerNavigationRoutes.routes[index]!.name,
            ),
          ),
          icon: Icon(DrawerNavigationRoutes.icons[index]),
        ),
      ),

      Padding(
        padding: EdgeInsetsDirectional.only(
          start: context.sizeExtenstion.large,
          bottom: context.sizeExtenstion.small,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.sizeExtenstion.medium),
            TextButton(
              onPressed: () async {
                final Uri launchUri = Uri(scheme: 'tel', path: '+989212805230');
                if (!await launchUrl(launchUri)) {
                  throw Exception('Could not launch $launchUri');
                }
              },
              child: Text(context.l10n.drawerSupportText1('09212805230')),
            ),
            SizedBox(height: context.sizeExtenstion.small),
            Text(context.l10n.drawerSupportText2),
            SizedBox(height: context.sizeExtenstion.medium),
            LogoutButton(),
          ],
        ),
      ),
    ];
  }

  static List<BottomNavigationBarItem> bottomNavigationItems(
    BuildContext context,
  ) {
    return List.generate(
      BottomNavigationRoutes.routes.length,
      (index) => BottomNavigationBarItem(
        icon: Icon(BottomNavigationRoutes.icons[index]),
        label: context.l10n.appRoutesName(
          BottomNavigationRoutes.routes[index]!.name,
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RepositoryProvider.of<AuthenticationRepository>(
        context,
      ).authenticationStatusStream.first,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.isAuthorized ?? false) {
            return TextButton(
              onPressed: () async {
                await RepositoryProvider.of<AuthenticationRepository>(
                  context,
                ).logout();
              },
              child: Text(context.l10n.logout),
            );
          }
        }
        return SizedBox.shrink();
      },
    );
  }
}

abstract class DrawerNavigationRoutes {
  static const Map<int, RoutesNames> routes = {
    0: RoutesNames.searchRoute,
    1: RoutesNames.foodReportRoute,
    2: RoutesNames.fitnessProfileRoute,

    3: RoutesNames.vo2maxCalculator,
    4: RoutesNames.athleteWorkoutView,
    5: RoutesNames.coachesListRoute,
    6: RoutesNames.athletesDirectoryRoute,
    7: RoutesNames.profileRoute,
    8: RoutesNames.loginRoute,
  };
  static const Map<int, IconData> icons = {
    0: Icons.search,
    1: Icons.circle,
    2: Icons.monitor_weight,
    3: Icons.health_and_safety,
    4: Icons.safety_check,
    5: Icons.fitness_center,
    6: Icons.store_mall_directory,
    7: Icons.account_box,
    8: Icons.login,
  };
}

abstract class BottomNavigationRoutes {
  static const Map<int, RoutesNames> routes = {
    0: RoutesNames.searchRoute,
    1: RoutesNames.coachesListRoute,
    2: RoutesNames.fitnessProfileRoute,
    3: RoutesNames.profileRoute,
  };
  static const Map<int, IconData> icons = {
    0: Icons.search,
    1: Icons.fitness_center,
    2: Icons.monitor_weight,
    3: Icons.account_box,
  };
}
