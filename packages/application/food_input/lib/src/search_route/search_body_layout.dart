import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/search_food/spoken_language/language_icon_button.dart';
import 'package:food_input_app/src/search_route/search_body_layout_footer.dart';
import 'package:food_input_app/src/search_route/search_food/food_ai_chat_search/chat_button_builder.dart';
import 'package:food_input_app/src/search_route/search_food/food_ai_text_field_search/food_bottom_sheet_button.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchBodyLayout extends StatelessWidget {
  const SearchBodyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.sizeExtenstion.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FoodBottomSheetButton(),
              Flexible(child: ChatButtonBuilder()),
              LanguageIconButton(),
            ],
          ),
          SizedBox(height: context.sizeExtenstion.medium),
          SearchBodyLayoutFooter(),
        ],
      ),
    );
  }
}
