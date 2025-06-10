import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/language_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/payment_listeners.dart';
import 'package:food_input_app/src/search_route/search_body_layout.dart';
import 'package:food_input_app/src/search_route/search_bottom_sheet.dart';
import 'package:food_input_app/src/search_route/search_listeners.dart';

import 'package:tandorost_components/tandorost_components.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, this.onSeachFoodSuccess});
  final VoidCallback? onSeachFoodSuccess;

  @override
  Widget build(BuildContext context) {
    return SearchListeners(
      child: PaymentBlocListeners(child: SearchBodyLayout()),
    );
  }
}
