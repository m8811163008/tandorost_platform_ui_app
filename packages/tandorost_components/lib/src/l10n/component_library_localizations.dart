import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'component_library_localizations_fa.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ComponentLibraryLocalizations
/// returned by `ComponentLibraryLocalizations.of(context)`.
///
/// Applications need to include `ComponentLibraryLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/component_library_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ComponentLibraryLocalizations.localizationsDelegates,
///   supportedLocales: ComponentLibraryLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the ComponentLibraryLocalizations.supportedLocales
/// property.
abstract class ComponentLibraryLocalizations {
  ComponentLibraryLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ComponentLibraryLocalizations of(BuildContext context) {
    return Localizations.of<ComponentLibraryLocalizations>(context, ComponentLibraryLocalizations)!;
  }

  static const LocalizationsDelegate<ComponentLibraryLocalizations> delegate = _ComponentLibraryLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('fa')
  ];

  /// No description provided for @foodName.
  ///
  /// In fa, this message translates to:
  /// **'نام غذا'**
  String get foodName;

  /// No description provided for @fat.
  ///
  /// In fa, this message translates to:
  /// **'چربی'**
  String get fat;

  /// No description provided for @carbohydrate.
  ///
  /// In fa, this message translates to:
  /// **'کربوهیدرات'**
  String get carbohydrate;

  /// No description provided for @protein.
  ///
  /// In fa, this message translates to:
  /// **'پروتئین'**
  String get protein;

  /// No description provided for @id.
  ///
  /// In fa, this message translates to:
  /// **'شناسه'**
  String get id;

  /// No description provided for @upsertDate.
  ///
  /// In fa, this message translates to:
  /// **'تاریخ ثبت/بروزرسانی'**
  String get upsertDate;

  /// No description provided for @unitOfMeasurement.
  ///
  /// In fa, this message translates to:
  /// **'واحد اندازه‌گیری'**
  String get unitOfMeasurement;

  /// No description provided for @calculatedCalorie.
  ///
  /// In fa, this message translates to:
  /// **'کالری محاسبه شده'**
  String get calculatedCalorie;

  /// No description provided for @quantityOfUnitOfMeasurement.
  ///
  /// In fa, this message translates to:
  /// **'تعداد واحد اندازه‌گیری'**
  String get quantityOfUnitOfMeasurement;

  /// No description provided for @carbohydrateSource.
  ///
  /// In fa, this message translates to:
  /// **'منبع کربوهیدرات'**
  String get carbohydrateSource;

  /// No description provided for @carbohydrateSourceValue.
  ///
  /// In fa, this message translates to:
  /// **'{source, select, fruitsOrNonStarchyVegetables{میوه و سبزی} others{کربوهیدرات غنی} other{ترجمه تعریف نشده}}'**
  String carbohydrateSourceValue(String source);

  /// No description provided for @cancle.
  ///
  /// In fa, this message translates to:
  /// **'لغو'**
  String get cancle;

  /// No description provided for @delete.
  ///
  /// In fa, this message translates to:
  /// **'حذف'**
  String get delete;

  /// No description provided for @update.
  ///
  /// In fa, this message translates to:
  /// **'بروزرسانی'**
  String get update;

  /// No description provided for @delete_confirm_question.
  ///
  /// In fa, this message translates to:
  /// **'آیا {food} حذف شود؟'**
  String delete_confirm_question(String food);
}

class _ComponentLibraryLocalizationsDelegate extends LocalizationsDelegate<ComponentLibraryLocalizations> {
  const _ComponentLibraryLocalizationsDelegate();

  @override
  Future<ComponentLibraryLocalizations> load(Locale locale) {
    return SynchronousFuture<ComponentLibraryLocalizations>(lookupComponentLibraryLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_ComponentLibraryLocalizationsDelegate old) => false;
}

ComponentLibraryLocalizations lookupComponentLibraryLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'fa': return ComponentLibraryLocalizationsFa();
  }

  throw FlutterError(
    'ComponentLibraryLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
