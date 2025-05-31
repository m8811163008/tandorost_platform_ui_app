import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet>
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
        height: MediaQuery.of(context).size.height,
      ),
      builder: (context) => LanguageBottomSheetForm(),
    );
  }
}

class LanguageBottomSheetForm extends StatelessWidget {
  const LanguageBottomSheetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.sizeExtenstion.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.selectLanguageBottomSheetHeading,
            style: context.textTheme.headlineMedium,
          ),
          Divider(),
          BlocBuilder<SearchCubit, SearchState>(
            buildWhen:
                (previous, current) =>
                    previous.userSpokenLanguage != current.userSpokenLanguage,
            builder: (context, state) {
              return Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: Language.values.length,
                  itemBuilder: (context, index) {
                    final language = Language.values[index];
                    return RadioListTile(
                      value: language,
                      groupValue: state.userSpokenLanguage,
                      onChanged: context.read<SearchCubit>().onChangeLanguage,
                      title: Text(language.name, textAlign: TextAlign.left),
                      subtitle: Text(language.code, textAlign: TextAlign.left),
                      visualDensity: VisualDensity.compact,
                    );
                  },
                  separatorBuilder:
                      (context, index) =>
                          SizedBox(height: context.sizeExtenstion.small),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
