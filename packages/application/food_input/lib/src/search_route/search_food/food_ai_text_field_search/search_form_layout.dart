import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchFoodFormLayout extends StatefulWidget {
  const SearchFoodFormLayout({super.key});

  @override
  State<SearchFoodFormLayout> createState() => _SearchFoodFormLayoutState();
}

class _SearchFoodFormLayoutState extends State<SearchFoodFormLayout> {
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(),
          SizedBox(height: context.sizeExtenstion.small),
          SearchFoodByTextSubmitButton(onTap: _onTapSearchButton),
        ],
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

class SearchFoodByTextSubmitButton extends StatelessWidget {
  const SearchFoodByTextSubmitButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listenWhen:
          (previous, current) =>
              previous.searchFoodsByTextInputStatus !=
              current.searchFoodsByTextInputStatus,
      listener: (context, state) {
        if (state.searchFoodsByTextInputStatus.isSuccess) {
          Navigator.of(context).pop();
        }
      },
      buildWhen:
          (previous, current) =>
              previous.searchFoodsByTextInputStatus !=
              current.searchFoodsByTextInputStatus,
      builder: (context, state) {
        if (state.searchFoodsByTextInputStatus.isLoading) {
          return AppOutLineButton.loading(
            label: context.l10n.searchFoodBottomSheetButtonLabel,
          );
        } else {
          return AppOutLineButton(
            onTap: onTap,
            label: context.l10n.searchFoodBottomSheetButtonLabel,
          );
        }
      },
    );
  }
}
