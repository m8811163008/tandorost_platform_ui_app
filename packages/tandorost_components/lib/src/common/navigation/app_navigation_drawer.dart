import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppNavigation {
  static List<Widget> getDrawerChildren(BuildContext context) {
    return [
      // TODO add cubit
      UserAccountsDrawerHeader(
        accountName: Text('data'),
        accountEmail: Text('data'),
        currentAccountPicture: Text('data'),
      ),
      NavigationDrawerDestination(
        label: Text('destination.label'),
        icon: Icon(Icons.add),
      ),
      NavigationDrawerDestination(
        label: Text('destination.label'),
        icon: Icon(Icons.add),
      ),
      NavigationDrawerDestination(
        label: Text('destination.label'),
        icon: Icon(Icons.add),
      ),
      NavigationDrawerDestination(
        label: Text('destination.label'),
        icon: Icon(Icons.add),
      ),
    ];
  }

  static List<BottomNavigationBarItem> bottomNavigationItems(
    BuildContext context,
  ) {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.add), label: 'a'),
      BottomNavigationBarItem(icon: Icon(Icons.add), label: 'a'),
      BottomNavigationBarItem(icon: Icon(Icons.add), label: 'a'),
    ];
  }
}
