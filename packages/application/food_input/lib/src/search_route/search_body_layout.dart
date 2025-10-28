import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/search_body_layout_footer.dart';
import 'package:food_input_app/src/search_route/search_food/food_ai_chat_search/chat_button_builder.dart';
import 'package:food_input_app/src/search_route/search_food/food_ai_text_field_search/food_bottom_sheet_button.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(width: context.sizeExtenstion.small);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.sizeExtenstion.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchBodyLayoutHint(),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FoodBottomSheetButton(),
              gap,
              Flexible(child: ChatButtonBuilder()),
              gap,
              SizedBox.square(dimension: context.sizeExtenstion.xxExtraLarge),
            ],
          ),
        ],
      ),
    );
  }
}
