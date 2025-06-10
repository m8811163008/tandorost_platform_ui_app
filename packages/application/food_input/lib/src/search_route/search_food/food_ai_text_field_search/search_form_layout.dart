import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/search_food/food_ai_text_field_search/search_food_by_text_submit_buttom.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchFoodForm extends StatefulWidget {
  const SearchFoodForm({super.key});

  @override
  State<SearchFoodForm> createState() => _SearchFoodFormState();
}

class _SearchFoodFormState extends State<SearchFoodForm> {
  final _formKey = GlobalKey<FormState>();
  String hint = '';

  @override
  void didChangeDependencies() {
    final hints = [
      context.l10n.searchFoodBottomSheetTextFieldHintExample1,
      context.l10n.searchFoodBottomSheetTextFieldHintExample2,
      context.l10n.searchFoodBottomSheetTextFieldHintExample3,
      context.l10n.searchFoodBottomSheetTextFieldHintExample4,
      context.l10n.searchFoodBottomSheetTextFieldHintExample5,
    ];
    hint = hints[Random().nextInt(5)];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listenWhen:
          (previous, current) =>
              previous.searchFoodsByTextInputStatus !=
              current.searchFoodsByTextInputStatus,
      listener: (context, state) {
        if (state.searchFoodsByTextInputStatus.isSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(),
            SizedBox(height: context.sizeExtenstion.small),
            SearchFoodByTextSubmitButton(onTap: _onTapSearchButton),
          ],
        ),
      ),
    );
  }

  void _onTapSearchButton() {
    if (_formKey.currentState!.validate()) {
      context.read<SearchCubit>().readFoodsNutritionsByText();
    }
  }

  Widget _buildTextField() {
    return TextFormField(
      onChanged: context.read<SearchCubit>().onFoodSearchChanged,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        label: Text(context.l10n.foodName),
        hintText: hint,
      ),
      autofocus: true,
      maxLines: null,
      maxLength: 200,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.l10n.emptyFormFieldValidationError;
        }
        return null;
      },
    );
  }
}
