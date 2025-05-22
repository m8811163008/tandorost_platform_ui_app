import 'package:domain_model/domain_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_repository/image_repository.dart';
import 'package:profile/profile.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';
import 'package:profile_app/src/edit_name_button.dart';
import 'package:tandorost_components/src/profile/language_setting.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute({super.key});
  static const String name = 'profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProfileCubit(
            RepositoryProvider.of<ProfileRepository>(context),
            RepositoryProvider.of<ImageRepository>(context),
          ),
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

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal info', style: context.textTheme.headlineMedium),
          SizedBox(height: context.sizeExtenstion.medium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NameRichText(
                      name: context.select(
                        (ProfileCubit cubit) => cubit.state.name,
                      ),
                      editNameButton: EditNameButton(),
                    ),
                    SizedBox(height: context.sizeExtenstion.small),
                    PhoneNumberRichText(),
                  ],
                ),
              ),
              BlocBuilder<ProfileCubit, ProfileState>(
                buildWhen:
                    (previous, current) =>
                        previous.uploadingImageProfileStatus !=
                        current.uploadingImageProfileStatus,
                builder: (context, state) {
                  return ImageProfile(
                    imageProfile: context.select(
                      (ProfileCubit cubit) => cubit.state.profileImage,
                    ),
                    onEditPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['png', 'jpg', 'jpeg'],
                          );
                      if (result != null) {
                        final singleResult = result.files.single;
                        if (singleResult.bytes == null) {
                          return;
                        }
                        final fileDetail = FileDetail(
                          fileName: singleResult.name,
                          bytes: singleResult.bytes!,
                        );
                        cubit.updateImageProfile(fileDetail);
                      }
                    },
                    isUploading: state.uploadingImageProfileStatus.isLoading,
                  );
                },
              ),
            ],
          ),
        ],
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
          ChangeWeightSpeedSetting(selected: ChangeWeightSpeed.constant),
          SizedBox(height: context.sizeExtenstion.medium),
          IsFastingSetting(value: false),
          // SizedBox(height: context.sizeExtenstion.medium),
          Divider(height: context.sizeExtenstion.medium),
          LanguageSetting(groupValue: Language.arabic),
        ],
      ),
    );
  }
}
