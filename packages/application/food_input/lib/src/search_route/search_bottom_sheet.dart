import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchFoodBottomSheet extends StatefulWidget {
  const SearchFoodBottomSheet({super.key});

  @override
  State<SearchFoodBottomSheet> createState() => _SearchFoodBottomSheetState();
}

class _SearchFoodBottomSheetState extends State<SearchFoodBottomSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = BottomSheet.createAnimationController(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      animationController: _controller,
      showDragHandle: true,
      enableDrag: true,
      onClosing: Navigator.of(context).pop,
      constraints: BoxConstraints.tightFor(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
      ),
      builder:
          (context) => BlocListener<SearchCubit, SearchState>(
            listenWhen:
                (previous, current) =>
                    previous.searchFoodsStatus != current.searchFoodsStatus,
            listener: (context, state) {
              if (state.searchFoodsStatus.isServerConnectionError) {
                final content = context.l10n.networkError;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(content)));
              } else if (state.searchFoodsStatus.isServerConnectionError) {
                final content = context.l10n.internetConnectionError;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(content)));
              }
            },

            child: SearchFoodBottomSheetForm(),
          ),
    );
  }
}

class SearchFoodBottomSheetForm extends StatefulWidget {
  const SearchFoodBottomSheetForm({super.key});

  @override
  State<SearchFoodBottomSheetForm> createState() =>
      _SearchFoodBottomSheetFormState();
}

class _SearchFoodBottomSheetFormState extends State<SearchFoodBottomSheetForm> {
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
    final hints = [
      context.l10n.searchFoodBottomSheetTextFieldHintExample1,
      context.l10n.searchFoodBottomSheetTextFieldHintExample2,
      context.l10n.searchFoodBottomSheetTextFieldHintExample3,
      context.l10n.searchFoodBottomSheetTextFieldHintExample4,
      context.l10n.searchFoodBottomSheetTextFieldHintExample5,
    ];
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
                TextField(
                  focusNode: _focusNode,
                  onChanged: context.read<SearchCubit>().onFoodSearchChanged,

                  decoration: InputDecoration(
                    label: Text(context.l10n.foodName),
                    hintText: hints[Random().nextInt(5)],
                  ),
                  autofocus: true,
                  maxLines: null,
                  maxLength: 200,
                ),
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
}

class AppOutLineButton extends StatelessWidget {
  const AppOutLineButton({super.key, this.onTap, required this.label})
    : _isLoading = false;

  const AppOutLineButton.loading({super.key, this.onTap, required this.label})
    : _isLoading = true;
  final bool _isLoading;
  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? OutlinedButton.icon(
          onPressed: onTap,
          label: Text(label),
          icon: LoadingLottie(size: context.sizeExtenstion.appButton),
        )
        : OutlinedButton(onPressed: onTap, child: Text(label));
  }
}
