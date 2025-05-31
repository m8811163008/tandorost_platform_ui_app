import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppNavigation {
  static List<Widget> getDrawerChildren(BuildContext context) {
    return [
      UserAccountsDrawerHeader(
        accountName: Text(
          'Hi ${context.select((UserAccountCubit cubit) => cubit.state.userProfile?.fullName ?? '')}',
        ),
        accountEmail: Text(
          '${context.select((UserAccountCubit cubit) => cubit.state.userProfile?.phoneNumber ?? '')} ',
        ),
        currentAccountPicture: BlocBuilder<UserAccountCubit, UserAccountState>(
          buildWhen:
              (previous, current) =>
                  previous.readUserProfileImageStatus !=
                  current.readUserProfileImageStatus,
          builder: (context, state) {
            final imageProfile = state.profileImage;
            return CircleAvatar(
              backgroundImage:
                  imageProfile != null ? MemoryImage(imageProfile.bytes) : null,
              radius: context.sizeExtenstion.xExtraLarge,
              child: Material(
                color: context.themeData.colorScheme.secondary,
                child: Icon(Icons.person),
              ),
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

abstract class DrawerNavigationRoutes {
  static const Map<int, RoutesNames> routes = {
    0: RoutesNames.searchRoute,
    1: RoutesNames.foodReportRoute,
    2: RoutesNames.fitnessProfileRoute,
    3: RoutesNames.profileRoute,
    4: RoutesNames.loginRoute,
  };
  static const Map<int, IconData> icons = {
    0: Icons.search,
    1: Icons.report,
    2: Icons.fitness_center,
    3: Icons.account_box,
    4: Icons.login,
  };
}

abstract class BottomNavigationRoutes {
  static const Map<int, RoutesNames> routes = {
    0: RoutesNames.searchRoute,
    1: RoutesNames.foodReportRoute,
    2: RoutesNames.fitnessProfileRoute,
    3: RoutesNames.profileRoute,
  };
  static const Map<int, IconData> icons = {
    0: Icons.search,
    1: Icons.report,
    2: Icons.fitness_center,
    3: Icons.account_box,
  };
}
