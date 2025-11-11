import 'dart:collection';
import 'dart:typed_data';

import 'package:coach/coach.dart';
import 'package:coach/src/add_image_button.dart';
import 'package:coach/src/add_new_image.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class TraineeFormRoute extends StatelessWidget {
  const TraineeFormRoute({
    super.key,
    // this.onBottomNavigationChanged,
    // required this.bottomNavigationIndex,
    // this.onDrawerNavigationChanged,
    // required this.drawerNavigationIndex,
  });
  // final ValueChanged<int>? onBottomNavigationChanged;
  // final int bottomNavigationIndex;
  // final ValueChanged<int>? onDrawerNavigationChanged;
  // final int drawerNavigationIndex;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(context.l10n.appRoutesName(RoutesNames.traineeForm.name)),
        actions: [ArchiveImagesButton()],
      ),
      body: TraineeFormListener(),
      // drawer: NavigationDrawer(
      //   onDestinationSelected: onDrawerNavigationChanged,
      //   selectedIndex: drawerNavigationIndex,
      //   children: AppNavigation.getDrawerChildren(context),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: onBottomNavigationChanged,
      //   currentIndex: bottomNavigationIndex,
      //   items: AppNavigation.bottomNavigationItems(context),
      // ),
    );
  }
}

class TraineeFormListener extends StatelessWidget {
  const TraineeFormListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CoachCubit, CoachState>(
          listenWhen: (previous, current) =>
              previous.upsertingTraineeHistoryStatus !=
              current.upsertingTraineeHistoryStatus,
          listener: (context, state) {
            if (state.upsertingTraineeHistoryStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .upsertingTraineeHistoryStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.upsertingTraineeHistoryStatus.isSuccess) {
              final historyId = context
                  .read<CoachCubit>()
                  .state
                  .traineeHistory!
                  .id!;
              context.read<PaymentCubit>().onAddEnrollment(historyId);
            }
          },
        ),
        BlocListener<PaymentCubit, PaymentState>(
          listenWhen: (previous, current) =>
              previous.onUpsertingProgramEnrollmentStatus !=
              current.onUpsertingProgramEnrollmentStatus,
          listener: (context, state) {
            if (state.onUpsertingProgramEnrollmentStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .onUpsertingProgramEnrollmentStatus
                .isInternetConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onUpsertingProgramEnrollmentStatus.isSuccess) {
              Navigator.of(context).pop();
              final content = context.l10n.bazzarSuccessfulPayment;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),
      ],
      child: TraineeForm(),
    );
  }
}

class TraineeForm extends StatefulWidget {
  const TraineeForm({super.key});

  @override
  State<TraineeForm> createState() => _TraineeFormState();
}

