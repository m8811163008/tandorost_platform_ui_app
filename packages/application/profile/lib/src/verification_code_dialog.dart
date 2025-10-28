import 'package:flutter/material.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class VerificationCodeDialog extends StatefulWidget {
  const VerificationCodeDialog({
    super.key,
    required this.dialogTitle,
    this.textFieldlabel = '',
    this.onChnaged,
    this.onSubmit,
    this.validator,
    this.hint,
    this.maxLength = 50,
  });
  final String dialogTitle;
  final String textFieldlabel;
  final String? hint;
  final int maxLength;

  final ValueSetter<String>? onChnaged;
  final VoidCallback? onSubmit;
  final String? Function(String?)? validator;

  @override
  State<VerificationCodeDialog> createState() => _VerificationCodeDialogState();
}

class _VerificationCodeDialogState extends State<VerificationCodeDialog> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          previous.verifyVerificationCodeStatus !=
          current.verifyVerificationCodeStatus,
      listener: (context, state) {
        if (state.verifyVerificationCodeStatus.isConnectionError ||
            state.updateCoachProfileStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state
                .verifyVerificationCodeStatus
                .isInternetConnectionError ||
            state.updateCoachProfileStatus.isInternetConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.verifyVerificationCodeStatus.isSuccess) {
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
              decoration: InputDecoration(
                labelText: widget.textFieldlabel,
                alignLabelWithHint: true,
                hintText: widget.hint,
              ),
              onChanged: widget.onChnaged,

              maxLength: widget.maxLength,
              validator: widget.validator,
            ),
          ],
          submitButton: BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) =>
                previous.verifyVerificationCodeStatus !=
                current.verifyVerificationCodeStatus,
            builder: (context, state) {
              final label = context.l10n.verifyFormOutlineLabel;
              return state.verifyVerificationCodeStatus.isLoading
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
