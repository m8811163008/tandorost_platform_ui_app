import 'package:flutter/material.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';
import 'package:profile_app/src/edit_dialog.dart';
import 'package:profile_app/src/edit_name_button.dart';
import 'package:tandorost_components/tandorost_components.dart';

class BodyBuildingCoachCard extends StatelessWidget {
  const BodyBuildingCoachCard({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.medium);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Text(
            context.l10n.coachSettingLabel,
            style: context.textTheme.headlineMedium,
          ),
          gap,
          SettingRadioButton(
            label: context.l10n.coachSettingActivateToggleLabel,
            value: context.select(
              (ProfileCubit cubit) =>
                  cubit.state.userProfile?.isBodybuildingCoach ?? false,
            ),
            onChanged: context
                .read<ProfileCubit>()
                .onChangeBodybuildingCoachRole,
          ),
          if (context.select(
            (ProfileCubit cubit) =>
                cubit.state.userProfile?.isBodybuildingCoach ?? false,
          )) ...[
            gap,
            SettingRadioButton(
              label: context.l10n.coachSettingAvailabilityToggleLabel,
              value: context.select(
                (ProfileCubit cubit) =>
                    cubit.state.coachProfile?.isActive ?? false,
              ),
              onChanged: context.read<ProfileCubit>().onChangeIsCoachAvailable,
            ),
            gap,
            UserInfoRichText(
              label: context.l10n.coachSettingBiographyLabel,
              value: context.select(
                (ProfileCubit cubit) =>
                    cubit.state.coachProfile?.biography ?? '',
              ),
              editValueButton: EditDialog(
                dialog: EditUserInfoDialog(
                  dialogTitle: context.l10n.coachSettingBiographyDialogTitle,
                  textFieldlabel:
                      context.l10n.coachSettingBiographyDialogTextFieldlabel,
                  hint: context.l10n.coachSettingBiographyDialogTextFieldHint,
                  maxLines: 4,
                  maxLength: 700,
                  initialValue: context.select(
                    (ProfileCubit cubit) =>
                        cubit.state.coachProfile?.biography ?? '',
                  ),
                  onChnaged: context
                      .read<ProfileCubit>()
                      .onChangeCoachBiography,
                  onSubmit: context.read<ProfileCubit>().updateCoachBiography,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