class _TraineeFormState extends State<TraineeForm> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CoachCubit>();
    final gap = SizedBox(height: context.sizeExtenstion.medium);

    return AppCard(
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegullarTextField(
                label: context.l10n.traineeHistoryFormIllnessHitoryLabel,
                hintText: context.l10n.traineeHistoryFormIllnessHitoryHint,
                initalValue: cubit.state.traineeHistory!.illness,
                onChange: (value) {
                  final traineeHistory = cubit.state.traineeHistory;
                  cubit.onChangeTraineeHistory(
                    traineeHistory!.copyWith(illness: value),
                  );
                },
              ),
              gap,
              RegullarTextField(
                label: context.l10n.traineeHistoryFormInguryHitoryLabel,
                hintText: context.l10n.traineeHistoryFormInguryHitoryHint,
                initalValue: cubit.state.traineeHistory!.inguries,
                onChange: (value) {
                  final traineeHistory = cubit.state.traineeHistory;
                  cubit.onChangeTraineeHistory(
                    traineeHistory!.copyWith(inguries: value),
                  );
                },
              ),
              gap,
              RegullarTextField(
                label: context.l10n.traineeHistoryFormDisabilitiesHitoryLabel,
                hintText: context.l10n.traineeHistoryFormDisabilitiesHitoryHint,
                initalValue: cubit.state.traineeHistory!.disabilities,
                onChange: (value) {
                  final traineeHistory = cubit.state.traineeHistory;
                  cubit.onChangeTraineeHistory(
                    traineeHistory!.copyWith(disabilities: value),
                  );
                },
              ),
              gap,
              RegullarTextField(
                label: context.l10n.traineeHistoryFormSupplementLabel,
                hintText: context.l10n.traineeHistoryFormSupplementHint,
                initalValue: cubit.state.traineeHistory!.supplements,
                onChange: (value) {
                  final traineeHistory = cubit.state.traineeHistory;
                  cubit.onChangeTraineeHistory(
                    traineeHistory!.copyWith(supplements: () => value),
                  );
                },
              ),
              gap,

              Text(context.l10n.traineeHistoryFormGoalsLabel),

              Text(
                context.l10n.traineeHistoryFormGoalsHint,
                style: context.textTheme.labelSmall,
              ),
              BlocBuilder<CoachCubit, CoachState>(
                buildWhen: (previous, current) =>
                    previous.traineeHistory?.excersiceGoal !=
                    current.traineeHistory?.excersiceGoal,
                builder: (context, state) {
                  return Wrap(
                    children: ExcersiceGoal.values
                        .map(
                          (e) => GoalsChekbox(
                            isChecked: state.traineeHistory!.excersiceGoal
                                .contains(e),
                            label: context.l10n.traineeHistoryFormGoalsValue(
                              e.name,
                            ),
                            onTap: () {
                              final traineeHistory = cubit.state.traineeHistory;
                              final isValueExist = state
                                  .traineeHistory!
                                  .excersiceGoal
                                  .contains(e);
                              final goalsSet =
                                  LinkedHashSet<ExcersiceGoal>.from(
                                    traineeHistory!.excersiceGoal,
                                  );
                              isValueExist
                                  ? goalsSet.remove(e)
                                  : goalsSet.add(e);
                              cubit.onChangeTraineeHistory(
                                traineeHistory.copyWith(
                                  excersiceGoal: goalsSet,
                                ),
                              );
                            },
                            order:
                                state.traineeHistory!.excersiceGoal
                                    .toList()
                                    .contains(e)
                                ? state.traineeHistory!.excersiceGoal
                                          .toList()
                                          .indexOf(e) +
                                      1
                                : null,
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              gap,
              RegullarTextField(
                label: context.l10n.traineeHistoryDailyActivityLabel,
                hintText: context.l10n.traineeHistoryDailyActivityHint,
                initalValue: cubit.state.traineeHistory!.dailyActivityDesc,
                onChange: (value) {
                  final traineeHistory = cubit.state.traineeHistory;
                  cubit.onChangeTraineeHistory(
                    traineeHistory!.copyWith(dailyActivityDesc: () => value),
                  );
                },
              ),
              gap,
              RegullarTextField(
                label: context.l10n.traineeHistorySportTrainingHistoryLabel,
                hintText: context.l10n.traineeHistorySportTrainingHistoryHint,
                initalValue: cubit.state.traineeHistory!.sportTrainingHistory,
                onChange: (value) {
                  final traineeHistory = cubit.state.traineeHistory;
                  cubit.onChangeTraineeHistory(
                    traineeHistory!.copyWith(sportTrainingHistory: value),
                  );
                },
              ),
              gap,
              DropDownField<int>(
                label: context
                    .l10n
                    .traineeHistoryCurrentPracticeFrequencyPerWeekLabel,
                value:
                    cubit.state.traineeHistory!.currentPracticeFrequencyPerWeek,
                items: List.generate(6, (i) => i)
                    .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                    .toList(),
                onChange: (value) {
                  if (value != null) {
                    final traineeHistory = cubit.state.traineeHistory;
                    cubit.onChangeTraineeHistory(
                      traineeHistory!.copyWith(
                        currentPracticeFrequencyPerWeek: value,
                      ),
                    );

                    setState(() {});
                  }
                },
                errorText: null,
              ),

              // NumberTextField(
              //   label: context
              //       .l10n
              //       .traineeHistoryCurrentPracticeFrequencyPerWeekLabel,
              //   hintText: context
              //       .l10n
              //       .traineeHistoryCurrentPracticeFrequencyPerWeekHint,
              //   initialValue:
              //       cubit
              //               .state
              //               .traineeHistory!
              //               .currentPracticeFrequencyPerWeek !=
              //           0
              //       ? cubit
              //             .state
              //             .traineeHistory!
              //             .currentPracticeFrequencyPerWeek
              //             .toString()
              //       : null,
              //   onChange: (value) {
              //     final traineeHistory = cubit.state.traineeHistory;
              //     cubit.onChangeTraineeHistory(
              //       traineeHistory!.copyWith(
              //         currentPracticeFrequencyPerWeek: value.isEmpty
              //             ? 0
              //             : int.parse(value),
              //       ),
              //     );
              //   },
              // ),
              Text(context.l10n.traineeHistoryExerciseEquipmentLabel),

              BlocBuilder<CoachCubit, CoachState>(
                buildWhen: (previous, current) =>
                    previous.traineeHistory?.exerciseEquipment !=
                    current.traineeHistory?.exerciseEquipment,
                builder: (context, state) {
                  return Wrap(
                    children: ExerciseEquipment.values
                        .map(
                          (e) => GoalsChekbox(
                            isChecked: state.traineeHistory!.exerciseEquipment
                                .contains(e),
                            label: context.l10n
                                .traineeHistoryExerciseEquipmentValue(e.name),
                            onTap: () {
                              final traineeHistory = cubit.state.traineeHistory;
                              final isValueExist = state
                                  .traineeHistory!
                                  .exerciseEquipment
                                  .contains(e);
                              final exerciseEquipmentSet =
                                  LinkedHashSet<ExerciseEquipment>.from(
                                    traineeHistory!.exerciseEquipment,
                                  );
                              isValueExist
                                  ? exerciseEquipmentSet.remove(e)
                                  : exerciseEquipmentSet.add(e);
                              cubit.onChangeTraineeHistory(
                                traineeHistory.copyWith(
                                  exerciseEquipment: exerciseEquipmentSet,
                                ),
                              );
                            },
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              //TODO box check image gallary and complete trainee form
              gap,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.l10n.fitnessProfileImageGallaryTitle),
                  CarouselSliderBuilder(),
                ],
              ),
              gap,
              TextButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AppDialog(
                        title: context.l10n.traineeHistoryFormPolicyButtonTitle,

                        contents: [
                          Text(context.l10n.traineeHistoryFormPolicy),
                          gap,
                          Text(context.l10n.traineeHistoryFormPolicy2),
                          gap,
                          Text(context.l10n.traineeHistoryFormPolicy3),
                          gap,
                          Text(context.l10n.traineeHistoryFormPolicy4),

                          Divider(height: context.sizeExtenstion.medium),

                          Text(context.l10n.traineeHistoryFormSupport),
                        ],
                      );
                    },
                  );
                },
                child: Text(context.l10n.traineeHistoryFormPolicyButtonTitle),
              ),
              gap,
              BlocBuilder<CoachCubit, CoachState>(
                buildWhen: (previous, current) =>
                    previous.upsertingTraineeHistoryStatus !=
                    current.upsertingTraineeHistoryStatus,
                builder: (context, state) {
                  final isloading =
                      state.upsertingTraineeHistoryStatus.isLoading;

                  return !isloading
                      ? AppOutLineButton(
                          label: context.l10n.update,
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              context
                                  .read<PaymentCubit>()
                                  .onCafeBazzarSubscribe();
                            }
                          },
                        )
                      : AppOutLineButton.loading(label: context.l10n.update);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoalsChekbox extends StatelessWidget {
  const GoalsChekbox({
    super.key,
    required this.isChecked,
    required this.label,
    this.onTap,
    this.order,
  });
  final bool isChecked;
  final VoidCallback? onTap;
  final int? order;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (_) {
            onTap?.call();
          },
        ),
        GestureDetector(onTap: onTap, child: Text('${order ?? ''} $label')),
      ],
    );
  }
}

