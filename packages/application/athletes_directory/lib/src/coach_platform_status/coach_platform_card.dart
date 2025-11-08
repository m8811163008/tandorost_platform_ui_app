import 'dart:io';

import 'package:athletes_directory/athletes_directory.dart';
import 'package:athletes_directory/src/coach_platform_status/cubit/coach_platform_status_cubit.dart';
import 'package:athletes_directory/src/coach_platform_status/verification_status_view.dart';
import 'package:camera/camera.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class CoachPlatformCard extends StatelessWidget {
  const CoachPlatformCard({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.medium);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCardHeader(title: 'وضعیت مربی در پلتفرم تندرست'),
          Wrap(
            children: [
              UserInfoRichText(
                label: 'وضعیت نمایش در بین مربیان',

                value: context.l10n.coachesListShowingStatus(
                  context.select(
                    (CoachPlatformStatusCubit cubit) =>
                        cubit.state.showingStatus.name,
                  ),
                ),
              ),
              Icon(
                context.select(
                      (CoachPlatformStatusCubit cubit) =>
                          cubit.state.showingStatus.isShowing,
                    )
                    ? Icons.online_prediction
                    : Icons.tv_off_outlined,
                color:
                    context.select(
                      (CoachPlatformStatusCubit cubit) =>
                          cubit.state.showingStatus.isShowing,
                    )
                    ? context.themeData.colorScheme.secondary
                    : context.themeData.colorScheme.tertiary,
              ),
            ],
          ),
          SizedBox(height: context.sizeExtenstion.medium),
          Text(
            'احراز هویت تیم بدنسازی شما',
            style: context.textTheme.titleSmall,
          ),
          gap,
          CoachVideosSection(gallaryTag: GallaryTag.verification),
        ],
      ),
    );
  }
}

class CoachVideosSection extends StatelessWidget {
  const CoachVideosSection({super.key, required this.gallaryTag});
  final GallaryTag gallaryTag;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoachPlatformStatusCubit, CoachPlatformStatusState>(
      listenWhen: (previous, current) =>
          previous.onReadVerifyVideos != current.onReadVerifyVideos,
      listener: (context, state) {
        if (state.onReadVerifyVideos.isSuccess) {
          context.read<CoachPlatformStatusCubit>().onChangeShowingStatus(
            state.videoFilesData.isEmpty
                ? CoachesListShowingStatus.pendingVerification
                : CoachesListShowingStatus.regullar,
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.onReadVerifyVideos != current.onReadVerifyVideos,
      builder: (context, state) {
        final filesData = state.videoFilesData
            .where((e) => e.tag == gallaryTag)
            .toList();
        // TODO fix this what is it 2 nested complcated complex structure Builders? HAHA
        // previous.archivingImagesStatus != current.archivingImagesStatus
        return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
          buildWhen: (previous, current) =>
              previous.archivingImagesStatus != current.archivingImagesStatus,
          builder: (context, _) => SizedBox(
            height: MediaQuery.of(context).size.height / 3.5,
            child: ListView.separated(
              primary: false,
              scrollDirection: Axis.horizontal,
              itemCount: filesData.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return VideoPlaceholder(tag: gallaryTag);
                }
                final fileData = filesData[index - 1];
                final fileDetail = state.videoFilesDetail.singleWhere(
                  (element) => element.fileName == fileData.fileName,
                );
                return VideoPlaceholder(
                  bytes: fileDetail.bytes,
                  imageId: fileData.id,
                  fileUploadPath: fileData.fileUploadPath,
                  description: fileData.description,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 16);
              },
            ),
          ),
        );
      },
    );
  }
}

class VideoPlaceholder extends StatelessWidget {
  const VideoPlaceholder({
    super.key,
    this.bytes,
    this.imageId,
    this.tag,
    this.description,
    this.fileUploadPath,
  }) : assert(bytes != null || tag != null);

  final Uint8List? bytes;
  final String? imageId;
  final String? fileUploadPath;
  final GallaryTag? tag;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: context.sizeExtenstion.medium),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.height / 6 * 1.6,
              child: AppRoundedRectangleBorder(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    context.sizeExtenstion.small,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      if (bytes != null) ...[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Center(
                                child: VideoGestureDetector(
                                  imageId: imageId!,
                                  bytes: bytes!,
                                  fileUploadPath: fileUploadPath!,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.sizeExtenstion.small,
                              ),
                              child: Text(
                                'موفق احراز شده',
                                style: context.textTheme.labelSmall,
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ] else ...[
                        AddVideoButton(tag: tag!),
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

class VideoGestureDetector extends StatelessWidget {
  const VideoGestureDetector({
    super.key,

    required this.imageId,
    required this.bytes,
    required this.fileUploadPath,
  });

  final String imageId;
  final Uint8List bytes;
  final String fileUploadPath;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.archiveImagesId != current.archiveImagesId,
      builder: (context, state) {
        final isShowRadio = state.archiveImagesId.isNotEmpty;
        final isSelected = state.archiveImagesId.contains(imageId);

        return GestureDetector(
          onTap: () {
            final isSelectedImageEmpty = context
                .read<AthelteDirectoryCubit>()
                .state
                .archiveImagesId
                .isEmpty;
            if (isSelectedImageEmpty) {
              showVideoFullscreenRoute(context);
            } else {
              onInsertOrDeleteImage(context);
            }
          },
          onLongPress: () {
            onInsertOrDeleteImage(context);
          },
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                // height: double.infinity,
                child: Center(
                  child: IconButton.filledTonal(
                    onPressed: () => state.archiveImagesId.isEmpty
                        ? showVideoFullscreenRoute(context)
                        : null,
                    icon: Icon(Icons.play_arrow),
                  ),
                ),
              ),
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

  void showVideoFullscreenRoute(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            VideoApp(bytes: bytes, fileUploadPath: fileUploadPath),
      ),
    );
  }

  void onInsertOrDeleteImage(BuildContext context) {
    context.read<AthelteDirectoryCubit>().insertOrDeleteFromArchiveImageList(
      imageId,
    );
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({
    super.key,
    required this.bytes,
    required this.fileUploadPath,
  });
  final Uint8List bytes;
  final String fileUploadPath;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller =
    //     VideoPlayerController.networkUrl(Uri.parse(widget.fileUploadPath))
    //       ..initialize().then((_) {
    //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //         setState(() {});
    //       });
    _controller = VideoPlayerController.file(File.fromRawPath(widget.bytes))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      fab: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AddVideoButton extends StatelessWidget {
  const AddVideoButton({super.key, required this.tag});

  final GallaryTag tag;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: () async {
        List<CameraDescription> cameras = await availableCameras();
        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return BlocProvider.value(
                  value: context.read<CoachPlatformStatusCubit>(),

                  child: VerificationStatusScreen(cameras: cameras),
                );
              },
            ),
          );
        }

        // show video verification do dialog
        // show video with label overlay
        // then show wiating route
        // load indicator
        // send bytes to back end
        // generate gemini verification
        // if success save it to db and local and send back 204
        // link verification status to file(video) data
        // if failed raise exception
        // if (failed or not 204) then show retry button
        // else success and show verified snackbar
        //
        //   Next Usecase :
        // show video files data with descriptions
        // Next :
        // add delete mechanism for instance when there is one verification success object and we delete it then status should change
        // add show verifications on coach page
        // add warning of results of verification
        // add report problem by users
      },
      // label: label,
      icon: Icon(Icons.video_camera_front),
    );
  }
}
