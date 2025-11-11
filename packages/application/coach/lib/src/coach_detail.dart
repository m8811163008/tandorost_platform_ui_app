import 'dart:typed_data';

import 'package:coach/src/cubit/coach_cubit.dart';
import 'package:coach/src/cubit/payment_cubit.dart';
import 'package:coach/src/payment_listeners.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class CoachDetailRoute extends StatelessWidget {
  const CoachDetailRoute({
    super.key,
    this.onBottomNavigationChanged,
    required this.bottomNavigationIndex,
    this.onDrawerNavigationChanged,
    required this.drawerNavigationIndex,
    this.onTapProgram,
  });
  final ValueChanged<int>? onBottomNavigationChanged;
  final int bottomNavigationIndex;
  final ValueChanged<int>? onDrawerNavigationChanged;
  final int drawerNavigationIndex;
  final VoidCallback? onTapProgram;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.appRoutesName(RoutesNames.coachDetailRoute.name),
        ),
      ),
      body: CoachDetailListener(onTapProgram: onTapProgram),

      bottomNavigationBar: BottomNavigationBar(
        onTap: onBottomNavigationChanged,
        currentIndex: bottomNavigationIndex,
        items: AppNavigation.bottomNavigationItems(context),
      ),
    );
  }
}

class CoachDetailListener extends StatelessWidget {
  const CoachDetailListener({super.key, this.onTapProgram});
  final VoidCallback? onTapProgram;

  @override
  Widget build(BuildContext context) {
    return PaymentBlocListeners(
      child: BlocListener<CoachCubit, CoachState>(
        listenWhen: (previous, current) =>
            previous.readSelectedCoachProgramsStatus !=
            current.readSelectedCoachProgramsStatus,
        listener: (context, state) {
          if (state.readSelectedCoachProgramsStatus.isConnectionError) {
            final content = context.l10n.networkError;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(content)));
          } else if (state
              .readSelectedCoachProgramsStatus
              .isInternetConnectionError) {
            final content = context.l10n.internetConnectionError;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(content)));
          }
        },
        child: CoachDetailBuilder(onTapProgram: onTapProgram),
      ),
    );
  }
}

class CoachDetailBuilder extends StatelessWidget {
  const CoachDetailBuilder({super.key, this.onTapProgram});
  final VoidCallback? onTapProgram;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachCubit, CoachState>(
      buildWhen: (previous, current) =>
          previous.readSelectedCoachProgramsStatus !=
              current.readSelectedCoachProgramsStatus ||
          previous.coachesImagesData != current.coachesImagesData,
      builder: (context, state) {
        final coachUserProfile = state.selectedCoacheUserProfile;
        final coachImagesFileDataAchievement = state.coachesImagesData.where(
          (image) =>
              image.userId == coachUserProfile!.id &&
              image.tag == GallaryTag.achievement,
        );
        final coachImagesFileDataCertificate = state.coachesImagesData.where(
          (image) =>
              image.userId == coachUserProfile!.id &&
              image.tag == GallaryTag.certificate,
        );

        return SingleChildScrollView(
          child: Column(
            children: [
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoachProfileSection(),

                    if (coachImagesFileDataCertificate.isNotEmpty) ...[
                      Text(
                        context.l10n.profileCertificatesLabel,
                        style: context.textTheme.titleSmall,
                      ),
                      CoachImageGallarySection(tag: GallaryTag.certificate),
                    ],
                    if (coachImagesFileDataAchievement.isNotEmpty) ...[
                      Text(
                        context.l10n.profileAchievementsLabel,
                        style: context.textTheme.titleSmall,
                      ),
                      CoachImageGallarySection(tag: GallaryTag.achievement),
                    ],
                  ],
                ),
              ),
              AppCard(child: CoachProgramsSection(onTapProgram: onTapProgram)),
            ],
          ),
        );
      },
    );
  }
}

class CoachProfileSection extends StatelessWidget {
  const CoachProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.small);
    return BlocBuilder<CoachCubit, CoachState>(
      buildWhen: (previous, current) =>
          previous.readCoachesProfileStatus !=
              current.readCoachesProfileStatus ||
          previous.readCoachesUserProfileStatus !=
              current.readCoachesUserProfileStatus,
      builder: (context, state) {
        final coachUserProfile = state.selectedCoacheUserProfile;
        final coachImagesFileData = state.coachesImagesData.where(
          (image) => image.userId == coachUserProfile!.id,
        );
        FileDetail? coachProfileImageDetail;
        if (coachImagesFileData.isNotEmpty &&
            coachImagesFileData.any(
              (FileData e) => e.tag == GallaryTag.profileImage,
            )) {
          final coachProfileImageFileData = coachImagesFileData.singleWhere(
            (fileData) => fileData.tag == GallaryTag.profileImage,
          );
          coachProfileImageDetail = state.coachesImagesFilesDetail.singleWhere(
            (imageDetail) =>
                imageDetail.fileName == coachProfileImageFileData.fileName,
          );
        }

        final isVerified = state.coachesImagesData
            .where(
              (image) =>
                  image.userId == coachUserProfile!.id &&
                  image.tag == GallaryTag.verification,
            )
            .isNotEmpty;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
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
                  if (isVerified)
                    GestureDetector(
                      onTap: () {
                        final content = context.l10n.verifyByAiSnackbar;
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(content)));
                      },
                      child: Icon(
                        Icons.verified,
                        color: context.themeData.colorScheme.primary,
                      ),
                    ),
                ],
              ),
            ),
            gap,
            UserInfoRichText(
              label: context.l10n.personalInfoNameLabel,
              value: state.selectedCoacheUserProfile!.fullName ?? 'N/A',
            ),
            gap,
            UserInfoRichText(
              label: context.l10n.coachSettingBiographyLabel,
              value: state.selectedCoachProfile!.biography,
            ),
            gap,
            UserInfoRichText(
              label: context.l10n.coachDetailLanguageLabel,
              value: state.selectedCoacheUserProfile!.language.name,
            ),
          ],
        );
      },
    );
  }
}

