import 'package:athletes_directory/src/coach_platform_status/coach_platform_card.dart';
import 'package:athletes_directory/src/coach_platform_status/cubit/coach_platform_status_cubit.dart';
import 'package:athletes_directory/src/coach_work_space/bodybuilding_coach_card.dart';
import 'package:athletes_directory/src/cubit/athelte_directory_cubit.dart';
import 'package:athletes_directory/src/coach_finance.dart';
import 'package:athletes_directory/src/invite_trainee.dart';
import 'package:authentication/authentication.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:image_repository/image_repository.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AthletesDirectoryRoute extends StatelessWidget {
  const AthletesDirectoryRoute({
    super.key,
    this.onBottomNavigationChanged,
    required this.bottomNavigationIndex,
    this.onDrawerNavigationChanged,
    required this.drawerNavigationIndex,
    this.goToAthleteDetailRoute,
  });
  final ValueChanged<int>? onBottomNavigationChanged;
  final int bottomNavigationIndex;
  final ValueChanged<int>? onDrawerNavigationChanged;
  final int drawerNavigationIndex;
  final VoidCallback? goToAthleteDetailRoute;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.appRoutesName(RoutesNames.athletesDirectoryRoute.name),
        ),
        actions: [ArchiveImagesButton()],
      ),
      body: AthletesDirectoryListener(
        goToAthleteDetailRoute: goToAthleteDetailRoute,
      ),
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
    );
  }
}

