import 'package:athletes_directory/src/cubit/athelte_directory_cubit.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
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
              previous.onReadCoachProfileStatus !=
              current.onReadCoachProfileStatus,
          listener: (context, state) {
            if (state.onReadCoachProfileStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .onReadCoachProfileStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onReadCoachProfileStatus.isSuccess) {
              context.read<AthelteDirectoryCubit>().onReadCoachEnrollments();
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
      ],
      child: AthletesDirectoryBuilder(
        goToAthleteDetailRoute: goToAthleteDetailRoute,
      ),
    );
  }
}

class AthletesDirectoryBuilder extends StatelessWidget {
  const AthletesDirectoryBuilder({super.key, this.goToAthleteDetailRoute});
  final VoidCallback? goToAthleteDetailRoute;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.onReadAthletesUserProfileStatus !=
          current.onReadAthletesUserProfileStatus,
      builder: (context, state) {
        if (state.athletesUserProfile.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(context.sizeExtenstion.medium),
            child: Text(context.l10n.athleteListEmptyListlabel, softWrap: true),
          );
        }
        if (state.onReadAthletesUserProfileStatus.isSuccess) {
          return Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: context.sizeExtenstion.medium,
              vertical: context.sizeExtenstion.small,
            ),
            child: ListView.separated(
              itemCount: state.athletesUserProfile.length,
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
                        (fileData) => fileData.tag == GallaryTag.profileImage,
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
                  subtitle: Text(coachAthleteUserProfile.phoneNumber ?? 'N/A'),
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
                    context.read<AthelteDirectoryCubit>().updateSelectedAthlete(
                      coachAthleteUserProfile,
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: context.sizeExtenstion.small);
              },
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
