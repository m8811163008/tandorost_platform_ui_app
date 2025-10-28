import 'package:athletes_directory/athletes_directory.dart';
import 'package:athletes_directory/src/referrals_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class InviteTrainee extends StatefulWidget {
  const InviteTrainee({super.key});

  @override
  State<InviteTrainee> createState() => _InviteTraineeState();
}

class _InviteTraineeState extends State<InviteTrainee> {
  String? _value;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
      listenWhen: (previous, current) =>
          previous.onInviteTraineeStatus != current.onInviteTraineeStatus,
      listener: (context, state) {
        if (state.onInviteTraineeStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.onInviteTraineeStatus.isInternetConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.onInviteTraineeStatus.isSuccess) {
          final content = context.l10n.inviteTraineeSuccessMessage;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));

          FocusScope.of(context).unfocus();
          _formKey.currentState!.reset();
        }
      },
      child: AppCard(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppCardHeader(title: context.l10n.inviteTraineeSectionHeadline),
              Text(context.l10n.inviteTraineeSectionSubtitle1),
              Text(context.l10n.inviteTraineeSectionSubtitle2),
              SizedBox(height: context.sizeExtenstion.small),
              Directionality(
                textDirection: TextDirection.ltr,
                child: RegullarTextField(
                  initalValue: _value,
                  label: context.l10n.inviteTraineeSectionTextFieldLabel,
                  hintText: context.l10n.inviteTraineeSectionTextFieldHint,
                  textAlign: TextAlign.left,
                  onChange: (value) {
                    _value = value;
                  },
                  onTapOutside: (_) {
                    FocusScope.of(context).unfocus();
                    _formKey.currentState!.reset();
                  },
                  suffixWidget: TextButton.icon(
                    onPressed:
                        context.select(
                          (AthelteDirectoryCubit cubit) =>
                              !cubit.state.onInviteTraineeStatus.isLoading,
                        )
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<AthelteDirectoryCubit>()
                                  .inviteTrainee(_value!);
                            }
                            FocusScope.of(context).unfocus();
                          }
                        : null,
                    label: Text(context.l10n.send),
                    icon:
                        context.select(
                          (AthelteDirectoryCubit cubit) =>
                              cubit.state.onInviteTraineeStatus.isLoading,
                        )
                        ? CircularProgressIndicator()
                        : Icon(Icons.send),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.emptyFormFieldValidationError;
                    } else {
                      final phonenumberEmailRegex = RegExp(
                        r'(^09\d{9}$)|(^[^@]+@[^@]+\.[^@]+$)',
                      );
                      if (!phonenumberEmailRegex.hasMatch(value)) {
                        return context.l10n.identifierTextFieldValidationError;
                      }
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: context.sizeExtenstion.small),
              TextButton(
                onPressed: () {
                  // 1. Call the cubit method to fetch the referrals
                  context
                      .read<AthelteDirectoryCubit>()
                      .readReferralByInviterId();

                  // 2. Show the dialog
                  showDialog(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      // Pass the existing cubit instance to the new dialog
                      value: context.read<AthelteDirectoryCubit>(),
                      child: const Referrals(), // <-- Your new dialog widget
                    ),
                  );
                },
                child: Text(
                  context.l10n.profileRouteReferralsElevatedButtonTitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
