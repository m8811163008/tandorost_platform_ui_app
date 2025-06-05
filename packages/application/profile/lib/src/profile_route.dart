import 'package:domain_model/domain_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_repository/image_repository.dart';
import 'package:profile/profile.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';
import 'package:profile_app/src/edit_dialog.dart';
import 'package:profile_app/src/edit_language_button.dart';
import 'package:profile_app/src/edit_name_button.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute({
    super.key,
    this.onBottomNavigationChanged,
    required this.bottomNavigationIndex,
    this.onDrawerNavigationChanged,
    required this.drawerNavigationIndex,
  });

  final ValueChanged<int>? onBottomNavigationChanged;
  final int bottomNavigationIndex;
  final ValueChanged<int>? onDrawerNavigationChanged;
  final int drawerNavigationIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProfileCubit(
            RepositoryProvider.of<ProfileRepository>(context),
            RepositoryProvider.of<ImageRepository>(context),
          ),
      child: AppScaffold(
        appBar: AppBar(),
        body: ProfileView(),
        drawer: NavigationDrawer(
          onDestinationSelected: onDrawerNavigationChanged,
          selectedIndex: drawerNavigationIndex,
          children: AppNavigation.getDrawerChildren(context),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onBottomNavigationChanged,
          currentIndex: bottomNavigationIndex,
          items: AppNavigation.bottomNavigationItems(context),
        ),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen:
          (previous, current) =>
              previous.updatingProfileStatus != current.updatingProfileStatus,
      listener: (context, state) {
        if (state.updatingProfileStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingProfileStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingProfileStatus.isSuccess) {
          context.read<UserAccountCubit>().readUserProfile();
        }
      },
      child: SingleChildScrollView(
        child: Column(children: [ProfileCard(), SettingCard()]),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.personalInfoSettingLabel,
            style: context.textTheme.headlineMedium,
          ),
          SizedBox(height: context.sizeExtenstion.medium),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              BlocConsumer<ProfileCubit, ProfileState>(
                listenWhen:
                    (previous, current) =>
                        previous.uploadingImageProfileStatus !=
                        current.uploadingImageProfileStatus,
                listener: (context, state) {
                  if (state.uploadingImageProfileStatus.isConnectionError) {
                    final content = context.l10n.networkError;
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(content)));
                  } else if (state
                      .uploadingImageProfileStatus
                      .isConnectionError) {
                    final content = context.l10n.internetConnectionError;
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(content)));
                  } else if (state.uploadingImageProfileStatus.isSuccess) {
                    context.read<UserAccountCubit>().readUserProfileImage();
                  }
                },
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
                      await onEditImage(context);
                    },
                    isUploading: state.uploadingImageProfileStatus.isLoading,
                  );
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameRichText(
                    name: context.select(
                      (ProfileCubit cubit) => cubit.state.name,
                    ),
                    editNameButton: EditDialog(dialog: EditNameDialog()),
                  ),
                  SizedBox(height: context.sizeExtenstion.small),
                  PhoneNumberRichText(
                    phoneNumber: context
                        .select<ProfileCubit, String>(
                          (cubit) => cubit.state.phoneNumber,
                        )
                        .replaceFirst('0', '98'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> onEditImage(BuildContext context) async {
    final cubit = context.read<ProfileCubit>();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
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
          Text(
            context.l10n.settingLabel,
            style: context.textTheme.headlineMedium,
          ),
          SizedBox(height: context.sizeExtenstion.medium),
          ChangeWeightSpeedSetting(
            selected: context.select(
              (ProfileCubit cubit) => cubit.state.changeWeightSpeed,
            ),
            onSelectionChanged:
                context.read<ProfileCubit>().onChangeWeightSpeed,
          ),
          SizedBox(height: context.sizeExtenstion.medium),
          TimeRestrictedSetting(
            value: context.select(
              (ProfileCubit cubit) => cubit.state.isTimeRestrictedEating,
            ),
            onChanged: context.read<ProfileCubit>().onChangeIsFasting,
          ),
          Divider(height: context.sizeExtenstion.medium),
          LanguageSetting(
            value: context.select((ProfileCubit cubit) => cubit.state.language),
            onChangeLanguageDialog: BlocProvider.value(
              value: context.read<ProfileCubit>(),
              child: ChangeLanguageDialog(),
            ),
          ),
        ],
      ),
    );
  }
}
