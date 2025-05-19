import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input/food_input.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/search_body.dart';
import 'package:profile/profile.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchRoute extends StatelessWidget {
  const SearchRoute({super.key, this.onSeachFoodSuccess});
  static const String name = 'search-route';
  final VoidCallback? onSeachFoodSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return SearchCubit(
          foodInputRepository: RepositoryProvider.of<FoodInputRepository>(
            context,
          ),
          profileRepository: RepositoryProvider.of<ProfileRepository>(context),
        );
      },
      child: AppScaffold(
        appBar: AppBar(),
        drawer: NavigationDrawer(
          onDestinationSelected: (index) {},
          selectedIndex: 0,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('data'),
              accountEmail: Text('data'),
              currentAccountPicture: Text('data'),
            ),

            NavigationDrawerDestination(
              label: Text('destination.label'),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'a'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'a'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'a'),
          ],
        ),
        body: SearchBody(onSeachFoodSuccess: onSeachFoodSuccess),
      ),
    );
  }
}
