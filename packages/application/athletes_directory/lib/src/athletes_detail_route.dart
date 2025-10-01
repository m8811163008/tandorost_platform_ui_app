import 'dart:typed_data';

import 'package:athletes_directory/src/athlete_detail_history.dart';
import 'package:athletes_directory/src/chart/chart.dart';
import 'package:athletes_directory/src/cubit/athelte_directory_cubit.dart';
import 'package:athletes_directory/src/fitness_insight/fitness_info_consumer.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AthletesDetailRoute extends StatelessWidget {
  const AthletesDetailRoute({
    super.key,
    this.onBottomNavigationChanged,
    required this.bottomNavigationIndex,
    this.onDrawerNavigationChanged,
    required this.drawerNavigationIndex,
    // this.goToAthleteDetailRoute,
  });
  final ValueChanged<int>? onBottomNavigationChanged;
  final int bottomNavigationIndex;
  final ValueChanged<int>? onDrawerNavigationChanged;
  final int drawerNavigationIndex;
  // final VoidCallback? goToAthleteDetailRoute;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.appRoutesName(RoutesNames.athletesDirectoryRoute.name),
        ),
      ),
      body: AthletesDetailListener(
        // goToAthleteDetailRoute: goToAthleteDetailRoute,
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

class AthletesDetailListener extends StatefulWidget {
  const AthletesDetailListener({
    super.key,
    // this.goToAthleteDetailRoute
  });

  @override
  State<AthletesDetailListener> createState() => _AthletesDetailListenerState();
}

class _AthletesDetailListenerState extends State<AthletesDetailListener> {
  @override
  void initState() {
    context.read<AthelteDirectoryCubit>().readAthleteFitnessData();
    context.read<AthelteDirectoryCubit>().readAthletePhysicalProfile();
    context.read<AthelteDirectoryCubit>().onReadAtheleteTrainingHistory();
    context.read<AthelteDirectoryCubit>().onReadAthleteEnrollments();
    super.initState();
  }

  // final VoidCallback? goToAthleteDetailRoute;
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
              context.read<AthelteDirectoryCubit>().onReadWorkoutProgram();
            }
          },
        ),
        BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
          listenWhen: (previous, current) =>
              previous.onReadAthleteEnrollmentsStatus !=
              current.onReadAthleteEnrollmentsStatus,
          listener: (context, state) {
            if (state.onReadAthleteEnrollmentsStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .onReadAthleteEnrollmentsStatus
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
              previous.readFitnessDataStatus != current.readFitnessDataStatus,
          listener: (context, state) {
            if (state.readFitnessDataStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.readFitnessDataStatus.isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.readFitnessDataStatus.isSuccess) {
              //read chart
            }
          },
        ),
        BlocListener<AthelteDirectoryCubit, AthelteDirectoryState>(
          listenWhen: (previous, current) =>
              previous.onReadAtheleteTrainingHistoryStatus !=
              current.onReadAtheleteTrainingHistoryStatus,
          listener: (context, state) {
            if (state.onReadAtheleteTrainingHistoryStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .onReadAtheleteTrainingHistoryStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),
      ],
      child: AthletesDetailBuilder(
        // goToAthleteDetailRoute: goToAthleteDetailRoute,
      ),
    );
  }
}

class AthletesDetailBuilder extends StatelessWidget {
  const AthletesDetailBuilder({
    super.key,
    //  this.goToAthleteDetailRoute
  });
  // final VoidCallback? goToAthleteDetailRoute;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSliderBuilder(),
          FitnessInfoConsumer(),
          PhysicalDataChart(),
          AthleteDetailHistory(),
        ],
      ),
    );
  }
}

class CarouselSliderBuilder extends StatelessWidget {
  const CarouselSliderBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.onReadAthletesImagesStatus !=
          current.onReadAthletesImagesStatus,
      builder: (context, state) {
        // TODO move _parseFileDatailByDate to cubit
        final athletesImages = state.athletesImages.where(
          (e) => e.tag == GallaryTag.defaultTag,
        );
        final parsedImagesMap = _parseFileDatailByDate(athletesImages.toList());

        return SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            primary: false,
            shrinkWrap: true,
            itemCount: parsedImagesMap.keys.length,
            itemBuilder: (context, index) {
              final dateKey = parsedImagesMap.keys.toList()[index];
              final imagesData = parsedImagesMap[dateKey]!;
              if (imagesData.isEmpty) return SizedBox();

              Map<PhotoSide, List<FileData>> imagesBySides = {};
              for (final side in PhotoSide.values) {
                imagesBySides[side] = [];
                for (final fileData in imagesData) {
                  final fileNameSide = fileData.fileName.split('_').first;
                  if (fileNameSide == side.name) {
                    imagesBySides[side]!.add(fileData);
                  }
                }
              }

              List<MapEntry<PhotoSide, FileData?>> imagesBySidesList = [];
              for (final imageBySideEntry in imagesBySides.entries) {
                if (imageBySideEntry.value.isEmpty) {
                  imagesBySidesList.add(MapEntry(imageBySideEntry.key, null));
                }
                for (final imageBySideEntryValue in imageBySideEntry.value) {
                  imagesBySidesList.add(
                    MapEntry(imageBySideEntry.key, imageBySideEntryValue),
                  );
                }
              }

              return SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesBySidesList.length + 1,
                  itemBuilder: (context, photoSideIndex) {
                    if (photoSideIndex == 0) {
                      final imageSetDate = dateKey.toLocal().formattedDate(
                        context,
                      );
                      return Center(child: Text(imageSetDate));
                    } else {
                      if (imagesBySidesList[photoSideIndex - 1].value == null) {
                        return ImagePlaceholder(
                          side: imagesBySidesList[photoSideIndex - 1].key,
                          uploadDate: dateKey,
                        );
                      } else {
                        final detail = state.athletesImagesDetail.where(
                          ((fileDetail) =>
                              fileDetail.fileName ==
                              imagesBySidesList[photoSideIndex - 1]
                                  .value!
                                  .fileName),
                        );
                        return ImagePlaceholder(
                          side: imagesBySidesList[photoSideIndex - 1].key,
                          bytes: detail.first.bytes,
                          imageId:
                              imagesBySidesList[photoSideIndex - 1].value!.id,
                        );
                      }
                    }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 8);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  Map<DateTime, List<FileData>> _parseFileDatailByDate(
    List<FileData> fileData,
  ) {
    Map<DateTime, List<FileData>> result = {};
    for (final fileDataElement in fileData) {
      final key = fileDataElement.uploadDate.copyWith(
        hour: 12,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );
      result.putIfAbsent(key, () => []).add(fileDataElement);
    }
    return result;
  }
}

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    super.key,
    required this.side,
    this.bytes,
    this.uploadDate,
    this.imageId,
  });
  final PhotoSide side;
  final Uint8List? bytes;
  final DateTime? uploadDate;
  final String? imageId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: context.sizeExtenstion.medium),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.height / 6 * 1.6,
              child: AppRoundedRectangleBorder(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    context.sizeExtenstion.small,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      if (bytes != null) ...[
                        ImageGestureDetector(
                          imageId: imageId!,
                          child: Center(child: Image.memory(bytes!)),
                        ),
                      ] else ...[
                        Center(
                          child: Text(
                            context.l10n.imageSideDescription(side.name),
                            style: context.textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageGestureDetector extends StatelessWidget {
  const ImageGestureDetector({
    super.key,
    required this.child,
    required this.imageId,
  });
  final Widget child;
  final String imageId;

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