class ArchiveImagesButton extends StatelessWidget {
  const ArchiveImagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CoachCubit>();
    return BlocConsumer<CoachCubit, CoachState>(
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

class CarouselSliderBuilder extends StatelessWidget {
  const CarouselSliderBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoachCubit, CoachState>(
      listenWhen: (previous, current) =>
          previous.readUserImageGallaryStatus !=
          current.readUserImageGallaryStatus,
      listener: (context, state) {
        if (state.readUserImageGallaryStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.readUserImageGallaryStatus.isInternetConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }
      },
      buildWhen: (previous, current) =>
          previous.readUserImageGallaryStatus !=
              current.readUserImageGallaryStatus ||
          previous.addUserImageStatus != current.addUserImageStatus ||
          previous.filesData != current.filesData,
      builder: (context, state) {
        // TODO move _parseFileDatailByDate to cubit
        final parsedImagesMap = _parseFileDatailByDate(state.filesData);

        return SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            primary: false,
            shrinkWrap: true,
            itemCount: parsedImagesMap.keys.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    // to show duplicates values
                    itemCount: PhotoSide.values.length + 1,
                    itemBuilder: (context, photoSideIndex) {
                      if (photoSideIndex == 0) {
                        final showDate = DateTime.now().formattedDate(context);

                        return Center(child: Text(showDate));
                      } else {
                        return ImagePlaceholder(
                          side: PhotoSide.values[photoSideIndex - 1],
                          uploadDate: DateTime.now().toUtc(),
                        );
                      }
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 8);
                    },
                  ),
                );
              } else {
                final dateKey = parsedImagesMap.keys.toList()[index - 1];
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
                        if (imagesBySidesList[photoSideIndex - 1].value ==
                            null) {
                          return ImagePlaceholder(
                            side: imagesBySidesList[photoSideIndex - 1].key,
                            uploadDate: dateKey,
                          );
                        } else {
                          final detail = state.filesDetail.where(
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
              }
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
                        if (side == PhotoSide.free)
                          AddNewImageSelfiePlaceholder(),
                        AddImageButton(side: side, uploadDate: uploadDate),
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
    return BlocBuilder<CoachCubit, CoachState>(
      buildWhen: (previous, current) =>
          previous.archiveImagesId != current.archiveImagesId,
      builder: (context, state) {
        final isShowRadio = state.archiveImagesId.isNotEmpty;
        final isSelected = state.archiveImagesId.contains(imageId);
        return GestureDetector(
          onTap: () {
            final isSelectedImageEmpty = context
                .read<CoachCubit>()
                .state
                .archiveImagesId
                .isEmpty;
            if (isSelectedImageEmpty) {
              showImageFullscreenRoute(context);
            } else {
              onInsertOrDeleteImage(context);
            }
          },
          onLongPress: () {
            onInsertOrDeleteImage(context);
          },

          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              child,
              if (isShowRadio)
                Checkbox(
                  value: isSelected,
                  onChanged: (_) {
                    onInsertOrDeleteImage(context);
                  },
                ),
            ],
          ),
        );
      },
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

  void onInsertOrDeleteImage(BuildContext context) {
    context.read<CoachCubit>().insertOrDeleteFromArchiveImageList(imageId);
  }
}
