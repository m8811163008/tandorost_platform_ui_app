import 'dart:math';

import 'package:flutter/material.dart';
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
    final hints = [
      context.l10n.searchFoodBottomSheetTextFieldHintExample1,
      context.l10n.searchFoodBottomSheetTextFieldHintExample2,
      context.l10n.searchFoodBottomSheetTextFieldHintExample3,
      context.l10n.searchFoodBottomSheetTextFieldHintExample4,
      context.l10n.searchFoodBottomSheetTextFieldHintExample5,
    ];
    return BottomSheet(
      animationController: _controller,
      showDragHandle: true,
      enableDrag: true,
      onClosing: Navigator.of(context).pop,
      constraints: BoxConstraints.tightFor(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
      ),

      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sizeExtenstion.large,
          ),
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
                      decoration: InputDecoration(
                        label: Text(context.l10n.foodName),
                        hintText: hints[Random().nextInt(5)],
                      ),
                      autofocus: true,
                      maxLines: null,
                      maxLength: 200,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        context.l10n.searchFoodBottomSheetButtonLabel,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
