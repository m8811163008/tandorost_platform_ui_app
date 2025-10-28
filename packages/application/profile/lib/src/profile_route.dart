import 'package:authentication/authentication.dart';
import 'package:coach_repository/coach_repository.dart';
import 'package:domain_model/domain_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_repository/image_repository.dart';
import 'package:payment_repository/payment.dart';
import 'package:profile/profile.dart';
import 'package:profile_app/profile.dart';
import 'package:profile_app/src/bodybuilding_coach_card.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';
import 'package:profile_app/src/edit_dialog.dart';
import 'package:profile_app/src/edit_name_button.dart';
import 'package:profile_app/src/transactions.dart';
import 'package:profile_app/src/verification_code_dialog.dart';
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
      create: (context) => ProfileCubit(
        RepositoryProvider.of<ProfileRepository>(context),
        RepositoryProvider.of<ImageRepository>(context),
        RepositoryProvider.of<PaymentRepository>(context),
        RepositoryProvider.of<CoachRepository>(context),
        RepositoryProvider.of<AuthenticationRepository>(context),
        RepositoryProvider.of<FlutterLocalNotificationsPlugin>(context),
      ),
      child: AppScaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.appRoutesName(RoutesNames.profileRoute.name),
          ),
          actions: [ArchiveImagesButton()],
        ),
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

