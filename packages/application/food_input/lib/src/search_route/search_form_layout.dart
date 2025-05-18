
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FormLayout extends StatefulWidget {
  const FormLayout({super.key});

  @override
  State<FormLayout> createState() => _FormLayoutState();
}

class _FormLayoutState extends State<FormLayout> {
  late final FocusNode _focusNode;
  @override
  void initState() {
    _focusNode = FocusNode()..addListener(_onFocusChanged);
    super.initState();
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus) {
      context.read<SearchCubit>().onFoodSearchUnfocused();
    }
  }

  @override
  void deactivate() {
    _focusNode.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.sizeExtenstion.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.searchFoodBottomSheetHeading,
            style: context.textTheme.headlineMedium,
          ),
          Divider(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTextField(),
                BlocBuilder<SearchCubit, SearchState>(
                  buildWhen:
                      (previous, current) =>
                          previous.searchFoodsStatus !=
                          current.searchFoodsStatus,
                  builder: (context, state) {
                    if (state.searchFoodsStatus.isLoading) {
                      return AppOutLineButton.loading(
                        label: context.l10n.searchFoodBottomSheetButtonLabel,
                      );
                    } else {
                      return AppOutLineButton(
                        onTap:
                            context
                                .read<SearchCubit>()
                                .readFoodsNutritionsByText,
                        label: context.l10n.searchFoodBottomSheetButtonLabel,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    final hints = [
      context.l10n.searchFoodBottomSheetTextFieldHintExample1,
      context.l10n.searchFoodBottomSheetTextFieldHintExample2,
      context.l10n.searchFoodBottomSheetTextFieldHintExample3,
      context.l10n.searchFoodBottomSheetTextFieldHintExample4,
      context.l10n.searchFoodBottomSheetTextFieldHintExample5,
    ];
    return TextField(
      focusNode: _focusNode,
      onChanged: context.read<SearchCubit>().onFoodSearchChanged,
      onSubmitted: (_) => context.read<SearchCubit>().readFoodsNutritionsByText,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        label: Text(context.l10n.foodName),
        hintText: hints[Random().nextInt(5)],
      ),
      autofocus: true,
      maxLines: null,
      maxLength: 200,
    );
  }
}
