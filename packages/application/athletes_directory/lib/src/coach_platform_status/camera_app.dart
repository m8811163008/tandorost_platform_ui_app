import 'dart:async';

import 'package:athletes_directory/src/coach_platform_status/cubit/coach_platform_status_cubit.dart';
import 'package:camera/camera.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class CameraApp extends StatefulWidget {
  /// Default Constructor
  CameraApp({super.key, this.cameras = const [], this.onStopVideoRecording})
    : assert(cameras.isNotEmpty);
  final List<CameraDescription> cameras;
  final AsyncValueSetter<XFile>? onStopVideoRecording;

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> with WidgetsBindingObserver {
  CameraController? controller;
  Timer? _timer;
  final _key = ValueKey('video-preview');
  int _secondleft = 45;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (!controller!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      controller!.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // _initializeController();
    }
  }

  @override
  void initState() {
    super.initState();
    _secondleft = 45;

    controller = CameraController(
      CameraDescription(
        name: 'abc',
        lensDirection: CameraLensDirection.front,
        sensorOrientation: 0,
      ),
      ResolutionPreset.veryHigh,
    );
    WidgetsBinding.instance.addObserver(this);

    controller!.addListener(_onUpdateCameracontroller);
  }

  void _onUpdateCameracontroller() {
    setState(() {
      controller;
    });
  }

  Future<void> _initializeController() async {
    try {
      await controller!.initialize();

      // await controller.prepareForVideoRecording();

      // if (!mounted) {
      //   return;
      // }
      // setState(() {});
    } catch (e) {
      print(e);
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    }
  }

  @override
  void dispose() async {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    controller?.removeListener(_onUpdateCameracontroller);
    try {
      await controller?.stopVideoRecording();
      controller?.dispose();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    if (!controller!.value.isInitialized) {
      return CameraOverlay(
        iconData: Icons.start,
        fabTitle: 'شروع کن',
        onPressed: _onStart,
      );
    }
    return _buildCameraPreview();
  }

  Future<void> _onStop() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (_secondleft > 35) {
      final content = 'حداقل 10 ثانیه باشد';
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(content)));

      return;
    }
    if (controller!.value.isRecordingVideo) {
      try {
        final file = await controller!.stopVideoRecording();
        widget.onStopVideoRecording?.call(file);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> _onStart() async {
    if (!controller!.value.isInitialized) {
      await _initializeController();
    }
    if (!controller!.value.isRecordingVideo) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _secondleft--;
        if (_secondleft == 0) {
          _onStop();
          _timer!.cancel();
        }
      });
      try {
        await controller!.startVideoRecording();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Widget _buildCameraPreview() {
    return !controller!.value.isRecordingVideo
        ? CameraOverlay(
            iconData: Icons.start,
            fabTitle: 'شروع کن',
            onPressed: _onStart,
          )
        : CameraPreview(
            key: _key,
            controller!,
            child: CameraOverlay(
              iconData: Icons.stop_circle,
              fabTitle: 'ارسال ویدئو',
              onPressed: _onStop,
            ),
          );
  }
}

class CameraOverlay extends StatelessWidget {
  const CameraOverlay({
    super.key,
    this.onPressed,
    required this.iconData,
    this.fabTitle = '',
  });

  final VoidCallback? onPressed;
  final IconData iconData;
  final String fabTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        VerifyInstructionsCard(),
        Spacer(),
        LayoutFAB(iconData: iconData, onPressed: onPressed, fabTitle: fabTitle),
      ],
    );
  }
}

class LayoutFAB extends StatelessWidget {
  const LayoutFAB({
    super.key,
    this.onPressed,
    required this.iconData,
    this.fabTitle = '',
  });
  final VoidCallback? onPressed;
  final IconData iconData;
  final String fabTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.sizeExtenstion.medium),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child:
            BlocSelector<
              CoachPlatformStatusCubit,
              CoachPlatformStatusState,
              AsyncProcessingStatus
            >(
              selector: (state) => state.onVerifyByAiStatus,
              builder: (context, onVerifyByAiStatus) {
                return FloatingActionButton.extended(
                  onPressed: !onVerifyByAiStatus.isLoading ? onPressed : null,
                  label: Text(
                    !onVerifyByAiStatus.isLoading
                        ? fabTitle
                        : 'در حال پردازش فیلم',
                  ),
                  icon: !onVerifyByAiStatus.isLoading
                      ? Icon(iconData)
                      : Transform.scale(
                          scale: 0.5,
                          child: CircularProgressIndicator(),
                        ),
                );
              },
            ),
      ),
    );
  }
}

class VerifyInstructionsCard extends StatelessWidget {
  const VerifyInstructionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: context.themeData.colorScheme.surfaceContainerHigh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCardHeader(title: 'سوال احراز هویت'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.mic),
                Expanded(
                  child: Text(
                    'نام شما چیست ؟ آیا مربی فدراسیون بدنسازی و پرورش اندام هستید؟',
                    style: context.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