class ArchiveImagesButton extends StatelessWidget {
  const ArchiveImagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return BlocConsumer<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          previous.archivingImagesStatus != current.archivingImagesStatus,
      listener: (context, state) {
        if (state.archivingImagesStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.archivingImagesStatus.isInternetConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.archivingImagesStatus.isSuccess) {
          cubit.readUserImageGallary();
        }
      },
      buildWhen: (previous, current) =>
          previous.archivingImagesStatus != current.archivingImagesStatus ||
          previous.archiveImagesId != current.archiveImagesId,
      builder: (context, state) {
        final isLoading = state.archivingImagesStatus.isLoading;
        final isImagesIdNotEmpty = state.archiveImagesId.isNotEmpty;
        return IconButton(
          onPressed: !isLoading && isImagesIdNotEmpty
              ? cubit.archiveImages
              : null,
          tooltip: context.l10n.prfileArchiveImagesButtonTooltip,
          icon: Icon(Icons.archive),
        );
      },
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previous, current) =>
              previous.readProfileStatus != current.readProfileStatus ||
              previous.updatingProfileStatus != current.updatingProfileStatus,
          listener: (context, state) async {
            if (state.readProfileStatus.isConnectionError ||
                state.updatingProfileStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.readProfileStatus.isInternetConnectionError ||
                state.updatingProfileStatus.isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previous, current) =>
              previous.userProfile?.isBodybuildingCoach !=
              current.userProfile?.isBodybuildingCoach,
          listener: (context, state) async {
            // if (state.coachProfile == null) return;
            final cubit = context.read<ProfileCubit>();
            if (state.userProfile!.isBodybuildingCoach) {
              cubit.readCoachProfile();
              cubit.readUserImageGallary();
              cubit.readCoachPrograms();
            } else {
              if (state.coachProfile != null) {
                // get a new jwt with proper scopes
                cubit.logout();
              }
            }
          },
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previous, current) =>
              previous.readUserImageGallaryStatus !=
              current.readUserImageGallaryStatus,
          listener: (context, state) async {
            if (state.readUserImageGallaryStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .readUserImageGallaryStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previous, current) =>
              previous.archivingImagesStatus != current.archivingImagesStatus ||
              previous.addUserImageStatus != current.addUserImageStatus,
          listener: (context, state) async {
            if (state.archivingImagesStatus.isConnectionError ||
                state.addUserImageStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.archivingImagesStatus.isInternetConnectionError ||
                state.addUserImageStatus.isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.archivingImagesStatus.isSuccess ||
                state.addUserImageStatus.isSuccess) {
              context.read<ProfileCubit>().readUserImageGallary();
            }
          },
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previous, current) =>
              previous.readingCoachProgram != current.readingCoachProgram,
          listener: (context, state) async {
            if (state.readingCoachProgram.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.archivingImagesStatus.isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previous, current) =>
              previous.verifyVerificationCodeStatus !=
              current.verifyVerificationCodeStatus,
          listener: (context, state) async {
            if (state.verifyVerificationCodeStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .verifyVerificationCodeStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.verifyVerificationCodeStatus.isSuccess) {
              final cubit = context.read<ProfileCubit>();
              cubit.updateProfile(state.updatedUserProfile!);
            }
          },
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previous, current) =>
              previous.sendVerificationCodeStatus !=
              current.sendVerificationCodeStatus,
          listener: (context, state) async {
            if (state.sendVerificationCodeStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .sendVerificationCodeStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.sendVerificationCodeStatus.isSuccess) {
              showDialog(
                context: context,
                builder: (_) {
                  return BlocProvider.value(
                    value: context.read<ProfileCubit>(),
                    child: VerificationCodeDialog(
                      dialogTitle: context.l10n.verificationCodeDialogTitle,
                      textFieldlabel: context
                          .l10n
                          .verificationCodeDialogVerificationCodeTextFieldLabel,
                      hint: context
                          .l10n
                          .verificationCodeDialogVerificationCodeTextFieldHint,

                      onChnaged: context
                          .read<ProfileCubit>()
                          .onChangVerificationCode,
                      onSubmit: context
                          .read<ProfileCubit>()
                          .verifyVerificationCode,
                      validator: (value) {
                        final phoneRegex = RegExp(r'^\d{4}$');
                        if (value != null &&
                            value.isNotEmpty &&
                            !phoneRegex.hasMatch(value)) {
                          return context.l10n.minLengthFormFieldValidationError(
                            4,
                          );
                        }
                        return null;
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ],

      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCard(), SettingCard(),

            // BodyBuildingCoachCard()
          ],
        ),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.personalInfoSettingLabel,
            style: context.textTheme.headlineMedium,
          ),
          SizedBox(height: context.sizeExtenstion.medium),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            spacing: context.sizeExtenstion.medium,
            children: [
              ImageProfileConsumer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserInfoRichText(
                    label: context.l10n.personalInfoNameLabel,
                    value: context.select(
                      (ProfileCubit cubit) =>
                          cubit.state.userProfile?.fullName ?? '',
                    ),
                    editValueButton: EditDialog(
                      dialog: EditUserInfoDialog(
                        dialogTitle: context.l10n.dialogTitleChangeName,
                        textFieldlabel: context.l10n.changeNameTextFieldLabel,
                        initialValue: context.select(
                          (ProfileCubit cubit) =>
                              cubit.state.userProfile?.fullName ?? '',
                        ),
                        onChnaged: context.read<ProfileCubit>().onChangeName,
                        onSubmit: context.read<ProfileCubit>().updateName,
                      ),
                    ),
                  ),
                  SizedBox(height: context.sizeExtenstion.small),
                  // TODO verify phone number and email
                  UserInfoRichText(
                    label: context.l10n.personalInfoPhoneLabel,
                    value: context.select(
                      (ProfileCubit cubit) =>
                          cubit.state.userProfile?.phoneNumber ?? '',
                    ),
                    editValueButton: EditDialog(
                      dialog: EditUserInfoDialog(
                        dialogTitle: context.l10n.dialogTitleChangePhoneNumber,
                        textFieldlabel:
                            context.l10n.changePhoneNumberTextFieldLabel,
                        initialValue: context.select(
                          (ProfileCubit cubit) =>
                              cubit.state.userProfile?.phoneNumber ?? '',
                        ),
                        onChnaged: context
                            .read<ProfileCubit>()
                            .onChangPhoneNumber,
                        onSubmit: () {
                          context.read<ProfileCubit>().sendVerificationCode(
                            isVerifyPhoneNumber: true,
                          );
                        },
                        validator: (value) {
                          final phoneRegex = RegExp(r'^09\d{9}$');
                          if (value != null &&
                              value.isNotEmpty &&
                              !phoneRegex.hasMatch(value)) {
                            return context
                                .l10n
                                .changePhoneNumberTextFieldValidatorErrorMessage;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: context.sizeExtenstion.small),
                  UserInfoRichText(
                    label: context.l10n.personalInfoEmailLabel,
                    value: context.select(
                      (ProfileCubit cubit) =>
                          cubit.state.userProfile?.email ?? '',
                    ),
                    editValueButton: EditDialog(
                      dialog: EditUserInfoDialog(
                        dialogTitle: context.l10n.dialogTitleChangeEmail,
                        textFieldlabel: context.l10n.changeEmailTextFieldLabel,
                        initialValue: context.select(
                          (ProfileCubit cubit) =>
                              cubit.state.userProfile?.email ?? '',
                        ),
                        onChnaged: context.read<ProfileCubit>().onChangEmail,
                        onSubmit: () {
                          context.read<ProfileCubit>().sendVerificationCode(
                            isVerifyPhoneNumber: false,
                          );
                        },
                        validator: (value) {
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                          if (value != null &&
                              value.isNotEmpty &&
                              !emailRegex.hasMatch(value)) {
                            return context
                                .l10n
                                .changeEmailTextFieldValidatorErrorMessage;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: context.sizeExtenstion.small),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton.icon(
                      onPressed: () {
                        context.read<ProfileCubit>().readSubscriptions();
                        showDialog(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: context.read<ProfileCubit>(),
                            child: Transactions(),
                          ),
                        );
                      },
                      label: Text(
                        context.l10n.profileRouteTansactionDialogTitle,
                      ),
                      icon: Icon(Icons.wallet),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageProfileConsumer extends StatelessWidget {
  const ImageProfileConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          previous.uploadingImageProfileStatus !=
          current.uploadingImageProfileStatus,
      listener: (context, state) {
        if (state.uploadingImageProfileStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.uploadingImageProfileStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.uploadingImageProfileStatus.isSuccess) {
          context.read<UserAccountCubit>().readUserProfileImage();
        }
      },
      buildWhen: (previous, current) =>
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
    );
  }

  Future<void> onEditImage(BuildContext context) async {
    final cubit = context.read<ProfileCubit>();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
      withData: true,
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
              (ProfileCubit cubit) =>
                  cubit.state.userProfile?.changeWeightSpeed ??
                  ChangeWeightSpeed.constant,
            ),
            onSelectionChanged: context
                .read<ProfileCubit>()
                .onChangeWeightSpeed,
          ),
          SizedBox(height: context.sizeExtenstion.medium),
          SettingRadioButton(
            label: context.l10n.timeRestrictedEatingLabel,
            value: context.select(
              (ProfileCubit cubit) =>
                  cubit.state.userProfile?.isTimeRestrictedEating ?? false,
            ),
            onChanged: context.read<ProfileCubit>().onChangeIsFasting,
          ),
          SettingRadioButton(
            label: context.l10n.notificationReminderLabel,
            value: context.select(
              (ProfileCubit cubit) =>
                  cubit.state.isReminderNotificationPermissionGranted,
            ),
            onChanged: (_) {
              final notificationTexts = NotiticationTexts(
                title: context.l10n.scheduleMessageTitle,
                body: context.l10n.scheduleMessageBody,
                hint: context.l10n.scheduleMessageHint,
              );
              context.read<ProfileCubit>().onToggleReminderNotifications(
                notificationTexts,
              );
            },
          ),
          // TODO add langiage support to front and babckend
          // Divider(height: context.sizeExtenstion.medium),

          // LanguageSetting(
          //   value: context.select(
          //     (ProfileCubit cubit) =>
          //         cubit.state.userProfile?.language ?? Language.persian,
          //   ),
          //   onChangeLanguageDialog: BlocProvider.value(
          //     value: context.read<ProfileCubit>(),
          //     child: ChangeLanguageDialog(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
