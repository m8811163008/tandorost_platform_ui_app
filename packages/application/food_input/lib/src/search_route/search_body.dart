import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_input_app/src/search_route/search_bottom_sheet.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // to center AIChatButton
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 48),
              child: AIChatButton(
                onLongPressStart: () {},
                onLongPressUp: () {},
              ),
            ),
            IconButton.filledTonal(
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return SearchFoodBottomSheet();
                  },
                );
              },
              icon: Icon(Icons.keyboard),
            ),
          ],
        ),
        SizedBox(height: context.sizeExtenstion.extraLarge),
      ],
    );
  }
}
