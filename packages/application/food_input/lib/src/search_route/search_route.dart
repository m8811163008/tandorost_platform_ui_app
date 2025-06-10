import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_input/food_input.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/search_body.dart';
import 'package:food_input_app/src/search_route/search_food/spoken_language/language_icon_button.dart';
import 'package:payment_repository/payment.dart';
import 'package:profile/profile.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchRoute extends StatelessWidget {
  const SearchRoute({
    super.key,
    this.goToResultRoute,
    this.onBottomNavigationChanged,
    required this.bottomNavigationIndex,
    this.onDrawerNavigationChanged,
    required this.drawerNavigationIndex,
  });
  final VoidCallback? goToResultRoute;
  final ValueChanged<int>? onBottomNavigationChanged;
  final int bottomNavigationIndex;
  final ValueChanged<int>? onDrawerNavigationChanged;
  final int drawerNavigationIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return SearchCubit(
          foodInputRepository: RepositoryProvider.of<FoodInputRepository>(
            context,
          ),
          profileRepository: RepositoryProvider.of<ProfileRepository>(context),
          paymentRepository: RepositoryProvider.of<PaymentRepository>(context),
        );
      },
      child: AppScaffold(
        appBar: AppBar(
          title: Text(context.l10n.appRoutesName(RoutesNames.searchRoute.name)),
          actions: [LanguageIconButton()],
        ),
        drawer: NavigationDrawer(
          onDestinationSelected: onDrawerNavigationChanged,
          selectedIndex: drawerNavigationIndex,
          children: AppNavigation.getDrawerChildren(context),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onBottomNavigationChanged,
          currentIndex: bottomNavigationIndex,
          items: AppNavigation.bottomNavigationItems(context),
        ),
        body: AppScaffoldBody(
          child: SearchBody(onSeachFoodSuccess: goToResultRoute),
        ),
      ),
    );
  }
}
