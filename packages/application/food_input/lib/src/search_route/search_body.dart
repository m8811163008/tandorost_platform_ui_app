import 'dart:math';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/language_bottom_sheet.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:flutter/material.dart';
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
            IconButton.filledTonal(
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (_) {
                    return SearchFoodBottomSheet();
                  },
                );
              },
              icon: Icon(Icons.keyboard),
            ),
            AIChatButton(
              onLongPressStart:
                  context.read<SearchCubit>().onSearchByVoicePressedDown,
              onLongPressUp:
                  context.read<SearchCubit>().onSearchByVoicePressedUp,
            ),
            IconButton.filledTonal(
              onPressed: () {
                showBottomSheet(
                  context: context,

                  builder: (_) {
                    return LanguageBottomSheet();
                  },
                );
              },
              icon: Icon(Icons.language),
            ),
          ],
        ),
        SizedBox(height: context.sizeExtenstion.extraLarge),
      ],
    );
  }
}
