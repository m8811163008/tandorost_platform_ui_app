import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listenWhen:
          (previous, current) =>
              previous.updatingProfileStatus != current.updatingProfileStatus,
      listener: (context, state) {
        if (state.updatingProfileStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingProfileStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingProfileStatus.isSuccess) {
          Navigator.of(context).pop();
        }
      },
      buildWhen: (previous, current) => previous.language != current.language,
      builder: (context, state) {
        return AppDialog(
          title: context.l10n.dialogTitleChangeApplicationLanguage,
          contents:
              Language.values
                  .map(
                    (language) => _buildLanguageRow(
                      context,
                      language: language,
                      groupValue: state.language,
                      onChanged: context.read<ProfileCubit>().onChangeLanguage,
                    ),
                  )
                  .toList(),

          submitButton: BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen:
                (previous, current) =>
                    previous.updatingProfileStatus !=
                    current.updatingProfileStatus,
            builder: (context, state) {
              final label = context.l10n.updateButton;
              return state.updatingProfileStatus.isLoading
                  ? AppTextButton.loading(label: label)
                  : AppTextButton(
                    label: label,
                    onTap: context.read<ProfileCubit>().updateLanguage,
                  );
            },
          ),
        );
      },
    );
  }

  Widget _buildLanguageRow(
    BuildContext context, {

    required Language language,
    required Language groupValue,
    required ValueSetter<Language?> onChanged,
  }) {
    return Row(
      children: [
        Radio(
          value: language,
          groupValue: groupValue,
          onChanged: (_) {
            onChanged(language);
          },
        ),
        GestureDetector(
          onTap: () {
            onChanged(language);
          },
          child: Row(
            children: [
              Text(context.l10n.languageTranslation(language.name)),
              SizedBox(width: context.sizeExtenstion.small),
              Text(language.name),
            ],
          ),
        ),
      ],
    );
  }
}
