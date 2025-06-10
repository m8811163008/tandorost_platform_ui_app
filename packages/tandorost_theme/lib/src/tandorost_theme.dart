import 'package:flutter/material.dart';
import 'package:tandorost_theme/src/color_extension.dart';
import 'package:tandorost_theme/src/size_extension.dart';
import 'package:tandorost_theme/src/theme_color.dart';

class AppTheme {
  final Locale locale;
  final double screenWidth;

  AppTheme({required this.locale, required this.screenWidth});

  ThemeData get lightTheme {
    final sizeExtenstion = SizeExtenstion();
    final colorExtenstion = ColorExtenstion();
    return ThemeData.light(useMaterial3: true).copyWith(
      visualDensity: screenWidth.visualDensity,
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(visualDensity: screenWidth.visualDensity),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          visualDensity: screenWidth.visualDensity,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          visualDensity: screenWidth.visualDensity,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(visualDensity: screenWidth.visualDensity),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: ThemeColor.russianViolet.color,
        primary: ThemeColor.russianViolet.color,
        secondary: ThemeColor.tekhelet.color,
        tertiary: ThemeColor.black.color,
        onPrimary: ThemeColor.seasalt.color,
        onSecondary: ThemeColor.mediumSlateBlue.color,
      ),
      scaffoldBackgroundColor: ThemeColor.seasalt.color,
      canvasColor: ThemeColor.seasalt.color,

      textTheme: textTheme(locale, screenWidth),
      extensions: [sizeExtenstion, colorExtenstion],
      appBarTheme: AppBarTheme(
        backgroundColor: ThemeColor.seasalt.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(sizeExtenstion.medium),
            bottomRight: Radius.circular(sizeExtenstion.medium),
          ),
        ),
        titleTextStyle: textTheme(locale, screenWidth).titleMedium,

        surfaceTintColor: Colors.transparent,
        actionsPadding: EdgeInsets.symmetric(horizontal: sizeExtenstion.medium),
      ),
      tabBarTheme: TabBarThemeData(
        textScaler: TextScaler.linear(screenWidth.textFactor),
        dividerColor: Colors.transparent,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
        isDense: screenWidth.isDense,
        hintStyle: textTheme(
          locale,
          screenWidth,
        ).titleMedium!.copyWith(color: ThemeColor.black.color),
        contentPadding: EdgeInsets.symmetric(
          horizontal: sizeExtenstion.medium,
          vertical: sizeExtenstion.small,
        ),
      ),
      cardTheme: CardThemeData(
        margin: EdgeInsets.symmetric(
          horizontal: sizeExtenstion.medium,
          vertical: sizeExtenstion.small,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        borderRadius: BorderRadius.circular(sizeExtenstion.large),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: ThemeColor.mediumSlateBlue.color.withAlpha(50),
        selectedTileColor: ThemeColor.mediumSlateBlue.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sizeExtenstion.small),
        ),
      ),
      // Calm theme: soft, muted colors
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ThemeColor.seasalt.color,
        selectedItemColor: ThemeColor.russianViolet.color, // calm blue
        unselectedItemColor: ThemeColor.russianViolet.color.withAlpha(
          128,
        ), // muted blue
        selectedIconTheme: IconThemeData(color: ThemeColor.russianViolet.color),
        unselectedIconTheme: IconThemeData(
          color: ThemeColor.russianViolet.color.withAlpha(128),
        ),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  final TextTheme baseTextTheme =
      Typography.material2021(platform: TargetPlatform.android).dense;
  TextTheme textTheme(Locale locale, double screenWidth) {
    final themeData = ThemeData.light(useMaterial3: true);
    if (locale.languageCode == 'fa') {
      return Typography.dense2021.apply(
        fontFamily: 'IranSansFaNum',
        package: 'tandorost_theme',
        fontSizeFactor: screenWidth.textFactor,
        fontSizeDelta: 0,
        bodyColor: ThemeColor.black.color,
        displayColor: ThemeColor.black.color,
        decorationColor: ThemeColor.black.color,
      );
    } else {
      return Typography.dense2021.apply(
        fontFamily: 'IranSansEnNum',
        package: 'tandorost_theme',
        fontSizeFactor: screenWidth.textFactor,
        fontSizeDelta: 0,
        bodyColor: ThemeColor.black.color,
        displayColor: ThemeColor.black.color,
        decorationColor: ThemeColor.black.color,
      );
    }
  }
}

enum ScreenSize { small, medium, large, extraLarge }

extension ScreenSizeFromWidth on num {
  ScreenSize get screenSize {
    if (this < 425) return ScreenSize.small;
    if (this < 768) return ScreenSize.medium;
    if (this < 1024) return ScreenSize.large;

    return ScreenSize.extraLarge;
  }

  double get textFactor {
    switch (screenSize) {
      case ScreenSize.small:
        return 0.85;
      case ScreenSize.medium:
        return 1.0;
      case ScreenSize.large:
        return 1.15;
      case ScreenSize.extraLarge:
        return 1.3;
    }
  }

  VisualDensity get visualDensity {
    switch (screenSize) {
      case ScreenSize.small:
        return VisualDensity.compact;
      case ScreenSize.medium:
        return VisualDensity.standard;
      case ScreenSize.large:
        return VisualDensity.comfortable;
      case ScreenSize.extraLarge:
        return VisualDensity.adaptivePlatformDensity;
    }
  }

  bool get isDense {
    switch (screenSize) {
      case ScreenSize.small:
        return true;
      case ScreenSize.medium:
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return false;
    }
  }
}
