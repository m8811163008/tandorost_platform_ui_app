import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/search_form_layout.dart';
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
      builder: (context) => SearchFoodBottomSheetForm(),
    );
  }
}

class SearchFoodBottomSheetForm extends StatelessWidget {
  const SearchFoodBottomSheetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listenWhen:
          (previous, current) =>
              previous.searchFoodsByTextInputStatus !=
              current.searchFoodsByTextInputStatus,
      listener: (context, state) {
        if (state.searchFoodsByTextInputStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.searchFoodsByTextInputStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }
      },
      child: FormLayout(),
    );
  }
}
