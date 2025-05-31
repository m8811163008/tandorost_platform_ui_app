import 'package:flutter/material.dart';
import 'package:tandorost_theme/src/color_extension.dart';
import 'package:tandorost_theme/src/size_extension.dart';
import 'package:tandorost_theme/src/theme_color.dart';

class AppTheme {
  final Locale locale;

  AppTheme({required this.locale});

  ThemeData get lightTheme {
    final sizeExtenstion = SizeExtenstion();
    final colorExtenstion = ColorExtenstion();
    return ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ThemeColor.pictonBlue.color,
        primary: ThemeColor.pictonBlue.color,
        secondary: ThemeColor.oxfordBlue.color,
        tertiary: ThemeColor.pigmentGreen.color,
        onPrimary: ThemeColor.charcoal.color,
        onSecondary: ThemeColor.white.color,
      ),

      textTheme: textTheme(locale),
      extensions: [sizeExtenstion, colorExtenstion],
      appBarTheme: AppBarTheme(
        color: ThemeColor.white.color,
        actionsPadding: EdgeInsets.symmetric(vertical: sizeExtenstion.small),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
        hintStyle: textTheme(
          locale,
        ).bodyMedium!.copyWith(color: ThemeColor.charcoal.color),
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
        tileColor: ThemeColor.white.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sizeExtenstion.small),
        ),
      ),
      // Calm theme: soft, muted colors
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ThemeColor.white.color,
        selectedItemColor: ThemeColor.pictonBlue.color.withAlpha(
          160,
        ), // calm blue
        unselectedItemColor: ThemeColor.oxfordBlue.color.withAlpha(
          128,
        ), // muted blue
        selectedIconTheme: IconThemeData(color: ThemeColor.pictonBlue.color),
        unselectedIconTheme: IconThemeData(
          color: ThemeColor.oxfordBlue.color.withAlpha(128),
        ),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  TextTheme textTheme(Locale locale) {
    final themeData = ThemeData.light(useMaterial3: true);
    if (locale.languageCode == 'fa') {
      return themeData.textTheme.apply(
        fontFamily: 'IranSansFaNum',
        package: 'tandorost_theme',
      );
    } else {
      return themeData.textTheme.apply(
        fontFamily: 'IranSansEnNum',
        package: 'tandorost_theme',
      );
    }
  }
}
