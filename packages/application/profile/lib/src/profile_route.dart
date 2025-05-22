import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_repository/image_repository.dart';
import 'package:profile/profile.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute({super.key});
  static const String name = 'profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProfileCubit(RepositoryProvider.of<ProfileRepository>(context),RepositoryProvider.of<ImageRepository>(context)),
      child: AppScaffold(appBar: AppBar(), body: ProfileView()),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [ProfileCard(), SettingCard()]);
  }
}

class AppCard extends StatelessWidget {
  const AppCard({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.sizeExtenstion.small),
        child: child,
      ),
    );
  }
}

class SettingCard extends StatelessWidget {
  const SettingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Setting', style: context.textTheme.headlineMedium),
          SizedBox(height: context.sizeExtenstion.medium),
          ChangeWeightSpeedSetting(),
          SizedBox(height: context.sizeExtenstion.medium),
          IsFastingSetting(),
          // SizedBox(height: context.sizeExtenstion.medium),
          Divider(height: context.sizeExtenstion.medium),
          LanguageSetting(),
        ],
      ),
    );
  }
}

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('language', style: context.textTheme.titleMedium),
        SizedBox(width: context.sizeExtenstion.small),
        TextButton.icon(
          label: Text(Language.persian.name),
          onPressed: () {
            showDialog(
              context: context,

              builder: (context) {
                return AppDialog(
                  title: 'ChangeLanguage',
                  contents: [
                    Row(
                      children: [
                        Text(Language.arabic.name),
                        Radio(
                          value: Language.arabic,
                          groupValue: Language.bengali,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                    
                  ],
                  submitButton: AppTextButton(label: 'ok'),
                );
              },
            );
          },
          icon: Icon(Icons.language),
        ),
      ],
    );
  }
}

class IsFastingSetting extends StatelessWidget {
  const IsFastingSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('data', style: context.textTheme.titleMedium),
        Switch(value: true, onChanged: (value) {}),
      ],
    );
  }
}

class ChangeWeightSpeedSetting extends StatelessWidget {
  const ChangeWeightSpeedSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('data', style: context.textTheme.titleMedium),
        SegmentedButton<ChangeWeightSpeed>(
          segments: const <ButtonSegment<ChangeWeightSpeed>>[
            ButtonSegment<ChangeWeightSpeed>(
              value: ChangeWeightSpeed.constant,
              label: Text('XS'),
            ),
            ButtonSegment<ChangeWeightSpeed>(
              value: ChangeWeightSpeed.fastAndHard,
              label: Text('S'),
            ),
            ButtonSegment<ChangeWeightSpeed>(
              value: ChangeWeightSpeed.medium,
              label: Text('M'),
            ),
            ButtonSegment<ChangeWeightSpeed>(
              value: ChangeWeightSpeed.slowAndEasy,
              label: Text('M'),
            ),
          ],
          selected: {ChangeWeightSpeed.constant},
          onSelectionChanged: (Set<ChangeWeightSpeed> newSelection) {},
        ),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.sizeExtenstion.small),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: context.sizeExtenstion.profileRadius,
              child: Placeholder(),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Name : ',
                          style: context.textTheme.titleSmall,
                        ),
                        TextSpan(
                          text: 'value',
                          style: context.textTheme.bodyMedium,
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(start: 8.0),
                            child: EditNameIcon(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.sizeExtenstion.small),
                  RichText(
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.fade,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'PhoneNumber : ',
                          style: context.textTheme.titleSmall,
                        ),
                        TextSpan(
                          // style: TextStyle(),
                          text: '+9892123123',
                          // style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditNameIcon extends StatelessWidget {
  const EditNameIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AppDialog(
              title: 'ChangeName',
              contents: [
                TextFormField(
                  initialValue: 'asd',
                  decoration: InputDecoration(labelText: 'data'),
                ),
              ],
              submitButton: AppTextButton(label: 'ok'),
            );
          },
        );
      },
      icon: Icon(Icons.edit),
    );
  }
}
