
import 'package:athletes_directory/src/coach_platform_status/camera_app.dart';
import 'package:athletes_directory/src/coach_platform_status/cubit/coach_platform_status_cubit.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class VerificationStatusScreen extends StatelessWidget {
  VerificationStatusScreen({super.key, this.cameras = const []})
    : _pageController = PageController(initialPage: 1),
      _verificationStatusViewKey = ValueKey('_verificationStatusViewKey'),

      _cameraAppKey = ValueKey('_cameraAppKey');
  final List<CameraDescription> cameras;
  final PageController _pageController;
  final ValueKey _verificationStatusViewKey;
  final ValueKey _cameraAppKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoachPlatformStatusCubit, CoachPlatformStatusState>(
      listenWhen: (previous, current) =>
          previous.onVerifyByAiStatus != current.onVerifyByAiStatus,
      listener: (context, state) {
        if (state.onVerifyByAiStatus.isSuccess) {
          // show success snackbar
          final content = context.l10n.success;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
          // pop the current status page
          Navigator.of(context).pop();

          // update verification videos list
          context.read<CoachPlatformStatusCubit>().onReadVerifyVideos();
        } else if (state.onVerifyByAiStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.onVerifyByAiStatus.isInternetConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }

        if (state.onVerifyByAiStatus.isError ||
            state.onVerifyByAiStatus.isSuccess) {
          // navigate to VerificationStatusView
          if ((_pageController.page)!.toInt() != 0) {
            _pageController.animateToPage(
              0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInCubic,
            );
          }
        }
      },
      buildWhen: (previous, current) =>
          previous.onVerifyByAiStatus != current.onVerifyByAiStatus,
      builder: (context, state) {
        return AppScaffold(
          appBar: AppBar(title: Text("وضعیت احراز هویت ")),
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (pageIndex) {},
            children: [
              VerificationStatusView(
                key: _verificationStatusViewKey,
                onStartRecordVideoPressed: () {
                  if ((_pageController.page)!.toInt() != 1) {
                    _pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInCubic,
                    );
                  }
                },
              ),
              CameraApp(
                key: _cameraAppKey,
                onStopVideoRecording: (XFile recordedFile) async {
                  context.read<CoachPlatformStatusCubit>().onVerifyByAi(
                    recordedFile,
                  );
                },
                cameras: cameras,
              ),
            ],
          ),
        );
      },
    );
  }
}

class VerificationStatusView extends StatelessWidget {
  const VerificationStatusView({super.key, this.onStartRecordVideoPressed});
  final VoidCallback? onStartRecordVideoPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoachPlatformStatusCubit, CoachPlatformStatusState>(
      listener: (context, state) {
        if (state.onVerifyByAiStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.onVerifyByAiStatus.isInternetConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }
      },
      listenWhen: (previous, current) =>
          previous.onVerifyByAiStatus != current.onVerifyByAiStatus,
      buildWhen: (previous, current) =>
          previous.onVerifyByAiStatus != current.onVerifyByAiStatus,
      builder: (context, state) {
        final isError = state.onVerifyByAiStatus.isError;

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppCard(
              child: Column(
                children: [
                  Text(
                    'وضعیت احراز هویت  ',
                    style: context.textTheme.titleLarge,
                  ),
                  if (state.onVerifyByAiStatus.isLoading)
                    CircularProgressIndicator(),
                  if (!state.onVerifyByAiStatus.isLoading)
                    Text(
                      state.onVerifyByAiStatus.isError
                          ? 'خطا دوباره تلاش کنید'
                          : 'تبریک! احراز شدید',
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
            Spacer(),

            LayoutFAB(
              iconData: Icons.start,
              fabTitle: 'دوباره تلاش کن',
              onPressed: onStartRecordVideoPressed,
            ),
          ],
        );
      },
    );
  }
}
