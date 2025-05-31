import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppNavigationDrawer {
  static const children = [
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
  ];
}
