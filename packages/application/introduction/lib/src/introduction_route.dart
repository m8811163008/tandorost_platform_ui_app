import 'package:animated_introduction/animated_introduction.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile.dart';
import 'package:tandorost_components/tandorost_components.dart';

class IntroductionRoute extends StatelessWidget {
  const IntroductionRoute({super.key, this.onDoneIntroduction});
  final VoidCallback? onDoneIntroduction;

  @override
  Widget build(BuildContext context) {
    return AnimatedIntroduction(
      isFullScreen: true,
      footerBgColor: context.themeData.colorScheme.primaryFixedDim,
      slides: pages(context),
      indicatorType: IndicatorType.circle,
      footerRadius: context.sizeExtenstion.medium,
      onDone: () async {
        await RepositoryProvider.of<ProfileRepository>(
          context,
        ).visitedIntroductionRoute();
        onDoneIntroduction?.call();
      },
      footerPadding: EdgeInsets.all(context.sizeExtenstion.medium),
      topHeightForFooter: 176,
      skipText: '',
      doneText: context.l10n.introductionDoneText,
      nextText: context.l10n.introductionNextText,
    );
  }

  List<SingleIntroScreen> pages(BuildContext context) => [
    SingleIntroScreen(
      title: context.l10n.introductionSingleIntroScreen1TitleText,
      description: context.l10n.introductionSingleIntroScreen1DescriptionText,
      // headerBgColor: context.themeData.colorScheme.primary, // Picton Blue
      mainCircleBgColor:
          context.themeData.colorScheme.tertiary, // Pigment Green
      sideDotsBgColor: context.themeData.colorScheme.secondary, // Oxford Blue
      headerWidget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Icon(Icons.favorite, color: Colors.redAccent, size: 48),
      ),
    ),
    SingleIntroScreen(
      title: context.l10n.introductionSingleIntroScreen2TitleText,
      description: context.l10n.introductionSingleIntroScreen2DescriptionText,
      // headerBgColor: context.themeData.colorScheme.secondary, // Oxford Blue
      mainCircleBgColor: context.themeData.colorScheme.primary, // Picton Blue
      sideDotsBgColor: context.themeData.colorScheme.tertiary, // Pigment Green
      headerWidget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 28,
              height: 80,
              decoration: BoxDecoration(
                color: context.themeData.colorScheme.primary.withAlpha(
                  (0.3 * 256).toInt(),
                ), // Picton Blue light
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            SizedBox(width: 12),
            Container(
              width: 48,
              height: 120,
              decoration: BoxDecoration(
                color: context.themeData.colorScheme.primary, // Picton Blue
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Icon(
                  Icons.sports_gymnastics,
                  color: context.themeData.colorScheme.onPrimary,
                  size: 40,
                ),
              ),
            ),
            SizedBox(width: 12),
            Container(
              width: 28,
              height: 80,
              decoration: BoxDecoration(
                color: context.themeData.colorScheme.primary.withAlpha(
                  (0.3 * 256).toInt(),
                ), // Picton Blue light
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ],
        ),
      ),
    ),
    SingleIntroScreen(
      title: context.l10n.introductionSingleIntroScreen3TitleText,
      description: context.l10n.introductionSingleIntroScreen3DescriptionText,
      // headerBgColor: context.themeData.colorScheme.tertiary, // Pigment Green
      mainCircleBgColor: context.themeData.colorScheme.secondary, // Oxford Blue
      sideDotsBgColor: context.themeData.colorScheme.primary, // Picton Blue
      headerWidget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                color: context.themeData.colorScheme.primary.withAlpha(
                  (0.15 * 256).toInt(),
                ), // Oxford Blue light
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Positioned(
              left: 20,
              child: CircleAvatar(
                radius: 22,
                backgroundColor:
                    context.themeData.colorScheme.primary, // Picton Blue
                child: Icon(
                  Icons.food_bank,
                  color: context.themeData.colorScheme.onPrimary,
                  size: 28,
                ),
              ),
            ),
            Positioned(
              right: 20,
              child: CircleAvatar(
                radius: 22,
                backgroundColor:
                    context.themeData.colorScheme.primary, // Picton Blue
                child: Icon(
                  Icons.local_drink,
                  color: context.themeData.colorScheme.onPrimary,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ];
}
