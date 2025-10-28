import 'package:athletes_directory/src/cubit/athelte_directory_cubit.dart';
import 'package:flutter/material.dart';

import 'package:tandorost_components/tandorost_components.dart';

class CoachFinanceInfoDialog extends StatefulWidget {
  const CoachFinanceInfoDialog({
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
  State<CoachFinanceInfoDialog> createState() => _CoachFinanceInfoDialogState();
}

class _CoachFinanceInfoDialogState extends State<CoachFinanceInfoDialog> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
      listenWhen: (previous, current) =>
          previous.updatingProfileStatus != current.updatingProfileStatus,
      listener: (context, state) {
        if (state.updatingProfileStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingProfileStatus.isInternetConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingProfileStatus.isSuccess) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
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
          submitButton:
              BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
                buildWhen: (previous, current) =>
                    previous.updatingProfileStatus !=
                    current.updatingProfileStatus,
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
