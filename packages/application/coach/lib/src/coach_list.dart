import 'package:coach/src/cubit/coach_cubit.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class CoachesListRoute extends StatelessWidget {
  const CoachesListRoute({
    super.key,
    this.onBottomNavigationChanged,
    required this.bottomNavigationIndex,
    this.onDrawerNavigationChanged,
    required this.drawerNavigationIndex,
    this.goToCoachDetailRoute,
  });
  final ValueChanged<int>? onBottomNavigationChanged;
  final int bottomNavigationIndex;
  final ValueChanged<int>? onDrawerNavigationChanged;
  final int drawerNavigationIndex;
  final VoidCallback? goToCoachDetailRoute;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.appRoutesName(RoutesNames.coachesListRoute.name),
        ),
      ),
      body: CoachListListener(goToCoachDetailRoute: goToCoachDetailRoute),
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

class CoachListListener extends StatelessWidget {
  const CoachListListener({super.key, this.goToCoachDetailRoute});
  final VoidCallback? goToCoachDetailRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CoachCubit, CoachState>(
          listenWhen: (previous, current) =>
              previous.readCoachesProfileStatus !=
              current.readCoachesProfileStatus,
          listener: (context, state) {
            if (state.readCoachesProfileStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .readCoachesProfileStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),
        BlocListener<CoachCubit, CoachState>(
          listenWhen: (previous, current) =>
              previous.readCoachesUserProfileStatus !=
              current.readCoachesUserProfileStatus,
          listener: (context, state) {
            if (state.readCoachesUserProfileStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .readCoachesUserProfileStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),
        BlocListener<CoachCubit, CoachState>(
          listenWhen: (previous, current) =>
              previous.readCoachesUserProfileStatus !=
                  current.readCoachesUserProfileStatus ||
              previous.readCoachesProfileStatus !=
                  current.readCoachesProfileStatus,
          listener: (context, state) {
            if (state.readCoachesUserProfileStatus.isSuccess &&
                state.readCoachesProfileStatus.isSuccess) {
              context.read<CoachCubit>().readCoachImages();
            }
          },
        ),
      ],
      child: CoachListBuilder(goToCoachDetailRoute: goToCoachDetailRoute),
    );
  }
}

class CoachListBuilder extends StatelessWidget {
  const CoachListBuilder({super.key, this.goToCoachDetailRoute});
  final VoidCallback? goToCoachDetailRoute;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachCubit, CoachState>(
      buildWhen: (previous, current) =>
          previous.readCoachesUserProfileStatus !=
              current.readCoachesUserProfileStatus ||
          previous.readCoachesProfileStatus !=
              current.readCoachesProfileStatus ||
          previous.readCoachImagesDataStatus !=
              current.readCoachImagesDataStatus,
      builder: (context, state) {
        final activeCoachProfiles = state.coachesProfile
            .where(
              (coach) =>
                  coach.isActive &&
                  state.coachesUserProfile
                      .map((e) => e.id)
                      .contains(coach.userId),
            )
            .toList();
        if (activeCoachProfiles.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(context.sizeExtenstion.medium),
            child: Text(context.l10n.coachListEmptyListlabel, softWrap: true),
          );
        }
        if (state.readCoachesUserProfileStatus.isSuccess &&
            state.readCoachesProfileStatus.isSuccess &&
            state.readCoachImagesDataStatus.isSuccess) {
          return Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: context.sizeExtenstion.medium,
              vertical: context.sizeExtenstion.small,
            ),
            child: ListView.separated(
              itemCount: activeCoachProfiles.length,
              itemBuilder: (context, index) {
                final coach = activeCoachProfiles[index];
                final coachUserProfile = state.coachesUserProfile[index];
                final coachImagesFileData = state.coachesImagesData.where(
                  (image) => image.userId == coachUserProfile.id,
                );
                FileDetail? coachProfileImageDetail;
                if (coachImagesFileData.isNotEmpty &&
                    coachImagesFileData.any(
                      (FileData e) => e.tag == GallaryTag.profileImage,
                    )) {
                  final coachProfileImageFileData = coachImagesFileData
                      .singleWhere(
                        (fileData) => fileData.tag == GallaryTag.profileImage,
                      );
                  coachProfileImageDetail = state.coachesImagesFilesDetail
                      .singleWhere(
                        (imageDetail) =>
                            imageDetail.fileName ==
                            coachProfileImageFileData.fileName,
                      );
                }

                return ListTile(
                  title: Text(
                    '${context.l10n.personalInfoNameLabel}: ${coachUserProfile.fullName ?? 'N/A'}',
                  ),
                  subtitle: Text(
                    coach.biography,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(
                    radius: context.sizeExtenstion.extraLarge,
                    backgroundImage: coachProfileImageDetail != null
                        ? MemoryImage(coachProfileImageDetail.bytes)
                        : null,
                    child: coachProfileImageDetail == null
                        ? Icon(
                            Icons.person,
                            size: context.sizeExtenstion.extraLarge,
                          )
                        : null,
                  ),
                  onTap: () {
                    goToCoachDetailRoute?.call();
                    context.read<CoachCubit>().updateSelectedCoach(
                      selectedCoacheUserProfile: coachUserProfile,
                      selectedCoachProfile: coach,
                    );
                    // read readCoachProgramsById
                    context.read<CoachCubit>().readCoachProgramsById(
                      coach.userId,
                    );

                    // read
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