class ArchiveImagesButton extends StatelessWidget {
  const ArchiveImagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AthelteDirectoryCubit>();
    return BlocConsumer<AthelteDirectoryCubit, AthelteDirectoryState>(
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
          context.read<CoachPlatformStatusCubit>().onReadVerifyVideos();
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

class AthletesDirectoryListener extends StatelessWidget {
  const AthletesDirectoryListener({super.key, this.goToAthleteDetailRoute});
  final VoidCallback? goToAthleteDetailRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
          listenWhen: (previous, current) =>
              previous.onReadCoachEnrollmentsStatus !=
              current.onReadCoachEnrollmentsStatus,
          listener: (context, state) {
            if (state.onReadCoachEnrollmentsStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .onReadCoachEnrollmentsStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onReadCoachEnrollmentsStatus.isSuccess) {
              context
                  .read<AthelteDirectoryCubit>()
                  .onReadCoachAthletesProfile();
            }
          },
        ),
        BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
          listenWhen: (previous, current) =>
              previous.onReadAthletesUserProfileStatus !=
              current.onReadAthletesUserProfileStatus,
          listener: (context, state) {
            if (state.onReadAthletesUserProfileStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .onReadAthletesUserProfileStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onReadAthletesUserProfileStatus.isSuccess) {
              context.read<AthelteDirectoryCubit>().readAthletesImages();
            }
          },
        ),
        BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
          listenWhen: (previous, current) =>
              previous.onReadUserProfileStatus !=
              current.onReadUserProfileStatus,
          listener: (context, state) {
            if (state.onReadUserProfileStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .onReadUserProfileStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onReadUserProfileStatus.isSuccess) {
              if (state.userProfile?.isBodybuildingCoach ?? false) {
                context.read<AthelteDirectoryCubit>().onReadCoachEnrollments();
                context.read<AthelteDirectoryCubit>().onReadSubscriptions();
              }
            }
          },
        ),
        BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
          listenWhen: (previous, current) =>
              previous.onReadAthletesImagesStatus !=
              current.onReadAthletesImagesStatus,
          listener: (context, state) {
            if (state.onReadAthletesImagesStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .onReadAthletesImagesStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),

        BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
          listenWhen: (previous, current) =>
              previous.readCoachProfileStatus !=
                  current.readCoachProfileStatus ||
              previous.updatingProfileStatus != current.updatingProfileStatus,
          listener: (context, state) async {
            if (state.readCoachProfileStatus.isConnectionError ||
                state.updatingProfileStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.readCoachProfileStatus.isInternetConnectionError ||
                state.updatingProfileStatus.isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),
        BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
          listenWhen: (previous, current) =>
              previous.userProfile?.isBodybuildingCoach !=
              current.userProfile?.isBodybuildingCoach,
          listener: (context, state) async {
            // if (state.coachProfile == null) return;
            final cubit = context.read<AthelteDirectoryCubit>();
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
        BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
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
        BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
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
              context.read<AthelteDirectoryCubit>().readUserImageGallary();
            }
          },
        ),
        BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
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
      ],
      child: BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
        buildWhen: (previous, current) =>
            previous.onReadUserProfileStatus != current.onReadUserProfileStatus,
        builder: (context, state) {
          if (state.onReadUserProfileStatus.isLoading ||
              state.onReadUserProfileStatus.isInital) {
            return Center(child: CircularProgressIndicator());
          } else if (state.onReadUserProfileStatus.isConnectionError ||
              state.onReadUserProfileStatus.isInternetConnectionError) {
            return Center(child: Text(context.l10n.networkError));
          } else if (state.onReadUserProfileStatus.isSuccess) {
            if (state.userProfile == null) return SizedBox();
            return ListView(
              children: [
                if (state.userProfile!.isBodybuildingCoach) ...[
                  AthletesDirectoryBuilder(
                    goToAthleteDetailRoute: goToAthleteDetailRoute,
                  ),
                ],
                BodyBuildingCoachCard(),
                if (state.userProfile!.isBodybuildingCoach) ...[
                  InviteTrainee(),
                  BlocProvider(
                    create: (context) => CoachPlatformStatusCubit(
                      authenticationRepository:
                          RepositoryProvider.of<AuthenticationRepository>(
                            context,
                          ),
                      imageRepository: RepositoryProvider.of<ImageRepository>(
                        context,
                      ),
                    ),
                    child: CoachPlatformCard(),
                  ),
                  CoachFinance(),
                ],
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

class AthletesDirectoryBuilder extends StatelessWidget {
  const AthletesDirectoryBuilder({super.key, this.goToAthleteDetailRoute});
  final VoidCallback? goToAthleteDetailRoute;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCardHeader(
            title: context.l10n.athletesDirectoryBuilderCoachTraineeTitle,
          ),
          BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
            buildWhen: (previous, current) =>
                previous.onReadAthletesUserProfileStatus !=
                current.onReadAthletesUserProfileStatus,
            builder: (context, state) {
              if (state.athletesUserProfile.isEmpty) {
                return Text(
                  context.l10n.athleteListEmptyListlabel,
                  softWrap: true,
                );
              }
              if (state.onReadAthletesUserProfileStatus.isSuccess) {
                return ListView.separated(
                  itemCount: state.athletesUserProfile.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // final enrollment = state.coachEnrollments[index];

                    final coachAthleteUserProfile =
                        state.athletesUserProfile[index];
                    final athleteImagesFileData = state.athletesImages.where(
                      (image) => image.userId == coachAthleteUserProfile.id,
                    );
                    FileDetail? athleteProfileImageDetail;
                    if (athleteImagesFileData.isNotEmpty &&
                        athleteImagesFileData.any(
                          (FileData e) => e.tag == GallaryTag.profileImage,
                        )) {
                      final athleteProfileImageFileData = athleteImagesFileData
                          .singleWhere(
                            (fileData) =>
                                fileData.tag == GallaryTag.profileImage,
                          );
                      athleteProfileImageDetail = state.athletesImagesDetail
                          .singleWhere(
                            (imageDetail) =>
                                imageDetail.fileName ==
                                athleteProfileImageFileData.fileName,
                          );
                    }

                    return ListTile(
                      title: Text(coachAthleteUserProfile.fullName ?? 'N/A'),
                      subtitle: Text(
                        coachAthleteUserProfile.phoneNumber ??
                            coachAthleteUserProfile.email ??
                            'N/A',
                      ),
                      leading: CircleAvatar(
                        radius: context.sizeExtenstion.extraLarge,
                        backgroundImage: athleteProfileImageDetail != null
                            ? MemoryImage(athleteProfileImageDetail.bytes)
                            : null,
                        child: athleteProfileImageDetail == null
                            ? Icon(
                                Icons.person,
                                size: context.sizeExtenstion.extraLarge,
                              )
                            : null,
                      ),
                      onTap: () {
                        goToAthleteDetailRoute?.call();
                        context
                            .read<AthelteDirectoryCubit>()
                            .updateSelectedAthlete(coachAthleteUserProfile);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: context.sizeExtenstion.small);
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