class UserInfoRichText extends StatelessWidget {
  const UserInfoRichText({super.key, this.label = '', this.value = ''});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(text: '$label : ', style: context.textTheme.titleSmall),
          TextSpan(text: value, style: context.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class CoachImageGallarySection extends StatelessWidget {
  const CoachImageGallarySection({super.key, required this.tag});

  final GallaryTag tag;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachCubit, CoachState>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        final coachUserProfile = state.selectedCoacheUserProfile;
        final coachImagesFileData = state.coachesImagesData.where(
          (image) => image.userId == coachUserProfile!.id && image.tag == tag,
        );
        List<FileDetail> coachImagesDetail = [];
        if (coachImagesFileData.isNotEmpty) {
          for (final coachImageFileData in coachImagesFileData) {
            coachImagesDetail = state.coachesImagesFilesDetail
                .where((image) => image.fileName == coachImageFileData.fileName)
                .toList();
          }
        }
        return SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          child: ListView.separated(
            itemCount: coachImagesDetail.length,
            primary: false,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final imageDetail = coachImagesDetail[index];
              final imageData = state.coachesImagesData.singleWhere(
                (e) => e.fileName == imageDetail.fileName,
              );
              return CoachImagePlaceholder(
                bytes: imageDetail.bytes,
                description: imageData.description,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: context.sizeExtenstion.small);
            },
          ),
        );
      },
    );
  }
}

class CoachProgramsSection extends StatelessWidget {
  const CoachProgramsSection({super.key, this.onTapProgram});
  final VoidCallback? onTapProgram;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachCubit, CoachState>(
      buildWhen: (previous, current) =>
          previous.readSelectedCoachPrograms !=
          current.readSelectedCoachPrograms,
      builder: (context, state) {
        if (state.readSelectedCoachPrograms == null ||
            state.readSelectedCoachPrograms!.isEmpty) {
          return SizedBox(
            width: double.infinity,
            child: Text(context.l10n.emptyList),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.profileCoachProfileCoachProgramCardTitle,
              style: context.textTheme.titleSmall,
            ),
            SizedBox(height: context.sizeExtenstion.medium),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: ListView.separated(
                primary: false,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProgramCard(
                    program: state.readSelectedCoachPrograms![index],
                    onTapProgram: onTapProgram,
                  );
                },
                separatorBuilder: (context, _) =>
                    SizedBox(width: context.sizeExtenstion.medium),
                itemCount: state.readSelectedCoachPrograms!.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProgramCard extends StatelessWidget {
  const ProgramCard({super.key, required this.program, this.onTapProgram});
  final CoachProgram program;
  final VoidCallback? onTapProgram;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.sizeExtenstion.small),
        border: BoxBorder.all(width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.sizeExtenstion.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProgramCardRichTextRow(
              label: context.l10n.profileCoachProfileCoachProgramTitleLabel,
              value: program.title,
            ),
            ProgramCardRichTextRow(
              label:
                  context.l10n.profileCoachProfileCoachProgramDescriptionLabel,
              value: program.description,
            ),
            ProgramCardRichTextRow(
              label:
                  context.l10n.profileCoachProfileCoachProgramDurationWeekLabel,
              value: program.durationWeeks.toString(),
            ),
            ProgramCardRichTextRow(
              label: context.l10n.profileCoachProfileCoachProgramPriceLabel,
              // add 50% to price
              value:
                  '${(program.price.price * 10000 * 2).toStringAsFixed(0)} ${program.currency.name}',
            ),
            ProgramCardRichTextRow(
              label: context.l10n.profileCoachProfileCoachProgramFeatureLabel,
              value: program.features
                  .map(
                    (feature) => context.l10n
                        .profileCoachProfileCoachProgramFeatureValue(
                          feature.name,
                        ),
                  )
                  .join('\n'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                context.read<PaymentCubit>().onChangeSelectedprogram(program);
                onTapProgram?.call();
              },
              child: Text(
                context.l10n.profileCoachProfileCoachProgramElevatedButoonTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgramCardRichTextRow extends StatelessWidget {
  const ProgramCardRichTextRow({
    super.key,
    required this.label,
    this.value = '',
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: '$label : ', style: context.textTheme.labelMedium),
          TextSpan(text: value, style: context.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class CoachImagePlaceholder extends StatelessWidget {
  const CoachImagePlaceholder({super.key, this.bytes, this.description});

  final Uint8List? bytes;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.sizeExtenstion.small),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3.5,
        width: MediaQuery.of(context).size.height / 6 * 1.6,
        child: AppRoundedRectangleBorder(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(context.sizeExtenstion.small),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: context.sizeExtenstion.small),
                    child: CoachImageGestureDetector(
                      child: Center(child: Image.memory(bytes!)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.sizeExtenstion.small,
                  ),
                  child: Text(
                    description ?? '',
                    style: context.textTheme.labelSmall,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CoachImageGestureDetector extends StatelessWidget {
  const CoachImageGestureDetector({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showImageFullscreenRoute(context);
      },

      child: child,
    );
  }

  void showImageFullscreenRoute(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(),
          body: Center(child: child),
        ),
      ),
    );
  }
}
