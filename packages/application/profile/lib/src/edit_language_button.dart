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
          title: 'ChangeLanguage',
          contents:
              Language.values
                  .map(
                    (language) => _buildLanguageRow(
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
              return state.updatingProfileStatus.isLoading
                  ? AppTextButton.loading(label: 'update language')
                  : AppTextButton(
                    label: 'update language',
                    onTap: context.read<ProfileCubit>().updateLanguage,
                  );
            },
          ),
        );
      },
    );
  }

  Widget _buildLanguageRow({
    required Language language,
    required Language groupValue,
    required ValueSetter<Language?> onChanged,
  }) {
    return Row(
      children: [
        Radio(
          value: language,
          groupValue: groupValue,
          onChanged: (language) {
            if (language == null) return;
            onChanged(language);
          },
        ),
        Text(language.name),
      ],
    );
  }
}
