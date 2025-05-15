import 'package:flutter/widgets.dart';
import 'package:food_input_app/src/search_route/search_body.dart';

class SearchRoute extends StatelessWidget {
  const SearchRoute({super.key});
  static const String name = 'search-route';

  @override
  Widget build(BuildContext context) {
    return const SearchBody();
  }
}
