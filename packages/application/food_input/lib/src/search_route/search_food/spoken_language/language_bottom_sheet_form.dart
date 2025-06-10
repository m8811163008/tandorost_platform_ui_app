import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LanguageBottomSheetForm extends StatelessWidget {
  const LanguageBottomSheetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.sizeExtenstion.large),
        child: BlocBuilder<SearchCubit, SearchState>(
          buildWhen:
              (previous, current) =>
                  previous.userSpokenLanguage != current.userSpokenLanguage,
          builder: (context, state) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: Language.values.length,
              itemBuilder: (context, index) {
                final language = Language.values[index];
                return RadioListTile(
                  value: language,
                  groupValue: state.userSpokenLanguage,
                  onChanged: context.read<SearchCubit>().onChangeLanguage,
                  title: Text(
                    context.l10n.languageTranslation(language.name),
                    textAlign: TextAlign.left,
                  ),
                  subtitle: Text(
                    '${language.name} | ${language.code}',
                    textAlign: TextAlign.left,
                  ),
                  visualDensity: VisualDensity.compact,
                );
              },
              separatorBuilder:
                  (context, index) =>
                      SizedBox(height: context.sizeExtenstion.small),
            );
          },
        ),
      ),
    );
  }
}
