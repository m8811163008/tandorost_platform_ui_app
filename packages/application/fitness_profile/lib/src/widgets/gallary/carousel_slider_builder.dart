import 'dart:typed_data';

import 'package:domain_model/domain_model.dart';
import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:fitness_profile_app/src/widgets/gallary/gallary.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class CarouselSliderBuilder extends StatelessWidget {
  const CarouselSliderBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FitnessProfileCubit, FitnessProfileState>(
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
    return BlocBuilder<FitnessProfileCubit, FitnessProfileState>(
      buildWhen: (previous, current) =>
          previous.archiveImagesId != current.archiveImagesId,
      builder: (context, state) {
        final isShowRadio = state.archiveImagesId.isNotEmpty;
        final isSelected = state.archiveImagesId.contains(imageId);

        return GestureDetector(
          onTap: () {
            final isSelectedImageEmpty = context
                .read<FitnessProfileCubit>()
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
    context.read<FitnessProfileCubit>().insertOrDeleteFromArchiveImageList(
      imageId,
    );
  }
}
