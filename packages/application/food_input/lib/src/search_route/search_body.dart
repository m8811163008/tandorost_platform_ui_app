import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/payment/payment_listeners.dart';
import 'package:food_input_app/src/search_route/search_body_layout.dart';
import 'package:food_input_app/src/search_route/search_listeners.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key, this.onSeachFoodSuccess});
  final VoidCallback? onSeachFoodSuccess;

  @override
  Widget build(BuildContext context) {
    return SearchBlocListeners(
      onSeachFoodSuccess: onSeachFoodSuccess,
      child: PaymentBlocListeners(child: SearchView()),
    );
  }
}
