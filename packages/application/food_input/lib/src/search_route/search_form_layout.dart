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
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
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
                  BlocConsumer<SearchCubit, SearchState>(
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
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<SearchCubit>()
                                  .readFoodsNutritionsByText();
                            }
                          },
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
    return TextFormField(
      onChanged: context.read<SearchCubit>().onFoodSearchChanged,

      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        label: Text(context.l10n.foodName),
        hintText: hints[Random().nextInt(5)],
      ),
      autofocus: true,
      maxLines: null,
      maxLength: 200,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.l10n.emptyFormFieldValidationError;
        }
      },
    );
  }
}
