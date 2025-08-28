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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'context.l10n.settingLabel',
            style: context.textTheme.headlineMedium,
          ),
          gap,
          SettingRadioButton(
            label: 'isCoach',
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
              label: 'isAvalabel',
              value: context.select(
                (ProfileCubit cubit) =>
                    cubit.state.coachProfile?.isActive ?? false,
              ),
              onChanged: context.read<ProfileCubit>().onChangeIsCoachAvailable,
            ),
            gap,
            UserInfoRichText(
              label: 'biography',
              value: context.select(
                (ProfileCubit cubit) =>
                    cubit.state.coachProfile?.biography ?? '',
              ),
              editValueButton: EditDialog(
                dialog: EditUserInfoDialog(
                  dialogTitle: 'context.l10n.dialogTitleChangeName',
                  textFieldlabel: 'context.l10n.changeNameTextFieldLabel',
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
