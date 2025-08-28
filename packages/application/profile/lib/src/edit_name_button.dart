import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class EditUserInfoDialog extends StatefulWidget {
  const EditUserInfoDialog({
    super.key,
    required this.dialogTitle,
    this.initialValue = '',
    this.textFieldlabel = '',
    this.hint,
    this.onChnaged,
    this.onSubmit,
    this.validator,
    this.maxLength = 50,
    this.maxLines = 1,
  });
  final String dialogTitle;
  final String initialValue;
  final String textFieldlabel;
  final String? hint;
  final int maxLength;
  final int maxLines;
  final ValueSetter<String>? onChnaged;
  final VoidCallback? onSubmit;
  final String? Function(String?)? validator;

  @override
  State<EditUserInfoDialog> createState() => _EditUserInfoDialogState();
}

class _EditUserInfoDialogState extends State<EditUserInfoDialog> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          previous.updatingProfileStatus != current.updatingProfileStatus ||
          previous.updateCoachProfileStatus != current.updateCoachProfileStatus,
      listener: (context, state) {
        if (state.updatingProfileStatus.isConnectionError ||
            state.updateCoachProfileStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingProfileStatus.isInternetConnectionError ||
            state.updateCoachProfileStatus.isInternetConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingProfileStatus.isSuccess ||
            state.updateCoachProfileStatus.isSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: Form(
        key: _key,
        child: AppDialog(
          title: widget.dialogTitle,
          contents: [
            TextFormField(
              initialValue: widget.initialValue,
              decoration: InputDecoration(
                labelText: widget.textFieldlabel,
                alignLabelWithHint: true,
                hintText: widget.hint,
              ),
              onChanged: widget.onChnaged,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              validator: widget.validator,
            ),
          ],
          submitButton: BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) =>
                previous.updatingProfileStatus != current.updatingProfileStatus,
            builder: (context, state) {
              final label = context.l10n.updateButton;
              return state.updatingProfileStatus.isLoading
                  ? AppTextButton.loading(label: label)
                  : AppTextButton(
                      label: label,
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          widget.onSubmit?.call();
                        }
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
