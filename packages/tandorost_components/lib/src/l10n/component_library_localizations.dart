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

  /// No description provided for @drawerSupportText1.
  ///
  /// In fa, this message translates to:
  /// **'شماره پشتیبانی 09212805230'**
  String get drawerSupportText1;

  /// No description provided for @drawerSupportText2.
  ///
  /// In fa, this message translates to:
  /// **'محتویات برنامه متعلق به تیم توسعه دهنده تندرست می‌باشد.'**
  String get drawerSupportText2;

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

  /// No description provided for @carbohydrateFruitsOrNonStarchyVegetables.
  ///
  /// In fa, this message translates to:
  /// **'کربوهیدرات میوه و سبزی'**
  String get carbohydrateFruitsOrNonStarchyVegetables;

  /// No description provided for @carbohydrateOthers.
  ///
  /// In fa, this message translates to:
  /// **'کربوهیدرات غنی'**
  String get carbohydrateOthers;

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

  /// No description provided for @foodEnergy.
  ///
  /// In fa, this message translates to:
  /// **'انرژی'**
  String get foodEnergy;

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

  /// No description provided for @deleteAll.
  ///
  /// In fa, this message translates to:
  /// **'حذف همه'**
  String get deleteAll;

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

  /// No description provided for @searchFoodBottomSheetHeading.
  ///
  /// In fa, this message translates to:
  /// **'اضافه کردن غذا'**
  String get searchFoodBottomSheetHeading;

  /// No description provided for @searchFoodBottomSheetTextFieldHintExample1.
  ///
  /// In fa, this message translates to:
  /// **'برای مثال یک عدد سینه مرغ سرخ شده و دو عدد سیب زمینی پخته متوسط'**
  String get searchFoodBottomSheetTextFieldHintExample1;

  /// No description provided for @searchFoodBottomSheetTextFieldHintExample2.
  ///
  /// In fa, this message translates to:
  /// **'یک بشقاب قرمه سبزی و یک کاسه سالاد شیرازی و دو لیوان دوغ'**
  String get searchFoodBottomSheetTextFieldHintExample2;

  /// No description provided for @searchFoodBottomSheetTextFieldHintExample3.
  ///
  /// In fa, this message translates to:
  /// **'یه کاسه ماست یونانی و یک مشت جو دوسر'**
  String get searchFoodBottomSheetTextFieldHintExample3;

  /// No description provided for @searchFoodBottomSheetTextFieldHintExample4.
  ///
  /// In fa, this message translates to:
  /// **'نصف بشقاب باقلی قاتق و یک لیوان آب جو بدون الکل'**
  String get searchFoodBottomSheetTextFieldHintExample4;

  /// No description provided for @searchFoodBottomSheetTextFieldHintExample5.
  ///
  /// In fa, this message translates to:
  /// **'اشکنه شنبلیله و نعناع یک کاسه بزرگ'**
  String get searchFoodBottomSheetTextFieldHintExample5;

  /// No description provided for @searchFoodBottomSheetButtonLabel.
  ///
  /// In fa, this message translates to:
  /// **'جستجو'**
  String get searchFoodBottomSheetButtonLabel;

  /// No description provided for @networkError.
  ///
  /// In fa, this message translates to:
  /// **'خطای ارتباط. دوباره امتحان کنید'**
  String get networkError;

  /// No description provided for @internetConnectionError.
  ///
  /// In fa, this message translates to:
  /// **'خطای اینترنت. اینترنت خود را روشن نمایید'**
  String get internetConnectionError;

  /// No description provided for @voiceAiInsufficientLength.
  ///
  /// In fa, this message translates to:
  /// **'حداقل {seconds} ثانیه گفتگو کنید'**
  String voiceAiInsufficientLength(int seconds);

  /// No description provided for @selectLanguageBottomSheetHeading.
  ///
  /// In fa, this message translates to:
  /// **'انتخاب کردن زبان گفتار'**
  String get selectLanguageBottomSheetHeading;

  /// No description provided for @emptyFormFieldValidationError.
  ///
  /// In fa, this message translates to:
  /// **'این فیلد خالی است. درآن تایپ کن'**
  String get emptyFormFieldValidationError;

  /// No description provided for @minLengthFormFieldValidationError.
  ///
  /// In fa, this message translates to:
  /// **'حداقل {minLength} حروف باید تایپ کنید'**
  String minLengthFormFieldValidationError(int minLength);

  /// No description provided for @registerLabel.
  ///
  /// In fa, this message translates to:
  /// **'ثبت نام'**
  String get registerLabel;

  /// No description provided for @loginRouteLabel.
  ///
  /// In fa, this message translates to:
  /// **'ورود'**
  String get loginRouteLabel;

  /// No description provided for @verifyRouteOutlineLabel.
  ///
  /// In fa, this message translates to:
  /// **'ارسال کد'**
  String get verifyRouteOutlineLabel;

  /// No description provided for @outlineLabelBackToHome.
  ///
  /// In fa, this message translates to:
  /// **'بازگشت به خانه'**
  String get outlineLabelBackToHome;

  /// No description provided for @textButtonLabelLogin.
  ///
  /// In fa, this message translates to:
  /// **'ورود'**
  String get textButtonLabelLogin;

  /// No description provided for @verifyNumberTextFieldLabel.
  ///
  /// In fa, this message translates to:
  /// **'تایید شماره همراه'**
  String get verifyNumberTextFieldLabel;

  /// No description provided for @verifyFormOutlineLabel.
  ///
  /// In fa, this message translates to:
  /// **'ارسال'**
  String get verifyFormOutlineLabel;

  /// No description provided for @forgotPasswordLabel.
  ///
  /// In fa, this message translates to:
  /// **'فراموشی رمز عبور'**
  String get forgotPasswordLabel;

  /// No description provided for @phoneNumberTextFieldLabel.
  ///
  /// In fa, this message translates to:
  /// **'شماره تلفن همراه'**
  String get phoneNumberTextFieldLabel;

  /// No description provided for @passwordTextFieldLabel.
  ///
  /// In fa, this message translates to:
  /// **'رمز عبور'**
  String get passwordTextFieldLabel;

  /// No description provided for @newPasswordTextFieldLabel.
  ///
  /// In fa, this message translates to:
  /// **'رمز عبور جدید'**
  String get newPasswordTextFieldLabel;

  /// No description provided for @verificationCodeTextFieldLabel.
  ///
  /// In fa, this message translates to:
  /// **'کد پیامک شده'**
  String get verificationCodeTextFieldLabel;

  /// No description provided for @dialogTitleChangeApplicationLanguage.
  ///
  /// In fa, this message translates to:
  /// **'تغییر زبان نرم افزار'**
  String get dialogTitleChangeApplicationLanguage;

  /// No description provided for @dialogTitleChangeName.
  ///
  /// In fa, this message translates to:
  /// **'تغییرنام'**
  String get dialogTitleChangeName;

  /// No description provided for @changeNameTextFieldLabel.
  ///
  /// In fa, this message translates to:
  /// **'نام'**
  String get changeNameTextFieldLabel;

  /// No description provided for @personalInfoNameLabel.
  ///
  /// In fa, this message translates to:
  /// **'نام'**
  String get personalInfoNameLabel;

  /// No description provided for @personalInfoPhoneLabel.
  ///
  /// In fa, this message translates to:
  /// **'شماره تلفن'**
  String get personalInfoPhoneLabel;

  /// No description provided for @updateButton.
  ///
  /// In fa, this message translates to:
  /// **'بروزرسانی'**
  String get updateButton;

  /// No description provided for @personalInfoSettingLabel.
  ///
  /// In fa, this message translates to:
  /// **'مشخصات فردی'**
  String get personalInfoSettingLabel;

  /// No description provided for @settingLabel.
  ///
  /// In fa, this message translates to:
  /// **'تنظیمات'**
  String get settingLabel;

  /// No description provided for @changeWeightSpeedLabel.
  ///
  /// In fa, this message translates to:
  /// **'سرعت کاهش وزن'**
  String get changeWeightSpeedLabel;

  /// No description provided for @changeWeightSpeedInfoConstantSpeed.
  ///
  /// In fa, this message translates to:
  /// **'در حالت تثبیت وزن از انرژی مورد نیاز کم نمیشود'**
  String get changeWeightSpeedInfoConstantSpeed;

  /// No description provided for @changeWeightSpeedInfoSlowAndEasySpeed.
  ///
  /// In fa, this message translates to:
  /// **'در حالت آهسته و آسان در روز استراحت 10 درصد از انرژی مورد نیاز کم میشود و در روز تمرین 0 درصد از انرژی مورد نیاز کم میشود'**
  String get changeWeightSpeedInfoSlowAndEasySpeed;

  /// No description provided for @changeWeightSpeedInfoMediumSpeed.
  ///
  /// In fa, this message translates to:
  /// **'در حالت طبیعی در روز استراحت 10 درصد از انرژی مورد نیاز کم میشود و در روز تمرین  5 درصد از انرژی مورد نیاز کم میشود'**
  String get changeWeightSpeedInfoMediumSpeed;

  /// No description provided for @changeWeightSpeedInfoFastSpeed.
  ///
  /// In fa, this message translates to:
  /// **'در حالت سریع در روز استراحت 15 درصد از انرژی مورد نیاز کم میشود و در روز تمرین  5 درصد از انرژی مورد نیاز کم میشود'**
  String get changeWeightSpeedInfoFastSpeed;

  /// No description provided for @changeWeightSpeedInfoFastAndHardSpeed.
  ///
  /// In fa, this message translates to:
  /// **'در حالت سریع و سخت در روز استراحت 15 درصد از انرژی مورد نیاز کم میشود و در روز تمرین  15 درصد از انرژی مورد نیاز کم میشود'**
  String get changeWeightSpeedInfoFastAndHardSpeed;

  /// No description provided for @changeWeightSpeedInfoFastAndHardSpeedCaution.
  ///
  /// In fa, this message translates to:
  /// **'دقت کنید حالت سریع و سخت برای بعضی روزهای تمرین مناسب نیست چون باعث میشه انرژی کمی برای تمرین فراهم باشد.'**
  String get changeWeightSpeedInfoFastAndHardSpeedCaution;

  /// No description provided for @profileChangeWeightSpeedButtonLabel.
  ///
  /// In fa, this message translates to:
  /// **'{changeWeightSpeed, select, constant{تثبیت وزن} slowAndEasy{آهسته و آسان} medium{طبیعی} fast{سریع} fastAndHard{سریع و سخت} other{ترجمه تعریف نشده}}'**
  String profileChangeWeightSpeedButtonLabel(String changeWeightSpeed);

  /// No description provided for @timeRestrictedEatingLabel.
  ///
  /// In fa, this message translates to:
  /// **'رژیم با زمان محدود(فستینگ)'**
  String get timeRestrictedEatingLabel;

  /// No description provided for @languageSettingLabel.
  ///
  /// In fa, this message translates to:
  /// **'زبان نرم افزار'**
  String get languageSettingLabel;

  /// No description provided for @languageTranslation.
  ///
  /// In fa, this message translates to:
  /// **'{language_name, select, english{انگلیسی} chinese{چینی} hindi{هندی} spanish{اسپانیایی} french{فرانسوی} arabic{عربی} bengali{بنگالی} russian{روسی} portuguese{پرتغالی} urdu{اردو} indonesian{اندونزیایی} german{آلمانی} japanese{ژاپنی} marathi{مراتی} telugu{تلوگو} turkish{ترکی} tamil{تامیلی} vietnamese{ویتنامی} tagalog{تاگالوگ} korean{کره‌ای} persian{فارسی} hausa{هوسا} javanese{جاوه‌ای} italian{ایتالیایی} punjabi{پنجابی} kannada{کانادا} gujarati{گجراتی} thai{تایلندی} polish{لهستانی} ukrainian{اوکراینی} other{ترجمه تعریف نشده}}'**
  String languageTranslation(String language_name);

  /// No description provided for @profileChartTypeLabel.
  ///
  /// In fa, this message translates to:
  /// **'{chartType, select, weight{وزن} height{قد} waistCircumference{دور کمر} armCircumference{دور بازو} chestCircumference{دور سینه} thighCircumference{دور ران} calfMuscleCircumference{ماهیچه ساق پا} hipCircumference{دور باسن} activityLevel{سطح فعالیت} other{ترجمه تعریف نشده}}'**
  String profileChartTypeLabel(String chartType);

  /// No description provided for @photoEditorRemove.
  ///
  /// In fa, this message translates to:
  /// **'حذف'**
  String get photoEditorRemove;

  /// No description provided for @photoEditorEdit.
  ///
  /// In fa, this message translates to:
  /// **'ویرایش'**
  String get photoEditorEdit;

  /// No description provided for @photoEditorRotateScale.
  ///
  /// In fa, this message translates to:
  /// **'چرخش و تغییر اندازه'**
  String get photoEditorRotateScale;

  /// No description provided for @photoEditorMoveAndZoom.
  ///
  /// In fa, this message translates to:
  /// **'بزرگنمایی'**
  String get photoEditorMoveAndZoom;

  /// No description provided for @photoEditorBottomNavigationBarText.
  ///
  /// In fa, this message translates to:
  /// **'نقاشی'**
  String get photoEditorBottomNavigationBarText;

  /// No description provided for @photoEditorFreestyle.
  ///
  /// In fa, this message translates to:
  /// **'آزاد'**
  String get photoEditorFreestyle;

  /// No description provided for @photoEditorArrow.
  ///
  /// In fa, this message translates to:
  /// **'فلش'**
  String get photoEditorArrow;

  /// No description provided for @photoEditorLine.
  ///
  /// In fa, this message translates to:
  /// **'خط'**
  String get photoEditorLine;

  /// No description provided for @photoEditorRectangle.
  ///
  /// In fa, this message translates to:
  /// **'مستطیل'**
  String get photoEditorRectangle;

  /// No description provided for @photoEditorCircle.
  ///
  /// In fa, this message translates to:
  /// **'دایره'**
  String get photoEditorCircle;

  /// No description provided for @photoEditorDashLine.
  ///
  /// In fa, this message translates to:
  /// **'خط چین'**
  String get photoEditorDashLine;

  /// No description provided for @photoEditorBlur.
  ///
  /// In fa, this message translates to:
  /// **'محو کردن'**
  String get photoEditorBlur;

  /// No description provided for @photoEditorPixelate.
  ///
  /// In fa, this message translates to:
  /// **'پیکسلی کردن'**
  String get photoEditorPixelate;

  /// No description provided for @photoEditorLineWidth.
  ///
  /// In fa, this message translates to:
  /// **'ضخامت خط'**
  String get photoEditorLineWidth;

  /// No description provided for @photoEditorEraser.
  ///
  /// In fa, this message translates to:
  /// **'پاک‌کن'**
  String get photoEditorEraser;

  /// No description provided for @photoEditorToggleFill.
  ///
  /// In fa, this message translates to:
  /// **'تغییر حالت پر کردن'**
  String get photoEditorToggleFill;

  /// No description provided for @photoEditorChangeOpacity.
  ///
  /// In fa, this message translates to:
  /// **'تغییر شفافیت'**
  String get photoEditorChangeOpacity;

  /// No description provided for @photoEditorUndo.
  ///
  /// In fa, this message translates to:
  /// **'برگرداندن'**
  String get photoEditorUndo;

  /// No description provided for @photoEditorRedo.
  ///
  /// In fa, this message translates to:
  /// **'دوباره انجام دادن'**
  String get photoEditorRedo;

  /// No description provided for @photoEditorDone.
  ///
  /// In fa, this message translates to:
  /// **'انجام شد'**
  String get photoEditorDone;

  /// No description provided for @photoEditorBack.
  ///
  /// In fa, this message translates to:
  /// **'بازگشت'**
  String get photoEditorBack;

  /// No description provided for @photoEditorSmallScreenMoreTooltip.
  ///
  /// In fa, this message translates to:
  /// **'بیشتر'**
  String get photoEditorSmallScreenMoreTooltip;

  /// No description provided for @photoEditorInputHintText.
  ///
  /// In fa, this message translates to:
  /// **'متن را وارد کنید'**
  String get photoEditorInputHintText;

  /// No description provided for @photoEditorBottomNavigationBarTextText.
  ///
  /// In fa, this message translates to:
  /// **'متن'**
  String get photoEditorBottomNavigationBarTextText;

  /// No description provided for @photoEditorBackText.
  ///
  /// In fa, this message translates to:
  /// **'بازگشت'**
  String get photoEditorBackText;

  /// No description provided for @photoEditorDoneText.
  ///
  /// In fa, this message translates to:
  /// **'انجام شد'**
  String get photoEditorDoneText;

  /// No description provided for @photoEditorTextAlign.
  ///
  /// In fa, this message translates to:
  /// **'تراز متن'**
  String get photoEditorTextAlign;

  /// No description provided for @photoEditorFontScale.
  ///
  /// In fa, this message translates to:
  /// **'مقیاس فونت'**
  String get photoEditorFontScale;

  /// No description provided for @photoEditorBackgroundMode.
  ///
  /// In fa, this message translates to:
  /// **'حالت پس‌زمینه'**
  String get photoEditorBackgroundMode;

  /// No description provided for @photoEditorSmallScreenMoreTooltipText.
  ///
  /// In fa, this message translates to:
  /// **'بیشتر'**
  String get photoEditorSmallScreenMoreTooltipText;

  /// No description provided for @photoEditorBottomNavigationBarTextCropRotate.
  ///
  /// In fa, this message translates to:
  /// **'برش/چرخش'**
  String get photoEditorBottomNavigationBarTextCropRotate;

  /// No description provided for @photoEditorRotate.
  ///
  /// In fa, this message translates to:
  /// **'چرخش'**
  String get photoEditorRotate;

  /// No description provided for @photoEditorFlip.
  ///
  /// In fa, this message translates to:
  /// **'برعکس'**
  String get photoEditorFlip;

  /// No description provided for @photoEditorRatio.
  ///
  /// In fa, this message translates to:
  /// **'نسبت'**
  String get photoEditorRatio;

  /// No description provided for @photoEditorCancel.
  ///
  /// In fa, this message translates to:
  /// **'لغو'**
  String get photoEditorCancel;

  /// No description provided for @photoEditorReset.
  ///
  /// In fa, this message translates to:
  /// **'بازنشانی'**
  String get photoEditorReset;

  /// No description provided for @photoEditorBottomNavigationBarTextFilter.
  ///
  /// In fa, this message translates to:
  /// **'فیلتر'**
  String get photoEditorBottomNavigationBarTextFilter;

  /// No description provided for @photoEditorBottomNavigationBarTextTune.
  ///
  /// In fa, this message translates to:
  /// **'تنظیم'**
  String get photoEditorBottomNavigationBarTextTune;

  /// No description provided for @photoEditorBrightness.
  ///
  /// In fa, this message translates to:
  /// **'روشنایی'**
  String get photoEditorBrightness;

  /// No description provided for @photoEditorContrast.
  ///
  /// In fa, this message translates to:
  /// **'کنتراست'**
  String get photoEditorContrast;

  /// No description provided for @photoEditorSaturation.
  ///
  /// In fa, this message translates to:
  /// **'اشباع رنگ'**
  String get photoEditorSaturation;

  /// No description provided for @photoEditorExposure.
  ///
  /// In fa, this message translates to:
  /// **'نوردهی'**
  String get photoEditorExposure;

  /// No description provided for @photoEditorHue.
  ///
  /// In fa, this message translates to:
  /// **'رنگ‌مایه'**
  String get photoEditorHue;

  /// No description provided for @photoEditorTemperature.
  ///
  /// In fa, this message translates to:
  /// **'دمای رنگ'**
  String get photoEditorTemperature;

  /// No description provided for @photoEditorSharpness.
  ///
  /// In fa, this message translates to:
  /// **'وضوح'**
  String get photoEditorSharpness;

  /// No description provided for @photoEditorFade.
  ///
  /// In fa, this message translates to:
  /// **'محو شدن'**
  String get photoEditorFade;

  /// No description provided for @photoEditorLuminance.
  ///
  /// In fa, this message translates to:
  /// **'درخشندگی'**
  String get photoEditorLuminance;

  /// No description provided for @photoEditorUndoText.
  ///
  /// In fa, this message translates to:
  /// **'برگرداندن'**
  String get photoEditorUndoText;

  /// No description provided for @photoEditorRedoText.
  ///
  /// In fa, this message translates to:
  /// **'دوباره انجام دادن'**
  String get photoEditorRedoText;

  /// No description provided for @photoEditorBottomNavigationBarTextBlur.
  ///
  /// In fa, this message translates to:
  /// **'محو کردن'**
  String get photoEditorBottomNavigationBarTextBlur;

  /// No description provided for @photoEditorBottomNavigationBarTextSticker.
  ///
  /// In fa, this message translates to:
  /// **'برچسب'**
  String get photoEditorBottomNavigationBarTextSticker;

  /// No description provided for @photoEditorLoadingDialogMsg.
  ///
  /// In fa, this message translates to:
  /// **'لطفاً صبر کنید...'**
  String get photoEditorLoadingDialogMsg;

  /// No description provided for @photoEditorCloseEditorWarningTitle.
  ///
  /// In fa, this message translates to:
  /// **'بستن ویرایشگر تصویر؟'**
  String get photoEditorCloseEditorWarningTitle;

  /// No description provided for @photoEditorCloseEditorWarningMessage.
  ///
  /// In fa, this message translates to:
  /// **'آیا مطمئن هستید که می‌خواهید ویرایشگر تصویر را ببندید؟ تغییرات شما ذخیره نخواهد شد.'**
  String get photoEditorCloseEditorWarningMessage;

  /// No description provided for @photoEditorCloseEditorWarningConfirmBtn.
  ///
  /// In fa, this message translates to:
  /// **'تأیید'**
  String get photoEditorCloseEditorWarningConfirmBtn;

  /// No description provided for @photoEditorCloseEditorWarningCancelBtn.
  ///
  /// In fa, this message translates to:
  /// **'لغو'**
  String get photoEditorCloseEditorWarningCancelBtn;

  /// No description provided for @photoEditorImportStateHistoryMsg.
  ///
  /// In fa, this message translates to:
  /// **'ویرایشگر در حال راه‌اندازی است'**
  String get photoEditorImportStateHistoryMsg;

  /// No description provided for @photoEditorDoneLoadingMsg.
  ///
  /// In fa, this message translates to:
  /// **'تغییرات در حال اعمال هستند'**
  String get photoEditorDoneLoadingMsg;

  /// No description provided for @physicalDataGender.
  ///
  /// In fa, this message translates to:
  /// **'{gender, select, male{مرد} female{زن} other{ترجمه تعریف نشده}}'**
  String physicalDataGender(String gender);

  /// No description provided for @physicalActivityLevel.
  ///
  /// In fa, this message translates to:
  /// **'{activityLevel, select, sedentary{غیرفعال و زیاد میشینم} fairyActive{تقریبا فعال، هر هفته یکی دوبار ورزش میکنم و پیاده روی میکنم} moderatelyActive{فعال، هر هفته دو سه روز ورزش میکنم} active{خیلی فعال، هر هفته بیش از 3 بار با شدت بالا ورزش میکنم} veryActive{روزی دوبار ورزش میکنم} other{ترجمه تعریف نشده}}'**
  String physicalActivityLevel(String activityLevel);

  /// No description provided for @fitnessProfileImageGallaryTitle.
  ///
  /// In fa, this message translates to:
  /// **'تصاویر پیشرفت شما'**
  String get fitnessProfileImageGallaryTitle;

  /// No description provided for @fitnessProfileAddImageButton.
  ///
  /// In fa, this message translates to:
  /// **'افزودن تصویر جدید'**
  String get fitnessProfileAddImageButton;

  /// No description provided for @fitnessProfilePhysicalDataLabel.
  ///
  /// In fa, this message translates to:
  /// **'اطلاعات فیزیکی شما'**
  String get fitnessProfilePhysicalDataLabel;

  /// No description provided for @fitnessProfileRestingMetabolicRate.
  ///
  /// In fa, this message translates to:
  /// **'نرخ سوخت ساز در حالت استراحت'**
  String get fitnessProfileRestingMetabolicRate;

  /// No description provided for @fitnessProfileTotalDailyEnergyExpenditure.
  ///
  /// In fa, this message translates to:
  /// **'کل انرژی مصرفی روزانه'**
  String get fitnessProfileTotalDailyEnergyExpenditure;

  /// No description provided for @fitnessProfileBodyMassIndex.
  ///
  /// In fa, this message translates to:
  /// **'شاخص توده بدنی'**
  String get fitnessProfileBodyMassIndex;

  /// No description provided for @fitnessProfileBodyMassIndexPrime.
  ///
  /// In fa, this message translates to:
  /// **'BMI Prime'**
  String get fitnessProfileBodyMassIndexPrime;

  /// No description provided for @fitnessProfileBodyMassIndexLevelLabel.
  ///
  /// In fa, this message translates to:
  /// **'سطح شاخص توده بدنی'**
  String get fitnessProfileBodyMassIndexLevelLabel;

  /// No description provided for @fitnessProfileWaistCircumferenceToHeightRatio.
  ///
  /// In fa, this message translates to:
  /// **'نسبت دور کمر به قد'**
  String get fitnessProfileWaistCircumferenceToHeightRatio;

  /// No description provided for @fitnessProfileIsWaistCircumferenceToHeightRatioSafe.
  ///
  /// In fa, this message translates to:
  /// **'آیا نسبت دور کمر به قد ایمن است؟'**
  String get fitnessProfileIsWaistCircumferenceToHeightRatioSafe;

  /// No description provided for @fitnessProfileIsWaistCircumferenceSafeRange.
  ///
  /// In fa, this message translates to:
  /// **'آیا دور کمر در محدوده ایمن است؟'**
  String get fitnessProfileIsWaistCircumferenceSafeRange;

  /// No description provided for @yes.
  ///
  /// In fa, this message translates to:
  /// **'بله'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In fa, this message translates to:
  /// **'خیر'**
  String get no;

  /// No description provided for @fitnessProfileNA.
  ///
  /// In fa, this message translates to:
  /// **'در دسترس نیست'**
  String get fitnessProfileNA;

  /// No description provided for @fitnessProfileBmiDescription.
  ///
  /// In fa, this message translates to:
  /// **'شاخص توده بدنی شما {bmiValue} و در وضعیت {bmiDescriptive} هستید.'**
  String fitnessProfileBmiDescription(double bmiValue, String bmiDescriptive);

  /// No description provided for @fitnessProfileWaistCircumferencePhysicalDataHintLabel.
  ///
  /// In fa, this message translates to:
  /// **'دور کمر و دیابت'**
  String get fitnessProfileWaistCircumferencePhysicalDataHintLabel;

  /// No description provided for @fitnessProfileWaistCircumferenceToHeightRatioDescription.
  ///
  /// In fa, this message translates to:
  /// **'شاخص دور کمر به قد از شاخص توده بدنی برای ارزیابی خطرات مرتبط با سلامت دقیق‌تر است ، این نسبت هرچه به صفر نزدیک تر باشد وضعیت خطرات مرتبط با سلامتی برای شما کمتر میشود.'**
  String get fitnessProfileWaistCircumferenceToHeightRatioDescription;

  /// No description provided for @fitnessProfileWaistCircumferenceToHeightRatioAvailableDescription.
  ///
  /// In fa, this message translates to:
  /// **'شاخص دور کمر به قد برای شما {ratio} است'**
  String fitnessProfileWaistCircumferenceToHeightRatioAvailableDescription(double ratio);

  /// No description provided for @fitnessProfileWaistCircumferenceToHeightRatioNotAvailableDescription.
  ///
  /// In fa, this message translates to:
  /// **'شاخص دور کمر به قد برای شما در دسترس نیست، لطفا دور کمر خود را در قسمت اندازه گیری جدید در صفحه قبل، اندازه و اضافه کنید'**
  String get fitnessProfileWaistCircumferenceToHeightRatioNotAvailableDescription;

  /// No description provided for @fitnessProfileBmiWaistCircumferenceHealthDescription.
  ///
  /// In fa, this message translates to:
  /// **'خطرات مرتبط با سلامتی شامل بیماری های قلبی عروقی، بیماری کیسه صفرا، فشار خون بالا و دیابت نوع 2 میباشد.'**
  String get fitnessProfileBmiWaistCircumferenceHealthDescription;

  /// No description provided for @fitnessProfileBmiStatus.
  ///
  /// In fa, this message translates to:
  /// **'{bmiStatus, select, underweight{کمبود وزن} healthyWeight{عادی} overweight{اضافه وزن} obeseClassOne{چاقی کلاس 1} obeseClassTwo{چاقی کلاس 2} obeseClassThree{چاقی کلاس 3} other{ترجمه تعریف نشده}}'**
  String fitnessProfileBmiStatus(String bmiStatus);

  /// No description provided for @fitnessProfileWaistCircumferenceSafeRangeDescription.
  ///
  /// In fa, this message translates to:
  /// **'محدوده سالم اندازه دور کمر بهتر است کمتر از 94 سانتی متر در آقایان و 80 سانتی متر در خانم‌ها باشد.این شاخص با احتمال ابتلا به دیابت نوع 2 در ارتباط است'**
  String get fitnessProfileWaistCircumferenceSafeRangeDescription;

  /// No description provided for @fitnessProfileWaistCircumferenceSafeRangeNotAvailableDescription.
  ///
  /// In fa, this message translates to:
  /// **'شاخص محدوده مجاز دور کمر برای شما در دسترس نیست، لطفا دور کمر خود را در قسمت اندازه گیری جدید در صفحه قبل، اندازه و اضافه کنید'**
  String get fitnessProfileWaistCircumferenceSafeRangeNotAvailableDescription;

  /// No description provided for @fitnessProfileIsWaistCircumferenceSafeRangeDescription.
  ///
  /// In fa, this message translates to:
  /// **'{isWaistCircumferenceSafeRange, select, true{دور کمر شما در محدوده مجاز می‌باشد} false{دور کمر شما از محدوده مجاز بیشتر است و احتمال ابتلا به دیابت نوع 2 در شما بیشتر است. لطفا چربی خود را سریع کاهش دهید} other{ترجمه تعریف نشده}}'**
  String fitnessProfileIsWaistCircumferenceSafeRangeDescription(String isWaistCircumferenceSafeRange);

  /// No description provided for @fitnessProfileNewMeasurementLabel.
  ///
  /// In fa, this message translates to:
  /// **'اندازه‌گیری جدید'**
  String get fitnessProfileNewMeasurementLabel;

  /// No description provided for @fitnessProfileNewMeasurementDialogArmCircumference.
  ///
  /// In fa, this message translates to:
  /// **'دور بازو'**
  String get fitnessProfileNewMeasurementDialogArmCircumference;

  /// No description provided for @fitnessProfileNewMeasurementDialogChestCircumference.
  ///
  /// In fa, this message translates to:
  /// **'دور سینه'**
  String get fitnessProfileNewMeasurementDialogChestCircumference;

  /// No description provided for @fitnessProfileNewMeasurementDialogThighCircumference.
  ///
  /// In fa, this message translates to:
  /// **'دور ران'**
  String get fitnessProfileNewMeasurementDialogThighCircumference;

  /// No description provided for @fitnessProfileNewMeasurementDialogCalfMuscleCircumference.
  ///
  /// In fa, this message translates to:
  /// **'دور ماهیچه ساق پا'**
  String get fitnessProfileNewMeasurementDialogCalfMuscleCircumference;

  /// No description provided for @fitnessProfileNewMeasurementDialogHipCircumference.
  ///
  /// In fa, this message translates to:
  /// **'دور باسن'**
  String get fitnessProfileNewMeasurementDialogHipCircumference;

  /// No description provided for @fitnessProfileNewMeasurementDialogWaistCircumference.
  ///
  /// In fa, this message translates to:
  /// **'دور کمر'**
  String get fitnessProfileNewMeasurementDialogWaistCircumference;

  /// No description provided for @fitnessProfileNewMeasurementDialogGender.
  ///
  /// In fa, this message translates to:
  /// **'جنسیت'**
  String get fitnessProfileNewMeasurementDialogGender;

  /// No description provided for @fitnessProfileNewMeasurementDialogActivityLevel.
  ///
  /// In fa, this message translates to:
  /// **'سطح فعالیت'**
  String get fitnessProfileNewMeasurementDialogActivityLevel;

  /// No description provided for @fitnessProfileNewMeasurementBirthday.
  ///
  /// In fa, this message translates to:
  /// **'تاریخ تولد'**
  String get fitnessProfileNewMeasurementBirthday;

  /// No description provided for @fitnessProfileNewMeasurementHeight.
  ///
  /// In fa, this message translates to:
  /// **'قد'**
  String get fitnessProfileNewMeasurementHeight;

  /// No description provided for @fitnessProfileNewMeasurementWeight.
  ///
  /// In fa, this message translates to:
  /// **'وزن'**
  String get fitnessProfileNewMeasurementWeight;

  /// No description provided for @measurementUnitCM.
  ///
  /// In fa, this message translates to:
  /// **'سانتی‌متر'**
  String get measurementUnitCM;

  /// No description provided for @measurementUnitKG.
  ///
  /// In fa, this message translates to:
  /// **'کیلوگرم'**
  String get measurementUnitKG;

  /// No description provided for @measurementUnitGram.
  ///
  /// In fa, this message translates to:
  /// **'گرم'**
  String get measurementUnitGram;

  /// No description provided for @measurementUnitCalorie.
  ///
  /// In fa, this message translates to:
  /// **'کیلوکالری'**
  String get measurementUnitCalorie;

  /// No description provided for @fitnessProfilePhysicaDataChart.
  ///
  /// In fa, this message translates to:
  /// **'نمودار پیشرفت شما'**
  String get fitnessProfilePhysicaDataChart;

  /// No description provided for @fitnessProfileDeleteDataPointDialogLabel.
  ///
  /// In fa, this message translates to:
  /// **'حذف اندازه'**
  String get fitnessProfileDeleteDataPointDialogLabel;

  /// No description provided for @fitnessProfileDeleteDataPointDialogDescription.
  ///
  /// In fa, this message translates to:
  /// **'آیا از حذف این اندازه مطمئن هستید؟'**
  String get fitnessProfileDeleteDataPointDialogDescription;

  /// No description provided for @foodReportUserFoodRequirementFrom.
  ///
  /// In fa, this message translates to:
  /// **'از'**
  String get foodReportUserFoodRequirementFrom;

  /// No description provided for @foodReportTabLabelRestDay.
  ///
  /// In fa, this message translates to:
  /// **'روز استراحت'**
  String get foodReportTabLabelRestDay;

  /// No description provided for @foodReportTabLabelTrainingDay.
  ///
  /// In fa, this message translates to:
  /// **'روز تمرین'**
  String get foodReportTabLabelTrainingDay;

  /// No description provided for @foodReportBannerContent.
  ///
  /// In fa, this message translates to:
  /// **'مشخصات تغذیه شما دردسترس نیست. لطفا مشخصات خود را در صفحه تناسب اندام کامل کنید'**
  String get foodReportBannerContent;

  /// No description provided for @foodReportBannerGotoLabel.
  ///
  /// In fa, this message translates to:
  /// **'رفتن به صفحه تناسب اندام'**
  String get foodReportBannerGotoLabel;

  /// No description provided for @foodReportFoodsStatics.
  ///
  /// In fa, this message translates to:
  /// **'وضعیت خوراک امروز'**
  String get foodReportFoodsStatics;

  /// No description provided for @foodReportDeleteDialogTitle.
  ///
  /// In fa, this message translates to:
  /// **'حذف غذا'**
  String get foodReportDeleteDialogTitle;

  /// No description provided for @foodReportDeleteDialogContent.
  ///
  /// In fa, this message translates to:
  /// **'آیا این غذا حذف شود؟'**
  String get foodReportDeleteDialogContent;

  /// No description provided for @foodReportFoodsListLabel.
  ///
  /// In fa, this message translates to:
  /// **'‌لیست خوراکی‌ها'**
  String get foodReportFoodsListLabel;

  /// No description provided for @foodReportUserFoodRequirementNA.
  ///
  /// In fa, this message translates to:
  /// **'N/A'**
  String get foodReportUserFoodRequirementNA;

  /// No description provided for @appRoutesName.
  ///
  /// In fa, this message translates to:
  /// **'{routesNames, select, loginRoute{ورود} registerRoute{ثبت نام} searchRoute{جستجو} resultRoute{نتیجه} forgotPassRoute{فراموشی رمز عبور} verificationRoute{تایید شماره} profileRoute{پروفایل} fitnessProfileRoute{ترکیب بدن | تناسب اندام} foodReportRoute{گزارش تغذیه} vo2maxCalculator{هوازی | حداکثر کاهش چربی} other{ترجمه تعریف نشده}}'**
  String appRoutesName(String routesNames);

  /// No description provided for @wellcomeMessage.
  ///
  /// In fa, this message translates to:
  /// **'سلام'**
  String get wellcomeMessage;

  /// No description provided for @appAsyncCardStatusText.
  ///
  /// In fa, this message translates to:
  /// **'{asyncStatus, select, inital{بدون داده} loading{درحال بارگیری} serverConnectionError{خطای سرور ، دوباره تلاش کنید} internetConnectionError{خطای اینترنت. اینترنت خود را وصل کنید} success{داده ای برای نمایش دادن نیست} other{ترجمه تعریف نشده}}'**
  String appAsyncCardStatusText(String asyncStatus);

  /// No description provided for @bazzarNotFound.
  ///
  /// In fa, this message translates to:
  /// **'کافه بازار نصب نشده است. کافه بازار را نصب کنید'**
  String get bazzarNotFound;

  /// No description provided for @bazzarSuccessfulPayment.
  ///
  /// In fa, this message translates to:
  /// **'اشتراک با موفقیت اضافه شد.برای اضافه کردن غذا اشتراک را تمدید نمایید'**
  String get bazzarSuccessfulPayment;

  /// No description provided for @bazzarFailPayment.
  ///
  /// In fa, this message translates to:
  /// **'فرآیند تمدید اشتراک لغو شد'**
  String get bazzarFailPayment;

  /// No description provided for @addMeasurementDialogHintTitle.
  ///
  /// In fa, this message translates to:
  /// **'شکل بدن'**
  String get addMeasurementDialogHintTitle;

  /// No description provided for @addMeasurementDialogHintText1.
  ///
  /// In fa, this message translates to:
  /// **'بخاطر پیشگیری از وسواس فکری بیش از هفته‌ای یکبار خود را وزن نکنید.'**
  String get addMeasurementDialogHintText1;

  /// No description provided for @addMeasurementDialogHintText2.
  ///
  /// In fa, this message translates to:
  /// **'اندازه گیری شکل بدن نسبت به اندازه گیری وزن بیشتر باعث انگیزه تناسب اندام میشود.'**
  String get addMeasurementDialogHintText2;

  /// No description provided for @addMeasurementDialogHintText3.
  ///
  /// In fa, this message translates to:
  /// **'با اندازه گیری شکل بدن متوجه میشوید توزیع کاهش چربی در بدن چه شکلی داشته'**
  String get addMeasurementDialogHintText3;

  /// No description provided for @addMeasurementDialogHintText4.
  ///
  /// In fa, this message translates to:
  /// **'زمان اندازه گیری ماهیچه سرد باشد.'**
  String get addMeasurementDialogHintText4;

  /// No description provided for @addMeasurementDialogHintText5.
  ///
  /// In fa, this message translates to:
  /// **'حداکثر انقباض یا قطر ماهیچه را اندازه بگیرید.'**
  String get addMeasurementDialogHintText5;

  /// No description provided for @addMeasurementDialogHintText6.
  ///
  /// In fa, this message translates to:
  /// **'روش اندازه گیری دور کمر به توصیه سازمان بهداشت جهانی و فدراسیون بین المللی دیابت '**
  String get addMeasurementDialogHintText6;

  /// No description provided for @addMeasurementDialogHintText6Bold.
  ///
  /// In fa, this message translates to:
  /// **'بین پایین ترین دنده ها و ستیغ تهیگاهی '**
  String get addMeasurementDialogHintText6Bold;

  /// No description provided for @addMeasurementDialogHintText7.
  ///
  /// In fa, this message translates to:
  /// **'است.'**
  String get addMeasurementDialogHintText7;

  /// No description provided for @addMeasurementDialogHintText8.
  ///
  /// In fa, this message translates to:
  /// **'بالاتر از ناف باشد و پوست زیر متر جمع نشود'**
  String get addMeasurementDialogHintText8;

  /// No description provided for @foodRequerementDialogGeneralRecommendationTitle.
  ///
  /// In fa, this message translates to:
  /// **'ویتامین و موادمعدنی'**
  String get foodRequerementDialogGeneralRecommendationTitle;

  /// No description provided for @foodRequerementDialogGeneralRecommendationVitaminTitle.
  ///
  /// In fa, this message translates to:
  /// **'ویتامین و مواد معدنی'**
  String get foodRequerementDialogGeneralRecommendationVitaminTitle;

  /// No description provided for @foodRequerementDialogGeneralRecommendationVitaminText2.
  ///
  /// In fa, this message translates to:
  /// **'با مصرف میوه و سبزی با رنگ هاب مختلف در روز استراحت معمولا نیاز به ویتامین و مواد معدنی تامین میشود و برای تشخصی کمبود ویتامین و مواد معدنی به پزشک مراجعه کنید.'**
  String get foodRequerementDialogGeneralRecommendationVitaminText2;

  /// No description provided for @foodRequerementDialogGeneralRecommendationVitaminText3.
  ///
  /// In fa, this message translates to:
  /// **'در صبح میزان هرمون هپسیدین در کمترین مقدار هست و آهن بهتر هست در صبح خورده بشه مثل املت اسفناج یا جگر که جذب را حداکثر میکند.'**
  String get foodRequerementDialogGeneralRecommendationVitaminText3;

  /// No description provided for @foodRequerementDialogGeneralRecommendationVitaminText4.
  ///
  /// In fa, this message translates to:
  /// **'مصرف آهن برای انتقال اکسیژن در خون و مایچه مهم هست (هموگلوبین و میوگلوبین) . بعد از تمرین بخاطر اثر التهاب ، سطح هرمون تنظیم آهن یعنی هپسیدین به مدت 3 تا 6 ساعت بعد تمرین زیاد میشه و جذب آهن کاهش پیدا میکند و آهن در این مدت کمتر از صبح جذب میشود.'**
  String get foodRequerementDialogGeneralRecommendationVitaminText4;

  /// No description provided for @foodRequerementDialogGeneralRecommendationVitaminText5.
  ///
  /// In fa, this message translates to:
  /// **'غذاهای غنی از آهن عبارتند از گوشت و کله پاچه، ساردین، ماهی تن، غلات سبوس دار، زرده تخم مرغ، لوبیا، عدس، سبزیجات برگ سبز، زردآلو خشک، آجیل و دانه ها. '**
  String get foodRequerementDialogGeneralRecommendationVitaminText5;

  /// No description provided for @foodRequerementDialogGeneralRecommendationVitaminText6.
  ///
  /// In fa, this message translates to:
  /// **'جذب آهن با مصرف ویتامین سی مانند پرتقال افزایش پیدا میکنه'**
  String get foodRequerementDialogGeneralRecommendationVitaminText6;

  /// No description provided for @foodRequerementDialogGeneralRecommendationVitaminText7.
  ///
  /// In fa, this message translates to:
  /// **'آهن و زینک و کلسیم دارای سیستم جذب و انتقال یکسان هستند پس مصرف زیاد آهن باعث کاهش جذب زینک و کلسیم میشه پس اگر صبح مواد غذایی شامل آهن میخورید سعی کنید مواد غذایی شامل کلسیم مثل شیر یا مواد غذایی شامل زینک مثل گوشت قرمز یا غلات کامل را با آن نخورید.'**
  String get foodRequerementDialogGeneralRecommendationVitaminText7;

  /// No description provided for @foodRequerementDialogGeneralRecommendationProperSleepTitle.
  ///
  /// In fa, this message translates to:
  /// **'خواب'**
  String get foodRequerementDialogGeneralRecommendationProperSleepTitle;

  /// No description provided for @foodRequerementDialogGeneralRecommendationProperSleepText1.
  ///
  /// In fa, this message translates to:
  /// **'خواب کم و شب بیداری باعث افزایش کورتیزل و پرخوری میشود. در نتیجه خوردن قند و چربی زیادتر از نیاز روزانه تان، به شکل چربی و وزن اضافه در بدن جمع میشود .'**
  String get foodRequerementDialogGeneralRecommendationProperSleepText1;

  /// No description provided for @foodRequerementDialogGeneralRecommendationProperSleepText2.
  ///
  /// In fa, this message translates to:
  /// **'اگر میخواهید صبح زودتر بیدار شوید، شب 7 تا 8 ساعت زودتر بخواب بروید'**
  String get foodRequerementDialogGeneralRecommendationProperSleepText2;

  /// No description provided for @foodRequerementDialogGeneralRecommendationStressTitle.
  ///
  /// In fa, this message translates to:
  /// **'استرس'**
  String get foodRequerementDialogGeneralRecommendationStressTitle;

  /// No description provided for @foodRequerementDialogGeneralRecommendationStressText1.
  ///
  /// In fa, this message translates to:
  /// **'استرس روزمره و کاری باعث افزایش هورمون کورتیزل و اضطراب میشود و پاسخ طبیعی و ساده معمولا خوردن قند و چربی و نمک زیاد برای افزایش هورمون دوپامین جهت خنثی کردن اضطراب و استرس است. '**
  String get foodRequerementDialogGeneralRecommendationStressText1;

  /// No description provided for @foodRequerementDialogGeneralRecommendationStressText2.
  ///
  /// In fa, this message translates to:
  /// **'در حالت استرس ،میتوانید نفس عمیق بکشید و آب بخورید و ریشه مسئله را پیدا و حل کنید.'**
  String get foodRequerementDialogGeneralRecommendationStressText2;

  /// No description provided for @foodRequerementDialogHydrationTitle.
  ///
  /// In fa, this message translates to:
  /// **'آب'**
  String get foodRequerementDialogHydrationTitle;

  /// No description provided for @foodRequerementDialogHydrationRestDayText1.
  ///
  /// In fa, this message translates to:
  /// **'نوشیدن ۵۰۰ میلی‌لیتر آب نیم ساعت قبل از هر وعده غذایی همراه با رژیم کم‌کالری می‌تواند به کاهش وزن بیشتر در افراد میانسال و مسن دارای اضافه وزن یا چاقی کمک کند. این کار ساده و بی‌خطر است، اما برای افراد با نارسایی قلبی یا مشکلات شدید کلیوی توصیه نمی‌شود.'**
  String get foodRequerementDialogHydrationRestDayText1;

  /// No description provided for @foodRequerementDialogHydrationRestDayText2.
  ///
  /// In fa, this message translates to:
  /// **'نوشیدن آب همراه غذا، به ویژه غذاهای جامد مانند برنج و نان، می‌تواند به فرآیند هضم کمک کند؛ زیرا آب به نرم شدن غذا و عملکرد بهتر آنزیم‌های گوارشی یاری می‌رساند.'**
  String get foodRequerementDialogHydrationRestDayText2;

  /// No description provided for @foodRequerementDialogHydrationRestDayText3.
  ///
  /// In fa, this message translates to:
  /// **'معده یک عضو ماهیچه‌ای با قابلیت انقباض و انبساط است و نوشیدن آب همراه با غذا یا سایر مواد غذایی باعث بزرگ شدن دائمی آن نمی‌شود؛ معده پس از تخلیه، به اندازه طبیعی خود بازمی‌گردد'**
  String get foodRequerementDialogHydrationRestDayText3;

  /// No description provided for @foodRequerementDialogHydrationRestDayText4.
  ///
  /// In fa, this message translates to:
  /// **'معده یک عضو ماهیچه‌ای با قابلیت انقباض و انبساط است و نوشیدن آب همراه با غذا یا سایر مواد غذایی باعث بزرگ شدن دائمی آن نمی‌شود؛ معده پس از تخلیه، به اندازه طبیعی خود بازمی‌گردد'**
  String get foodRequerementDialogHydrationRestDayText4;

  /// No description provided for @foodRequerementDialogHydrationRestDayText5.
  ///
  /// In fa, this message translates to:
  /// **'اگر در منطقه معتدل آب و هوایی زندگی میکنید خوردن حداقل {waterVolume} لیتر آب برای شما نیاز است مهم نیست آب از دمنوش و چای و قهوه یا آب میوه یا نوشیدنی انرژی باشد. هرچه محیط گرم تر باشد آب بیشتری نیاز دارید و برعکس.'**
  String foodRequerementDialogHydrationRestDayText5(double waterVolume);

  /// No description provided for @foodRequerementDialogHydrationTrainingTitle.
  ///
  /// In fa, this message translates to:
  /// **'آب‌رسانی'**
  String get foodRequerementDialogHydrationTrainingTitle;

  /// No description provided for @foodRequerementDialogHydrationTrainingDayText1.
  ///
  /// In fa, this message translates to:
  /// **'کم‌آبی بدن باعث استرس قلبی‌عروقی می‌شود و دمای مرکزی بدن را افزایش می‌دهد.'**
  String get foodRequerementDialogHydrationTrainingDayText1;

  /// No description provided for @foodRequerementDialogHydrationTrainingDayText2.
  ///
  /// In fa, this message translates to:
  /// **'پس از تمرین، آب را در چند نوبت و همراه با کمی نمک یا طعم‌دهنده بنوشید تا حجم خون به‌یکباره افزایش نیابد و بدن دچار کم‌آبی نشود؛ مصرف آب خالی می‌تواند احساس تشنگی را کاهش دهد و باعث ادرار بیشتر شود، در نتیجه ممکن است پیش از رفع کامل تشنگی نوشیدن آب را متوقف کنید.'**
  String get foodRequerementDialogHydrationTrainingDayText2;

  /// No description provided for @foodRequerementDialogHydrationTrainingDayText3.
  ///
  /// In fa, this message translates to:
  /// **'با توجه به وزن شما، نوشیدن {fiveTimeWeight} تا {tenTimeWeight} میلی‌لیتر آب ۲ تا ۴ ساعت قبل از تمرین توصیه می‌شود. اگر ادرار نکردید یا رنگ ادرار تیره بود، باید آب بیشتری بنوشید.'**
  String foodRequerementDialogHydrationTrainingDayText3(int fiveTimeWeight, int tenTimeWeight);

  /// No description provided for @foodRequerementDialogHydrationTrainingDayText4.
  ///
  /// In fa, this message translates to:
  /// **'پس از ورزش، توصیه می‌شود ۱.۲۵ تا ۱.۵ برابر حجم مایعی که در طول تمرین از دست داده‌اید مصرف کنید.'**
  String get foodRequerementDialogHydrationTrainingDayText4;

  /// No description provided for @foodRequerementDialogHydrationTrainingDayText5.
  ///
  /// In fa, this message translates to:
  /// **'در فعالیت‌های سبک یا متوسط زیر ۴۵ دقیقه، آب کافی است. در تمرینات شدیدتر و طولانی‌تر (بیش از ۶۰ تا ۹۰ دقیقه)، نوشیدنی ورزشی با ۴۰ تا ۸۰ گرم کربوهیدرات در هر لیتر توصیه می‌شود. برای تمرینات ۱ تا ۲.۵ ساعت، مصرف ۳۰ تا ۶۰ گرم کربوهیدرات در ساعت و برای تمرینات شدیدتر بیش از ۲.۵ ساعت، تا ۹۰ گرم کربوهیدرات در ساعت (ترکیبی) پیشنهاد می‌شود.'**
  String get foodRequerementDialogHydrationTrainingDayText5;

  /// No description provided for @foodRequerementDialogHydrationTrainingDayText6.
  ///
  /// In fa, this message translates to:
  /// **'سدیم در نوشیدنی ورزشی باعث افزایش میل به نوشیدن، حفظ آب بدن و خوش‌طعم‌تر شدن نوشیدنی می‌شود. کربوهیدرات به جذب بهتر آب و تأمین انرژی کمک می‌کند. نوشیدنی‌های انرژی‌زا حاوی کافئین می‌توانند عملکرد هوازی و بی‌هوازی را بهبود دهند.'**
  String get foodRequerementDialogHydrationTrainingDayText6;

  /// No description provided for @foodRequerementDialogHydrationTrainingDayText7.
  ///
  /// In fa, this message translates to:
  /// **'نوشیدنی‌های ورزشی، نوشابه‌های گازدار و آبمیوه‌ها می‌توانند به دلیل اسیدیته بالا باعث فرسایش مینای دندان شوند؛ این اثر در حین ورزش به دلیل کاهش بزاق تشدید می‌شود.'**
  String get foodRequerementDialogHydrationTrainingDayText7;

  /// No description provided for @foodRequerementDialogHydrationTrainingDayText8.
  ///
  /// In fa, this message translates to:
  /// **'برای محافظت از دندان‌ها: از بطری با نی یا نازل استفاده کنید، آب را به طور متناوب بنوشید و از نوشیدن مداوم یا چرخاندن نوشیدنی در دهان خودداری کنید.'**
  String get foodRequerementDialogHydrationTrainingDayText8;

  /// No description provided for @foodRequerementDialogHydrationTrainingDayText9.
  ///
  /// In fa, this message translates to:
  /// **'برای بررسی وضعیت آب بدن خود، به رنگ ادرار در ابتدای صبح توجه کنید. ادرار رقیق و کم‌رنگ نشان‌دهنده آب رسانی مناسب است، در حالی که رنگ تیره و حجم کم می‌تواند به معنای کم‌آبی بدن باشد که نیازمند نوشیدن آب بیشتر، به خصوص قبل از تمرین، است.'**
  String get foodRequerementDialogHydrationTrainingDayText9;

  /// No description provided for @foodRequerementDialogHydrationTrainingDayText10.
  ///
  /// In fa, this message translates to:
  /// **'کم ابی یا هایپوهیدراشن به روزهای قبل و تمرین های قبلی بستگی داره و کم آبی امروز روی تمرین فردا تاثیر میگذارد.'**
  String get foodRequerementDialogHydrationTrainingDayText10;

  /// No description provided for @foodRequerementDialogCarbohydrateRestDayText1.
  ///
  /// In fa, this message translates to:
  /// **'قند و شکر که اغلب از نیشکر یا چغندر قند فرآوری می‌شوند، نوعی کربوهیدرات هستند. مصرف نوشیدنی‌های حاوی قند افزوده می‌تواند به پوسیدگی دندان منجر شود. این نوع قندها معمولاً در غذاهای فرآوری شده‌ای مانند شکلات، بیسکویت (که اغلب چربی بالایی دارند) یا چیپس (که نمک زیادی دارند) یافت می‌شوند. این دسته از غذاهای فرآوری شده انرژی زیادی دارند اما از نظر مواد مغذی و فیبر فقیر هستند و حجم کمی نسبت به انرژی خود دارند که می‌تواند منجر به احساس گرسنگی زودهنگام شود و دریافت انرژی بیش از نیاز بدن شما بگردد.'**
  String get foodRequerementDialogCarbohydrateRestDayText1;

  /// No description provided for @foodRequerementDialogCarbohydrateRestDayText2.
  ///
  /// In fa, this message translates to:
  /// **'توصیه می‌شود حداکثر 5 درصد از انرژی روزانه شما، معادل حدود {fivePercentCalorie} کیلوکالری، از قندهای افزوده تأمین شود. این مقدار شکر برای شما تقریباً معادل {sugarCubeCount} حبه قند است که شامل قند موجود در غذاهای فرآوری‌شده، شربت‌ها، آبمیوه‌ها و عسل می‌شود و قندهای طبیعی موجود در شیر، سبزیجات و میوه‌ها را در بر نمی‌گیرد.'**
  String foodRequerementDialogCarbohydrateRestDayText2(int fivePercentCalorie, int sugarCubeCount);

  /// No description provided for @foodRequerementDialogCarbohydrateRestDayText3.
  ///
  /// In fa, this message translates to:
  /// **'کربوهیدرات اصلی موجود در میوه‌ها، فروکتوز است. مصرف زیاد فروکتوز در افراد کم‌تحرک می‌تواند باعث افزایش تری‌گلیسیرید و چربی خون شود. با این حال، اگر فعالیت بدنی منظمی دارید، تأثیر آن بر چربی خون معمولاً ناچیز است.'**
  String get foodRequerementDialogCarbohydrateRestDayText3;

  /// No description provided for @foodRequerementDialogCarbohydrateRestDayText4.
  ///
  /// In fa, this message translates to:
  /// **'حتی در صورت کم‌تحرکی، توصیه می‌شود روزانه حداقل 2 تا 3 واحد میوه مصرف کنید؛ زیرا میوه‌ها منبع عالی آب برای هیدراسیون بدن، فیبر برای تقویت سیستم ایمنی و ترکیبات فیتوشیمیایی برای مقابله با التهاب و اکسیدان‌ها هستند.'**
  String get foodRequerementDialogCarbohydrateRestDayText4;

  /// No description provided for @foodRequerementDialogCarbohydrateRestDayText5.
  ///
  /// In fa, this message translates to:
  /// **'در هر وعده غذایی، تلاش کنید تا با تنوع بخشیدن به رنگ میوه‌ها و سبزیجات (سبز، قرمز، بنفش، زرد، سفید و نارنجی)، یک رنگین‌کمان از رنگ‌ها را در بشقاب خود داشته باشید. هر رنگ، حاوی مجموعه‌ای منحصربه‌فرد از مواد مغذی ساخته شده از نور خورشید (ترکیبات گیاهی مفید) است که بسیاری از آن‌ها به عنوان آنتی‌اکسیدان عمل کرده و به محافظت از سلول‌ها در برابر آسیب و کاهش التهاب پس از ورزش کمک می‌کنند.'**
  String get foodRequerementDialogCarbohydrateRestDayText5;

  /// No description provided for @foodRequerementDialogCarbohydrateRestDayText6.
  ///
  /// In fa, this message translates to:
  /// **'در روزهای استراحت، با مصرف بیشتر میوه‌ها و سبزیجات، نیازهای ویتامینی و فیبر بدن را تأمین کنید؛ در روزهای تمرین نیز، برای تأمین انرژی مورد نیاز عضلات، بر مصرف کربوهیدرات‌های پیچیده و غنی تمرکز داشته باشید.'**
  String get foodRequerementDialogCarbohydrateRestDayText6;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceTitle.
  ///
  /// In fa, this message translates to:
  /// **'کربوهیدرات قبل از ورزش'**
  String get foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceTitle;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText1.
  ///
  /// In fa, this message translates to:
  /// **'زمان و مقدار مصرف کربوهیدرات پیش از تمرین با یکدیگر مرتبط هستند. به طور کلی، می‌توانید ۱ تا ۴ گرم کربوهیدرات به ازای هر کیلوگرم وزن بدن، از ۱ تا ۴ ساعت پیش از شروع تمرین مصرف کنید. برای نمونه، با وزن {weight} کیلوگرم، اگر ۲ ساعت تا آغاز تمرین باقی مانده است، می‌توانید {carbohydrate} گرم کربوهیدرات به همراه {protein} گرم پروتئین با کیفیت میل کنید.'**
  String foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText1(int weight, int carbohydrate, int protein);

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText2.
  ///
  /// In fa, this message translates to:
  /// **'مصرف کربوهیدرات ۱ تا ۴ ساعت پیش از تمرین به افزایش ذخیره گلیکوژن و بهبود عملکرد تمرین کمک می‌کند. خوردن کربوهیدرات تا ۲ ساعت قبل از تمرین، زمان کافی برای هضم و جذب آن را فراهم می‌سازد.'**
  String get foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText2;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText3.
  ///
  /// In fa, this message translates to:
  /// **'در صورتی که وعده غذایی خود را نزدیک به زمان تمرین میل کنید، ممکن است دچار سوهاضمه و ناراحتی معده شوید؛ زیرا هنگام تمرین، جریان خون از معده به سمت عضلات هدایت می‌شود تا اکسیژن را به عضلات برساند.'**
  String get foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText3;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText4.
  ///
  /// In fa, this message translates to:
  /// **'اگر پیش از تمرین دچار ناراحتی معده یا سوهاضمه شدید، توصیه می‌شود دو ساعت پیش از شروع تمرین یک میان‌وعده سبک و ساده با کربوهیدرات با شاخص گلیسمی بالا مانند موز یا سایر میوه‌های تازه یا خشک و یک مشت آجیل میل کنید. همچنین می‌توانید نان و کره مغزیجات (مانند کره پسته یا بادام‌زمینی) یا فرنی و جودوسر با شیر (اوتمیل) مصرف نمایید.'**
  String get foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText4;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceTitle.
  ///
  /// In fa, this message translates to:
  /// **'کربوهیدرات هنگام ورزش'**
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceTitle;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText1.
  ///
  /// In fa, this message translates to:
  /// **'تا پیش از ۴۵ دقیقه تمرین، به جز آب نیازی به مصرف ماده غذایی دیگری نیست؛ زیرا در این مدت، احتمال تخلیه ذخایر گلیکوژن پایین است.'**
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText1;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText2.
  ///
  /// In fa, this message translates to:
  /// **'برای تمرین‌های ۴۵ تا ۷۵ دقیقه‌ای، می‌توانید کربوهیدرات شیرین را بمکید یا بچشید تا هم پیام خستگی به مغز کاهش یابد و هم در صورت دشواری خوردن هنگام تمرین، از مشکلات گوارشی جلوگیری شود.'**
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText2;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText3.
  ///
  /// In fa, this message translates to:
  /// **'در تمرین‌های بیش از یک ساعت، می‌توانید به ازای هر ساعت، ۳۰ تا ۶۰ گرم کربوهیدرات بسته به شدت تمرین مصرف کنید. بدن قادر نیست بیش از ۱ گرم گلوکز در دقیقه را در عضله با اکسیژن ترکیب کند؛ مصرف بیش از ۶۰ گرم کربوهیدرات در ساعت ممکن است مشکلات گوارشی ایجاد کند و سود بیشتری نخواهد داشت.'**
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText3;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText4.
  ///
  /// In fa, this message translates to:
  /// **'حدود ۱۵ تا ۲۰ دقیقه طول می‌کشد تا کربوهیدرات مصرف‌شده به عضلات برسد؛ بنابراین، میان‌وعده تمرینی را پیش از شروع خستگی میل کنید. معمولاً هر ۲۰ تا ۳۰ دقیقه در طول تمرین می‌توانید کربوهیدرات مصرف نمایید.'**
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText4;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText5.
  ///
  /// In fa, this message translates to:
  /// **'سه نمونه از میان‌وعده‌های مناسب تمرین شامل یک عدد موز، دو عدد خرما یا یک عدد انبه است که هرکدام حدود ۳۰ گرم کربوهیدرات دارند. در صورت شدت بالای تمرین، می‌توانید تا دو برابر این مقدار مصرف کنید.'**
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText5;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceTitle.
  ///
  /// In fa, this message translates to:
  /// **'کربوهیدرات بعد از ورزش'**
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceTitle;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText1.
  ///
  /// In fa, this message translates to:
  /// **'گلیکوژن مصرف‌شده در طول تمرین باید برای تمرین‌های روزهای بعد جبران شود؛ در غیر این صورت، عملکرد تمرینات بعدی کاهش می‌یابد.'**
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText1;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText2.
  ///
  /// In fa, this message translates to:
  /// **'در دو ساعت پس از تمرین، ذخیره‌سازی گلیکوژن تا ۱۵۰ درصد بیشتر از حالت عادی انجام می‌شود.'**
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText2;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText3.
  ///
  /// In fa, this message translates to:
  /// **'در دو ساعت ابتدایی پس از تمرین، جذب گلوکز بیشتر است؛ زیرا هم میزان گلوکز خون افزایش یافته و هم نفوذپذیری غشای سلولی برای دریافت گلوکز نسبت به حالت عادی بیشتر می‌شود.'**
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText3;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText4.
  ///
  /// In fa, this message translates to:
  /// **'تا چهار ساعت پس از تمرین، می‌توانید به ازای هر کیلوگرم وزن بدن، ۱ تا ۱.۲ گرم کربوهیدرات در هر ساعت مصرف کنید که معادل {carbohydrateValu1} تا {carbohydrateValu2} گرم کربوهیدرات در هر ساعت است. این مقدار، حداکثر میزان کربوهیدراتی است که دستگاه گوارش می‌تواند در هر ساعت هضم کند.'**
  String foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText4(int carbohydrateValu1, int carbohydrateValu2);

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText5.
  ///
  /// In fa, this message translates to:
  /// **'توصیه می‌شود کربوهیدرات را همراه با پروتئین با کیفیت (حاوی لوسین) برای حداکثرسازی عضله‌سازی و تأمین گلیکوژن مصرف کنید.'**
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText5;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText6.
  ///
  /// In fa, this message translates to:
  /// **'مصرف پروتئین همراه با کربوهیدرات باعث ترشح بیشتر انسولین نسبت به مصرف تنها کربوهیدرات می‌شود. افزایش انسولین، جذب گلوکز و آمینواسیدهای پروتئین توسط سلول‌های عضلانی را افزایش داده و سطح کورتیزول را کاهش می‌دهد؛ در نتیجه، ترکیب پروتئین برای ساخت عضله بیشتر خواهد شد.'**
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText6;

  /// No description provided for @foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText7.
  ///
  /// In fa, this message translates to:
  /// **'وجود پروتئین در وعده غذایی پس از تمرین، به ساخت و ترمیم پروتئین عضلات کمک می‌کند و موجب کاهش تجزیه پروتئین و افزایش ذخیره پروتئین در عضلات برای بازسازی پس از تمرین می‌شود.'**
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText7;

  /// No description provided for @foodRequerementDialogProteinRestDayText1.
  ///
  /// In fa, this message translates to:
  /// **'سعی کنید هر 3 ساعت در 5 وعده و هر وعده به مقدار مساوی و منظم حدود {proteinPerMeal} گرم در هر وعده پروتئین بخورید*. پروتئین باعث سیری طولانی مدت تر نسبت به کربوهیدرات میشود و در کنار غلات سبوس دار و حبوبات فیبر دار باعث سیری و کاهش اشتها در روز میشود . 30 درصد از پروتئین را از منبع شیر و محصولات لبنی تامین کنید که همزمان غنی از کلسیم هستند.'**
  String foodRequerementDialogProteinRestDayText1(int proteinPerMeal);

  /// No description provided for @foodRequerementDialogProteinRestDayText2.
  ///
  /// In fa, this message translates to:
  /// **'تمام پروتئین های حیوانی مانند شیر و گوشت با کیفیت هستند. اگر 9 آمینو اسید ضروری در ماده غذایی تقریبا به اندازه نیاز بدن باشد به آنها پروتئین با کیفیت بالا میگیم، به همین خاطر بین مواد غذایی گیاهی ، سویا(شیر و ماست سویا) ، گندم سیاه، دانه کینوا، دانه چیا و دانه کنف یا شاهدانه غذای گیاهی شامل پروتئین با کیفیت بالا هستند.'**
  String get foodRequerementDialogProteinRestDayText2;

  /// No description provided for @foodRequerementDialogProteinRestDayText3.
  ///
  /// In fa, this message translates to:
  /// **'همچنین لوبیا، عدس، نخود، غلات و آجیل ها شامل برخی آمینو اسید های ضروری هستند که میتوانید با خوردن ترکیبی ازین مواد غذایی نیاز بدن به امینو اسید های ضروری را در 24 ساعت تامین کنید.برای مثال خوردن لوبیا و برنج و آجیل هر 9 آمینو اسید ضروری را تامین میکنند.'**
  String get foodRequerementDialogProteinRestDayText3;

  /// No description provided for @foodRequerementDialogProteinRestDayText4.
  ///
  /// In fa, this message translates to:
  /// **'پروتئین با مقدار جذب بیشتر از روده بزرگ و امتیاز بیشتر DIAAS : شیر و تخم مرغ و سویا و محصولات سویا و نخود  وعدس سبز و لوبیا سیاه و بادام زمینی و برنج سفید هستند. شما روزانه به {proteinPerBodyWeight} گرم پروتئین به ازای هر کیلو از وزن بدنتون نیاز دارید تا با توجه به سطح فعالیت هفتگی و سرعت کاهش وزن عضله‌های خود را حفظ و افزایش دهید.'**
  String foodRequerementDialogProteinRestDayText4(double proteinPerBodyWeight);

  /// No description provided for @foodRequerementDialogProteinRestDayText5.
  ///
  /// In fa, this message translates to:
  /// **'*مبتدیان مقدار پروتئین بیشتری نسبت به ورزشکار حرفه ای نیاز دارند ( تا 3 هفته اول 40 درصد بیشتر از افراد حرفه ای هست)'**
  String get foodRequerementDialogProteinRestDayText5;

  /// No description provided for @foodRequerementDialogProteinRestDayText6.
  ///
  /// In fa, this message translates to:
  /// **'اگر به اندازه کافی پروتئین بخورید میتوانید بدون ورزش و با حداقل کاهش ماهیچه ، چربی کم کنید.'**
  String get foodRequerementDialogProteinRestDayText6;

  /// No description provided for @foodRequerementDialogProteinRestDayText7.
  ///
  /// In fa, this message translates to:
  /// **'برای سرعت بیشتر کاهش چربی و تناسب اندام و همچنین افزایش ماهیچه میتوانید ورزش پرورش اندام یا دیگر ورزش ها مانند بوکس یا شنا را انجام دهید'**
  String get foodRequerementDialogProteinRestDayText7;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText1.
  ///
  /// In fa, this message translates to:
  /// **'مصرف غذای پروتئینی همراه با تمرین مقاومتی به ساخت ماهیچه کمک می‌کند. افزایش حجم ماهیچه باعث بالا رفتن نرخ سوخت‌وساز، کاهش سریع‌تر وزن، افزایش اعتماد به نفس و بهبود تناسب اندام می‌شود.'**
  String get foodRequerementDialogProteinTrainingDayText1;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText2.
  ///
  /// In fa, this message translates to:
  /// **'برای ساخت ماهیچه، مصرف پروتئین با کیفیت حاوی لوسین که سریع هضم و جذب می‌شود ضروری است. برای حداکثر عضله‌سازی باید آستانه لوسین (۲ تا ۳ گرم در هر وعده) تأمین شود.'**
  String get foodRequerementDialogProteinTrainingDayText2;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText3.
  ///
  /// In fa, this message translates to:
  /// **'مواد غذایی زیر حاوی ۲ تا ۳ گرم لوسین هستند و مصرف آن‌ها بعد از تمرین همراه با کربوهیدرات برای حداکثر عضله‌سازی توصیه می‌شود:'**
  String get foodRequerementDialogProteinTrainingDayText3;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText3SampleLucine1.
  ///
  /// In fa, this message translates to:
  /// **'۶۰۰ میلی‌لیتر شیر کامل'**
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine1;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText3SampleLucine2.
  ///
  /// In fa, this message translates to:
  /// **'۸۵ گرم پنیر چدار'**
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine2;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText3SampleLucine3.
  ///
  /// In fa, this message translates to:
  /// **'۴۵۰ گرم ماست ساده'**
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine3;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText3SampleLucine4.
  ///
  /// In fa, this message translates to:
  /// **'۴ عدد تخم‌مرغ (یک زرده و ۴ سفیده توصیه می‌شود)'**
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine4;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText3SampleLucine5.
  ///
  /// In fa, this message translates to:
  /// **'۸۵ گرم گوشت قرمز یا گوشت پرنده'**
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine5;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText3SampleLucine6.
  ///
  /// In fa, this message translates to:
  /// **'۱۰۰ گرم ماهی'**
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine6;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText3SampleLucine7.
  ///
  /// In fa, this message translates to:
  /// **'۱۷ گرم پودر پروتئین وی'**
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine7;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText3SampleLucine8.
  ///
  /// In fa, this message translates to:
  /// **'۴۰۰ گرم لوبیا یا عدس پخته‌شده'**
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine8;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText4.
  ///
  /// In fa, this message translates to:
  /// **'شیر حاوی آب، پروتئین، کربوهیدرات و مواد مغذی است و گزینه‌ای عالی برای ریکاوری عضلات بعد از تمرین محسوب می‌شود؛ زیرا به تأمین ذخیره گلیکوژن، ساخت ماهیچه و آب‌رسانی بدن کمک می‌کند. نوع شیر (کم‌چرب، پرچرب، شیر قهوه، شیر کاکائو یا طعم‌دار) تفاوتی ندارد.'**
  String get foodRequerementDialogProteinTrainingDayText4;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText5.
  ///
  /// In fa, this message translates to:
  /// **'برای ریکاوری و عضله‌سازی در پایان شب، مواد غذایی حاوی کازئین مانند شیر، ماست یا مکمل مصرف کنید. پروتئین باعث احساس سیری طولانی‌تر و خواب عمیق‌تر می‌شود.'**
  String get foodRequerementDialogProteinTrainingDayText5;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText6.
  ///
  /// In fa, this message translates to:
  /// **'پروتئین‌ها از آمینواسیدها ساخته شده‌اند. یازده نوع آمینواسید در بدن ساخته می‌شوند (آمینواسیدهای غیرضروری) و نه نوع دیگر باید از طریق رژیم غذایی تأمین شوند (آمینواسیدهای ضروری).'**
  String get foodRequerementDialogProteinTrainingDayText6;

  /// No description provided for @foodRequerementDialogProteinTrainingDayText7.
  ///
  /// In fa, this message translates to:
  /// **'پروتئین‌ها به طور مداوم در بدن تجزیه می‌شوند (تجزیه پروتئین عضله) و آمینواسیدها نیز به طور مداوم در ساخت پروتئین‌ها به کار می‌روند (سنتز پروتئین عضله).'**
  String get foodRequerementDialogProteinTrainingDayText7;

  /// No description provided for @foodRequerementDialogFatRestDayText1.
  ///
  /// In fa, this message translates to:
  /// **'مقدار مصرف چربی بر اساس توصیه سازمان‌های بهداشت جهانی، رژیم مدیترانه‌ای و سبک آشپزی ایرانی، حدود ۳۵ درصد انرژی روزانه است. کاهش مصرف چربی به کاهش وزن، کاهش شاخص توده بدنی و دور کمر و افزایش اعتماد به نفس کمک می‌کند. بیشترین میزان چربی‌سوزی بدن شما در محدوده ۶۲ تا ۶۳ درصد VO2max رخ می‌دهد.'**
  String get foodRequerementDialogFatRestDayText1;

  /// No description provided for @foodRequerementDialogFatRestDayText2.
  ///
  /// In fa, this message translates to:
  /// **'چربی بیشترین مقدار انرژی را در بین مواد غذایی دارد و مصرف زیاد آن به‌راحتی اتفاق می‌افتد. برای مثال، انرژی یک قاشق غذاخوری روغن معادل ۹ کیلوکالری ضربدر ۱۵ گرم یا ۱۳۵ کیلوکالری است؛ بنابراین به مقدار روغن مصرفی خود دقت کنید.'**
  String get foodRequerementDialogFatRestDayText2;

  /// No description provided for @foodRequerementDialogFatRestDayText3.
  ///
  /// In fa, this message translates to:
  /// **'۳۵ درصد انرژی روزانه باید از چربی‌ها تأمین شود که شامل سه بخش زیر است:'**
  String get foodRequerementDialogFatRestDayText3;

  /// No description provided for @foodRequerementDialogFatRestDayText4.
  ///
  /// In fa, this message translates to:
  /// **'۱۰ درصد چربی اشباع (معمولاً جامد یا نیمه‌جامد در دمای اتاق): روغن‌های گیاهی مانند پالم، نارگیل و کاکائو و همچنین چربی‌های حیوانی مانند دنبه، چربی بین بافت ماهیچه و گوشت، کره و موارد مشابه.'**
  String get foodRequerementDialogFatRestDayText4;

  /// No description provided for @foodRequerementDialogFatRestDayText5.
  ///
  /// In fa, this message translates to:
  /// **'چربی‌های موجود در محصولات لبنی به دلیل ساختار مولکولی خاص چربی شیر، کلسترول خون را افزایش نمی‌دهند و خطر بیماری قلبی عروقی ندارند. همچنین بخشی از چربی غیراشباع آن به دلیل ترکیب با کلسیم جذب بدن نمی‌شود.'**
  String get foodRequerementDialogFatRestDayText5;

  /// No description provided for @foodRequerementDialogFatRestDayText6.
  ///
  /// In fa, this message translates to:
  /// **'حداکثر ۱۲ درصد چربی غیراشباع تک‌زنجیره‌ای (معمولاً مایع در دمای اتاق): روغن زیتون، روغن کلزا، روغن آفتابگردان، بادام‌زمینی، روغن فندق و بادام، آووکادو، زیتون، آجیل و دانه‌ها.'**
  String get foodRequerementDialogFatRestDayText6;

  /// No description provided for @foodRequerementDialogFatRestDayText7.
  ///
  /// In fa, this message translates to:
  /// **'حداقل ۱۳ درصد چربی غیراشباع چندزنجیره‌ای (معمولاً مایع در دمای اتاق): امگا ۳ نوع EPA و DHA عمدتاً در ماهی‌های چرب مانند قزل‌آلا، سالمون و خال‌مخالی و به مقدار کمتر در ماهی تن وجود دارد. حداقل هفته‌ای یک بار ماهی چرب مصرف کنید. روغن کلزا با نسبت ۲ به ۱ امگا ۶ به امگا ۳ و نقطه دود ۱۷۰ درجه سانتی‌گراد برای پخت‌وپز مناسب است.'**
  String get foodRequerementDialogFatRestDayText7;

  /// No description provided for @foodRequerementDialogFatRestDayText8.
  ///
  /// In fa, this message translates to:
  /// **'چربی منبع مهمی از انرژی برای ورزش است. نسبت مصرف چربی و کربوهیدرات در بدن به شدت و مدت زمان فعالیت، سطح آمادگی جسمانی و رژیم غذایی قبل از ورزش بستگی دارد.'**
  String get foodRequerementDialogFatRestDayText8;

  /// No description provided for @foodRequerementDialogFatRestDayText9.
  ///
  /// In fa, this message translates to:
  /// **'سطح بالای کلسترول LDL یکی از عوامل اصلی بیماری‌های قلبی عروقی است. جایگزین کردن بخشی از چربی‌های اشباع با چربی‌های غیراشباع به کاهش کلسترول LDL و کاهش خطر بیماری قلبی کمک می‌کند.'**
  String get foodRequerementDialogFatRestDayText9;

  /// No description provided for @foodRequerementDialogFatRestDayText10.
  ///
  /// In fa, this message translates to:
  /// **'اسیدهای چرب امگا ۳ باعث کاهش التهاب و کاهش خطر بیماری‌های قلبی عروقی و سایر بیماری‌های مزمن می‌شوند.'**
  String get foodRequerementDialogFatRestDayText10;

  /// No description provided for @foodRequerementDialogFatRestDayText11.
  ///
  /// In fa, this message translates to:
  /// **'مصرف مکمل امگا ۳ می‌تواند به بهبود سازگاری عضلات، متابولیسم انرژی، ریکاوری عضلات و پیشگیری از آسیب کمک کند.'**
  String get foodRequerementDialogFatRestDayText11;

  /// No description provided for @vo2maxCalculatorText1.
  ///
  /// In fa, this message translates to:
  /// **'در طول تمرینات با شدت کم، چربی سوخت اصلی است، در حالی که کربوهیدرات سوخت اصلی در تمرینات با شدت بالا است.'**
  String get vo2maxCalculatorText1;

  /// No description provided for @vo2maxCalculatorText2.
  ///
  /// In fa, this message translates to:
  /// **'با این حال، اکسیداسیون کل چربی بر حسب گرم با افزایش شدت ورزش از کم به زیاد افزایش می‌یابد، حتی اگر درصد سهم چربی کاهش یابد. این به این دلیل است که کل انرژی مصرفی افزایش می‌یابد، یعنی کالری بیشتری در دقیقه می‌سوزانید.'**
  String get vo2maxCalculatorText2;

  /// No description provided for @vo2maxCalculatorText3.
  ///
  /// In fa, this message translates to:
  /// **'به طور متوسط، بالاترین نرخ اکسیداسیون چربی (\"fat max\") در ۶۲-۶۳٪ VO2max رخ می‌دهد.'**
  String get vo2maxCalculatorText3;

  /// No description provided for @vo2maxCalculatorText4.
  ///
  /// In fa, this message translates to:
  /// **'هر چه شدت تمرین بیشتر باشد، سرعت شکسته شدن گلیکوژن ماهیچه بیشتر می‌شود.'**
  String get vo2maxCalculatorText4;

  /// No description provided for @vo2maxCalculatorText5.
  ///
  /// In fa, this message translates to:
  /// **'برای محاسبه مقدار بهینه و بهترین سرعت برای حداکثر چربی‌سوزی ابتدا تست کوپر را اجرا می‌کنیم و سپس مقدار بهینه مسافتی که باید با سرعت تقریباً ثابت در زمان کاردیو راه بروید را محاسبه می‌کنیم.'**
  String get vo2maxCalculatorText5;

  /// No description provided for @vo2maxCalculatorText6.
  ///
  /// In fa, this message translates to:
  /// **'به مدت ۱۲ دقیقه روی تردمیل یا زمین صاف حداکثر مسافتی که می‌توانید، بدوید و سپس مسافت را به متر برای محاسبه VO2max در زیر وارد کنید.'**
  String get vo2maxCalculatorText6;

  /// No description provided for @vo2maxCalculatorLabelText.
  ///
  /// In fa, this message translates to:
  /// **'مسافت طی شده به متر'**
  String get vo2maxCalculatorLabelText;

  /// No description provided for @vo2maxCalculatorHintText.
  ///
  /// In fa, this message translates to:
  /// **'مسافت طی شده در ۱۲ دقیقه به متر'**
  String get vo2maxCalculatorHintText;

  /// No description provided for @vo2maxCalculatorVo2maxRate.
  ///
  /// In fa, this message translates to:
  /// **'مقدار VO2max شما {vo2max} میلی‌لیتر اکسیژن به ازای هر کیلوگرم وزن بدن در دقیقه (mL/kg/min) می‌باشد'**
  String vo2maxCalculatorVo2maxRate(double vo2max);

  /// No description provided for @vo2maxCalculatorVo2maxEfficientDistance.
  ///
  /// In fa, this message translates to:
  /// **'مسافت بهینه شما در 62 درصد VO2max در هر دقیقه {maxDistanceInMeterInOneMinues} متر میباشد'**
  String vo2maxCalculatorVo2maxEfficientDistance(double maxDistanceInMeterInOneMinues);

  /// No description provided for @vo2maxCalculatorVo2maxRecommandation.
  ///
  /// In fa, this message translates to:
  /// **'برای حداکثر کردن سرعت چربی سوزی بعد از تمرین مقاومتی بین 15 تا 30 دقیقه تمرین هوازی انجام دهید'**
  String get vo2maxCalculatorVo2maxRecommandation;

  /// No description provided for @vo2maxCalculatorVo2maxDistance.
  ///
  /// In fa, this message translates to:
  /// **'در {minutes} دقیقه مسافت {distance} متر را با سرعت متوسط طی کنید'**
  String vo2maxCalculatorVo2maxDistance(int minutes, int distance);

  /// No description provided for @timeRestrictedText1.
  ///
  /// In fa, this message translates to:
  /// **'فستینگ یا غذا خوردن با محدودیت زمانی، نوعی روزه‌داری متناوب است که شامل یک بازه روزه‌داری ۱۲ تا ۱۶ ساعته و یک بازه غذا خوردن ۸ تا ۱۲ ساعته در روز می‌شود.'**
  String get timeRestrictedText1;

  /// No description provided for @timeRestrictedText2.
  ///
  /// In fa, this message translates to:
  /// **'تنظیم وعده‌های غذایی بر اساس ریتم شبانه‌روزی (ساعت زیستی بدن) به بهبود عملکرد بدن، سلامت و کاهش وزن کمک می‌کند.'**
  String get timeRestrictedText2;

  /// No description provided for @timeRestrictedText3.
  ///
  /// In fa, this message translates to:
  /// **'مطالعات نشان داده‌اند که اختلال در ریتم شبانه‌روزی می‌تواند بر هورمون‌های کنترل‌کننده اشتها، مصرف انرژی و قند خون اثر منفی بگذارد.'**
  String get timeRestrictedText3;

  /// No description provided for @timeRestrictedText4.
  ///
  /// In fa, this message translates to:
  /// **'خوردن از ساعت ۸ صبح تا ۲ ظهر می‌تواند مفید باشد و اشتها و مصرف غذا را کاهش دهد.'**
  String get timeRestrictedText4;

  /// No description provided for @timeRestrictedText5.
  ///
  /// In fa, this message translates to:
  /// **'یک مطالعه نشان داده است که غذا خوردن در یک بازه ۶ ساعته پیش از ساعت ۳ بعدازظهر، گرسنگی و عوامل خطر دیابت نوع ۲ را در مردان مبتلا به پیش‌دیابت کاهش داده است.'**
  String get timeRestrictedText5;

  /// No description provided for @timeRestrictedText6.
  ///
  /// In fa, this message translates to:
  /// **'در فستینگ، به دلیل محدودیت زمانی غذا خوردن، احتمال دریافت کالری کمتر و کاهش وزن وجود دارد و همچنین با تنظیم وعده‌ها بر اساس ساعت زیستی بدن، از دیر خوردن شام جلوگیری می‌شود.'**
  String get timeRestrictedText6;

  /// No description provided for @timeRestrictedText7.
  ///
  /// In fa, this message translates to:
  /// **'بیشتر مطالعات فستینگ روی حیوانات انجام شده و شواهد انسانی محدود است؛ تنها تعداد کمی از مطالعات، کاهش وزن را در انسان‌ها نشان داده‌اند.'**
  String get timeRestrictedText7;

  /// No description provided for @timeRestrictedText8.
  ///
  /// In fa, this message translates to:
  /// **'در بازه غذا خوردن، مطابق نیاز انرژی و درشت‌مغذی‌های خود رژیم بگیرید.'**
  String get timeRestrictedText8;

  /// No description provided for @timeRestrictedText9.
  ///
  /// In fa, this message translates to:
  /// **'فستینگ‌های رایج شامل ۱۲ ساعت روزه‌داری و ۱۲ ساعت غذا خوردن است و می‌توانید تا ۱۶ ساعت روزه‌داری را افزایش دهید.'**
  String get timeRestrictedText9;

  /// No description provided for @timeRestrictedText10.
  ///
  /// In fa, this message translates to:
  /// **'نوشیدن مایعات مانند آب و دمنوش در تمام طول شبانه‌روز مجاز است.'**
  String get timeRestrictedText10;

  /// No description provided for @introductionSkipText.
  ///
  /// In fa, this message translates to:
  /// **'بعدا میبینم'**
  String get introductionSkipText;

  /// No description provided for @introductionDoneText.
  ///
  /// In fa, this message translates to:
  /// **'دیدم'**
  String get introductionDoneText;

  /// No description provided for @introductionNextText.
  ///
  /// In fa, this message translates to:
  /// **'جلو'**
  String get introductionNextText;

  /// No description provided for @introductionSingleIntroScreen1TitleText.
  ///
  /// In fa, this message translates to:
  /// **'لاغری سریع'**
  String get introductionSingleIntroScreen1TitleText;

  /// No description provided for @introductionSingleIntroScreen1DescriptionText.
  ///
  /// In fa, this message translates to:
  /// **'سریع‌ترین روش لاغری بدون دارو در جهان'**
  String get introductionSingleIntroScreen1DescriptionText;

  /// No description provided for @introductionSingleIntroScreen1BannerText.
  ///
  /// In fa, this message translates to:
  /// **'سریع'**
  String get introductionSingleIntroScreen1BannerText;

  /// No description provided for @introductionSingleIntroScreen2TitleText.
  ///
  /// In fa, this message translates to:
  /// **'تناسب اندام'**
  String get introductionSingleIntroScreen2TitleText;

  /// No description provided for @introductionSingleIntroScreen2DescriptionText.
  ///
  /// In fa, this message translates to:
  /// **'کاهش چربی و جذابیت اندام شما'**
  String get introductionSingleIntroScreen2DescriptionText;

  /// No description provided for @introductionSingleIntroScreen3TitleText.
  ///
  /// In fa, this message translates to:
  /// **'پشتیبانی'**
  String get introductionSingleIntroScreen3TitleText;

  /// No description provided for @introductionSingleIntroScreen3DescriptionText.
  ///
  /// In fa, this message translates to:
  /// **'پشتیبانی از سفره ایرانی'**
  String get introductionSingleIntroScreen3DescriptionText;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationTitle.
  ///
  /// In fa, this message translates to:
  /// **'تغذیه بزرگسالان'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationTitle;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText1.
  ///
  /// In fa, this message translates to:
  /// **'با افزایش سن، عملکرد ورزشی به‌تدریج کاهش می‌یابد؛ این کاهش معمولاً از دهه ۲۰ یا ۳۰ زندگی آغاز می‌شود و هر دهه حدود ۷٪ کمتر می‌شود. علت اصلی این کاهش، افت عملکرد قلب، ریه، کاهش توده و قدرت عضلات و استخوان‌هاست. زنان بیشتر از مردان دچار این تغییرات می‌شوند. کاهش هورمون‌های رشد، تستوسترون و استروژن نقش مهمی دارد و باعث افزایش چربی بدن و کاهش عضله می‌شود.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText1;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText2.
  ///
  /// In fa, this message translates to:
  /// **'توده استخوانی از میانه دهه ۳۰ کاهش می‌یابد و خطر پوکی استخوان و شکستگی در زنان بالای ۵۰ سال و مردان بالای ۶۰ سال افزایش می‌یابد. انعطاف‌پذیری بدن نیز کمتر شده و ریکاوری و بهبود آسیب‌ها زمان بیشتری می‌برد. برای کاهش آسیب، تمرینات کم‌برخورد و خواب کافی توصیه می‌شود.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText2;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText3.
  ///
  /// In fa, this message translates to:
  /// **'در زنان، کاهش عملکرد ورزشی زودتر از مردان و معمولاً از ۵۵ تا ۶۰ سالگی آغاز می‌شود، در حالی که در مردان این کاهش از ۷۰ تا ۷۵ سالگی شروع می‌شود. علت اصلی این تفاوت، تغییرات هورمونی دوران پیش‌یائسگی و یائسگی است که باعث کاهش توده عضلانی، افزایش چربی زیرپوستی و احشایی و تغییر توزیع چربی به سمت شکم می‌شود. این تغییرات خطر بیماری‌های قلبی، دیابت نوع ۲ و پوکی استخوان را افزایش می‌دهد.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText3;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText4.
  ///
  /// In fa, this message translates to:
  /// **'دوران پیش‌یائسگی معمولاً از ۴۵ سالگی آغاز می‌شود و با کاهش هورمون‌های استروژن و پروژسترون همراه است. این تغییرات باعث کاهش توده عضلانی، افزایش چربی شکمی، کاهش تراکم استخوان و کاهش حساسیت به انسولین می‌شود. همچنین، علائمی مانند گرگرفتگی، تغییرات خلقی و اختلال خواب شایع است.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText4;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText5.
  ///
  /// In fa, this message translates to:
  /// **'یائسگی به خودی خود باعث افزایش وزن نمی‌شود، اما نحوه ذخیره و توزیع چربی بدن را تغییر می‌دهد و چربی بیشتر در ناحیه شکم تجمع می‌یابد. علائمی مانند خستگی و کم‌خوابی می‌تواند منجر به انتخاب‌های غذایی ناسالم و کاهش فعالیت بدنی شود. هورمون‌درمانی جایگزین (HRT) می‌تواند به کاهش تجمع چربی شکمی و حفظ توده عضلانی کمک کند، اما اگر کالری دریافتی بیش از نیاز باشد، افزایش وزن رخ می‌دهد.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText5;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText6.
  ///
  /// In fa, this message translates to:
  /// **'کاهش توده عضلانی و عملکرد با افزایش سن اجتناب‌ناپذیر نیست. با انجام منظم تمرینات مقاومتی و هوازی، تغذیه مناسب و ریکاوری کافی می‌توان بسیاری از اثرات منفی پیری را کاهش داد یا حتی معکوس کرد. گرم‌کردن پویا و ریکاوری فعال برای پیشگیری از آسیب و حفظ انعطاف‌پذیری اهمیت دارد.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText6;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText7.
  ///
  /// In fa, this message translates to:
  /// **'تمرینات مقاومتی حداقل دو بار در هفته می‌تواند از سارکوپنی (کاهش عضله) جلوگیری کند و حتی باعث افزایش توده عضلانی و قدرت شود. این تمرینات سطح هورمون‌های رشد و تستوسترون را افزایش داده و به بهبود ترکیب بدن، تراکم استخوان و کنترل قند خون کمک می‌کند.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText7;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText8.
  ///
  /// In fa, this message translates to:
  /// **'تمرینات هوازی با شدت بالا (HIIT) نسبت به تمرینات هوازی ملایم، تأثیر بیشتری در بهبود ظرفیت هوازی (VO2max)، کنترل قند خون و کاهش چربی بدن دارند. با این حال، تمرینات هوازی با شدت متوسط نیز برای حفظ سلامت قلب و عروق مفید هستند.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText8;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText9.
  ///
  /// In fa, this message translates to:
  /// **'ریکاوری برای ورزشکاران مسن اهمیت بیشتری دارد. پس از تمرینات شدید یا مقاومتی، زمان ریکاوری باید افزایش یابد. همچنین، استفاده از دوره‌های تمرینی کوتاه‌تر (مثلاً دو هفته تمرین و یک هفته ریکاوری) و ریکاوری فعال مانند پیاده‌روی یا شنا در روزهای استراحت توصیه می‌شود.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText9;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText10.
  ///
  /// In fa, this message translates to:
  /// **'ورزش‌های مکمل مانند وزنه‌برداری و یوگا به حفظ توده عضلانی و انعطاف‌پذیری کمک می‌کنند و خطر آسیب‌های ناشی از استفاده بیش از حد را کاهش می‌دهند. خواب کافی و عادات خواب سالم برای ریکاوری و عملکرد بهتر ضروری است.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText10;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText11.
  ///
  /// In fa, this message translates to:
  /// **'با افزایش سن، پاسخ عضلات به پروتئین و ورزش کمتر می‌شود و پدیده‌ای به نام مقاومت آنابولیک رخ می‌دهد. این موضوع باعث کاهش ساخت عضله و افزایش خطر کاهش توده عضلانی می‌شود. برای پیشگیری، مصرف پروتئین کافی و انجام منظم تمرین مقاومتی ضروری است.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText11;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText12.
  ///
  /// In fa, this message translates to:
  /// **'افراد بالای ۶۵ سال برای حفظ عضله و پیشگیری از سارکوپنی به پروتئین بیشتری نسبت به جوانان نیاز دارند. مقدار توصیه‌شده برای افراد غیرفعال ۱ تا ۱.۲ گرم به ازای هر کیلوگرم وزن بدن و برای افراد فعال ۱.۲ تا ۱.۵ گرم است. مصرف پروتئین در وعده‌های مساوی در طول روز مؤثرتر از مصرف یک‌باره آن است.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText12;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText13.
  ///
  /// In fa, this message translates to:
  /// **'مصرف ۴۰ گرم پروتئین یا ۰.۴ گرم به ازای هر کیلوگرم وزن بدن در هر وعده، بیشترین تحریک ساخت عضله را در سالمندان ایجاد می‌کند. این مقدار بیشتر از نیاز جوانان است. مصرف پروتئین بلافاصله بعد از تمرین، ساخت عضله را افزایش می‌دهد.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText13;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText14.
  ///
  /// In fa, this message translates to:
  /// **'مصرف پروتئین با کیفیت بالا شامل تمام آمینواسیدهای ضروری (مانند شیر، لبنیات، تخم‌مرغ، گوشت، ماهی، سویا، کینوا و دانه‌ها) اهمیت دارد. گیاه‌خواران باید ترکیبی از منابع گیاهی مانند حبوبات و غلات مصرف کنند تا همه آمینواسیدهای ضروری تأمین شود.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText14;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText15.
  ///
  /// In fa, this message translates to:
  /// **'مصرف میان‌وعده پروتئینی قبل از خواب (مانند شیر، ماست یونانی یا نوشیدنی حاوی پروتئین) می‌تواند ساخت عضله را در سالمندان افزایش دهد و اثر تمرین مقاومتی را تقویت کند.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText15;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText16.
  ///
  /// In fa, this message translates to:
  /// **'با افزایش سن، توانایی ذخیره و استفاده از کربوهیدرات به صورت گلیکوژن در کبد و عضلات حفظ می‌شود و نیاز کربوهیدراتی افراد مسن مشابه جوانان است. اما با کاهش فعالیت بدنی و مصرف انرژی روزانه، مقدار کربوهیدرات مورد نیاز ممکن است کمتر شود.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText16;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText17.
  ///
  /// In fa, this message translates to:
  /// **'مقدار کربوهیدرات مصرفی باید متناسب با حجم و شدت تمرین و وزن بدن باشد. هرچه وزن و حجم تمرین بیشتر باشد، نیاز به کربوهیدرات نیز بیشتر است. عضلات سالمندان نسبت به آسیب ناشی از تمرینات اکسنتریک (مانند پایین آوردن وزنه یا دویدن سرازیری) حساس‌تر هستند و ترمیم آن‌ها زمان بیشتری می‌برد.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText17;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText18.
  ///
  /// In fa, this message translates to:
  /// **'برای ریکاوری بهتر پس از تمرین، به‌ویژه اگر کمتر از ۸ ساعت تا تمرین بعدی زمان دارید، مصرف ۱ تا ۱.۲ گرم کربوهیدرات به ازای هر کیلوگرم وزن بدن در هر ساعت طی ۴ ساعت اول توصیه می‌شود. افزودن پروتئین به وعده پس از تمرین به ترمیم عضله و ذخیره گلیکوژن کمک می‌کند.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText18;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText19.
  ///
  /// In fa, this message translates to:
  /// **'رژیم کم‌کربوهیدرات برای کاهش وزن در ورزشکاران مسن مزیت خاصی نسبت به سایر رژیم‌ها ندارد و مهم‌ترین عامل کاهش وزن، ایجاد کسری کالری و تداوم رژیم است. محدودیت شدید کربوهیدرات می‌تواند عملکرد ورزشی را در تمرینات با شدت متوسط و بالا کاهش دهد.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText19;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText20.
  ///
  /// In fa, this message translates to:
  /// **'مطالعات کمی روی ورزشکاران زن و سالمند درباره رژیم کم‌کربوهیدرات انجام شده و شواهدی مبنی بر بهبود عملکرد وجود ندارد. زنان به طور طبیعی توانایی بالایی در اکسیداسیون چربی دارند و محدودیت کربوهیدرات برای آن‌ها سودی ندارد.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText20;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText21.
  ///
  /// In fa, this message translates to:
  /// **'دوره‌بندی مصرف کربوهیدرات (مصرف کمتر در تمرینات سبک و بیشتر در تمرینات شدید) می‌تواند برای ورزشکاران حرفه‌ای مفید باشد و به سازگاری بهتر بدن با تمرینات کمک کند.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText21;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText22.
  ///
  /// In fa, this message translates to:
  /// **'با افزایش سن، احساس تشنگی و میزان تعریق کاهش می‌یابد و عملکرد کلیه‌ها نیز ضعیف‌تر می‌شود؛ بنابراین سالمندان بیشتر در معرض کم‌آبی بدن قرار دارند. توصیه می‌شود در ۲۴ ساعت قبل از تمرین آب کافی بنوشید و ۲ تا ۴ ساعت قبل از ورزش، به ازای هر کیلوگرم وزن بدن ۵ تا ۱۰ میلی‌لیتر آب مصرف کنید. در طول تمرین، بهتر است طبق برنامه آب بنوشید و فقط به احساس تشنگی اکتفا نکنید.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText22;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText23.
  ///
  /// In fa, this message translates to:
  /// **'برای پیشگیری از کم‌آبی و پرآبی، مصرف ۴۰۰ تا ۸۰۰ میلی‌لیتر آب در هر ساعت تمرین توصیه می‌شود. پس از تمرین، به ازای هر کیلوگرم وزنی که از دست داده‌اید، ۱.۲ تا ۱.۵ لیتر آب بنوشید. وزن‌کشی قبل و بعد از تمرین به شما کمک می‌کند میزان آب مورد نیاز را بهتر تنظیم کنید.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText23;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText24.
  ///
  /// In fa, this message translates to:
  /// **'مکمل امگا ۳ می‌تواند به کاهش التهاب و پیشگیری از کاهش عضله در سالمندان کمک کند. مصرف روزانه ۴۵۰ تا ۹۰۰ میلی‌گرم امگا ۳ یا دو وعده ماهی (یک وعده ماهی چرب) در هفته توصیه می‌شود. منابع خوب امگا ۳ شامل ماهی‌های چرب، بذر کتان، تخم کدو، گردو و دانه چیا هستند.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText24;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText25.
  ///
  /// In fa, this message translates to:
  /// **'مصرف مکمل کراتین همراه با تمرین مقاومتی باعث افزایش قدرت، توده عضلانی و عملکرد بدنی سالمندان می‌شود. دوز معمول ۵ گرم در روز است و کراتین مونوهیدرات بهترین و مطمئن‌ترین نوع آن است.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText25;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationRestDayText26.
  ///
  /// In fa, this message translates to:
  /// **'ویتامین D برای سلامت استخوان، عضله، سیستم ایمنی و عملکرد قلب و مغز ضروری است. با افزایش سن، کمبود ویتامین D شایع‌تر می‌شود. منابع غذایی محدودند (تخم‌مرغ، جگر، ماهی چرب، لبنیات غنی‌شده)، بنابراین مصرف مکمل روزانه ۱۰ میکروگرم (۴۰۰ واحد) برای سالمندان توصیه می‌شود. در صورت کمبود شدید، دوز بالاتر طبق نظر پزشک مصرف شود.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText26;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText1.
  ///
  /// In fa, this message translates to:
  /// **'قدرت و توان عضلانی با افزایش سن سریع‌تر کاهش می‌یابد، مگر اینکه تمرینات مقاومتی (وزنه یا کششی) به برنامه ورزشی اضافه شود. کاهش توده عضله قلب نیز باعث افت عملکرد قلب و ریه می‌شود.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText1;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText2.
  ///
  /// In fa, this message translates to:
  /// **'در افراد کم‌تحرک، حجم ضربه‌ای قلب، حداکثر ضربان قلب و توانایی استفاده از اکسیژن (VO2max) از میانه دهه ۲۰ هر دهه حدود ۱۰٪ کاهش می‌یابد. این کاهش باعث افت استقامت و عملکرد ورزشی می‌شود. ریکاوری بعد از تمرینات سخت طولانی‌تر شده و احتمال آسیب‌های مزمن بیشتر می‌شود؛ بنابراین باید شدت و حجم تمرینات را با افزایش سن تنظیم و به ریکاوری توجه بیشتری کرد.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText2;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText3.
  ///
  /// In fa, this message translates to:
  /// **'در دوران پیش‌یائسگی و یائسگی، کاهش هورمون‌های زنانه باعث کاهش ساخت عضله و افزایش تجزیه عضلات می‌شود. همچنین، حساسیت بدن به ورزش و پروتئین کمتر می‌شود و ریکاوری کندتر خواهد بود. برای حفظ سلامت عضلات و استخوان‌ها، انجام تمرینات مقاومتی و مصرف پروتئین کافی اهمیت بیشتری دارد.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText3;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText4.
  ///
  /// In fa, this message translates to:
  /// **'تمرینات مقاومتی با تکرار کم و وزنه سنگین باعث افزایش قدرت، توده عضلانی، تراکم استخوان و کارایی متابولیک می‌شود. در زنان یائسه، این تمرینات به بهبود ترکیب بدن، کاهش چربی شکمی و کنترل قند خون کمک می‌کند.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText4;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText5.
  ///
  /// In fa, this message translates to:
  /// **'تمرینات هوازی با شدت بالا (HIIT) و تمرینات تناوبی بیشترین تأثیر را در افزایش VO2max و بهبود سلامت قلب دارند. نسبت ۲ به ۱ (۲۰ ثانیه فعالیت، ۱۰ ثانیه استراحت) برای بهبود سیستم قلبی-عروقی مؤثر است. ترکیب انواع تمرینات و شدت‌ها بهترین نتیجه را دارد.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText5;

  /// No description provided for @foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText6.
  ///
  /// In fa, this message translates to:
  /// **'افراد فعال در سنین بالا می‌توانند سطح آمادگی جسمانی بالاتری نسبت به افراد کم‌تحرک جوان داشته باشند. تمرین منظم هوازی و مقاومتی باعث حفظ قدرت، استقامت و ظرفیت هوازی می‌شود و روند افت عملکرد با افزایش سن را به تأخیر می‌اندازد.'**
  String get foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText6;

  /// No description provided for @foodInputChatButtonLoadingText1.
  ///
  /// In fa, this message translates to:
  /// **'در حال پردازش...'**
  String get foodInputChatButtonLoadingText1;

  /// No description provided for @foodInputChatButtonLoadingText2.
  ///
  /// In fa, this message translates to:
  /// **'لطفاً منتظر بمانید'**
  String get foodInputChatButtonLoadingText2;

  /// No description provided for @privacyDialogTitle.
  ///
  /// In fa, this message translates to:
  /// **'حریم خصوصی'**
  String get privacyDialogTitle;

  /// No description provided for @privacyDialogSubtitle1.
  ///
  /// In fa, this message translates to:
  /// **'چگونه از اطلاعات شما حراست میکنیم؟'**
  String get privacyDialogSubtitle1;

  /// No description provided for @privacyDialogSubtitle2.
  ///
  /// In fa, this message translates to:
  /// **'چه اطلاعاتی از شما دریافت می‌شود؟'**
  String get privacyDialogSubtitle2;

  /// No description provided for @privacyDialogSubtitle3.
  ///
  /// In fa, this message translates to:
  /// **'چگونه از اطلاعات شما محافظت می‌شود؟'**
  String get privacyDialogSubtitle3;

  /// No description provided for @privacyDialogSubtitle4.
  ///
  /// In fa, this message translates to:
  /// **'چه استفاده‌ای اطلاعات شما خواهد شد؟'**
  String get privacyDialogSubtitle4;

  /// No description provided for @privacyDialogSubtitle5.
  ///
  /// In fa, this message translates to:
  /// **'چه کسانی به اطلاعات شما دسترسی دارند؟'**
  String get privacyDialogSubtitle5;

  /// No description provided for @privacyDialogText1.
  ///
  /// In fa, this message translates to:
  /// **'امروزه با گسترش جریان اطلاعات و استفاده روزمره کاربران از اینترنت و وسایل ارتباطی، حریم خصوصی کاربران به یکی از جدی‌ترین دغدغه‌ها تبدیل شده‌است. نگرانی بسیاری از مشتریان، محفوظ ماندن اطلاعات شخصی همچنین شماره موبایل، نام و نام خانوادگی و ایمیل است که برای ثبت نام و لاگین شدن به ما می‌سپارند. باید گفت ما نیز اهمیت این موضوع را درک می‌کنیم و حریم خصوصی کاربران برای ما اهمیت بسیاری دارد. در ذیل سیاست حفظ حریم خصوصی و محرمانگی اطلاعات کاربران را ملاحظه خواهیدکرد.'**
  String get privacyDialogText1;

  /// No description provided for @privacyDialogText2.
  ///
  /// In fa, this message translates to:
  /// **'برای ثبت نام در اپلیکشین تندرست لازم است تا اطلاعاتی مانند نام، تلفن همراه، تاریخ تولد و قد و وزن و اندازه ترکیب بدنی خود را در اختیار ما قرار دهید. دریافت مشخصات فردی شما نیز صرفاً برای ثبت نام در سایت، محاسبات تغذیه شما مانند انرژی مورد نیاز روزانه، ارسال اعلان‌های مهم و باخبر کردن شما از رویدادها و تخفیف‌های ویژه، استفاده از خدمات تندرست است.'**
  String get privacyDialogText2;

  /// No description provided for @privacyDialogText3.
  ///
  /// In fa, this message translates to:
  /// **'با وجود این‌که امنیت به صورت نسبی تعریف شده است اما در طراحی اپلیکیشن تندرست سعی شده که از بالاترین سطوح امنیتی سخت‌افزاری و نرم‌افزاری در نظر گرفته شود. در زمان ثبت نام، درخواست کد اعتبار، دریافت داده های کاربر، گزارشات و غیره، تمامی در خواست‌ها و خدمات بر روی سرورهای ایمن ما ذخیره و توسط فایروال‌های مستحکم محافظت خواهند شد. اطلاعات شخصی شما نیز به صورت رمزنگاری‌شده در بستر امن HTTPS به وب‌سایت ما منتقل و برای تعاملات بعدی نگهداری خواهند شد.'**
  String get privacyDialogText3;

  /// No description provided for @privacyDialogText4.
  ///
  /// In fa, this message translates to:
  /// **'چه از نظر قانونی چه از نظر اخلاقی ما موظف به صیانت از اطلاعات و پرونده‌های شما هستیم. اطلاعات شخصی شما نیز صرفاً جهت تعاملات بعدی به صورت ایمن در پایگاه داده نگهداری می‌شوند تا در درخواست‌های آینده بتوانید به راحتی از نرم افزار استفاده کنید . ایمیل‌ها و پیام‌های تبلیغاتی بی مورد را برای کاربران‌مان ارسال نخواهیم کرد.'**
  String get privacyDialogText4;

  /// No description provided for @privacyDialogText5.
  ///
  /// In fa, this message translates to:
  /// **'برای ارائه پشتیبانی بهتر و خدمات با کیفیت‌تر بخش پشتیبانی به برخی از اطلاعات شما دسترسی دارند. تمامی اطلاعات شخصی شما نزد ما محفوظ خواهد ماند و در اختیار افراد یا سازمان‌های دیگری قرار نخواهد گرفت. بدیهی است که مراجع قانونی با ارائه حکم دادگاه قادرند به این اطلاعات دسترسی داشته باشند. به طور کلی ما موظفیم از اطلاعات شما حفاظت و حراست نماییم.'**
  String get privacyDialogText5;

  /// No description provided for @privacyDialogText6.
  ///
  /// In fa, this message translates to:
  /// **'امیدواریم بهترین استفاده را از نرم افزار تندرست داشته باشید'**
  String get privacyDialogText6;

  /// No description provided for @aiChatButtonTitle.
  ///
  /// In fa, this message translates to:
  /// **'دکمه را نگه دارید و نام غذاهایی که خوردید بگویید'**
  String get aiChatButtonTitle;

  /// No description provided for @aiChatButtonSubTitle.
  ///
  /// In fa, this message translates to:
  /// **'یا کیبرد را لمس کنید و نام غذاهایی که خوردید تایپ کنید.'**
  String get aiChatButtonSubTitle;

  /// No description provided for @paymentDialogTitle.
  ///
  /// In fa, this message translates to:
  /// **'دسترسی امکانات'**
  String get paymentDialogTitle;

  /// No description provided for @paymentDialogOneMonth.
  ///
  /// In fa, this message translates to:
  /// **'نقره‌ای'**
  String get paymentDialogOneMonth;

  /// No description provided for @paymentDialogThreeMonth.
  ///
  /// In fa, this message translates to:
  /// **'طلایی'**
  String get paymentDialogThreeMonth;

  /// No description provided for @paymentDialogText1.
  ///
  /// In fa, this message translates to:
  /// **'سلامت و تندرستی'**
  String get paymentDialogText1;

  /// No description provided for @paymentDialogText2.
  ///
  /// In fa, this message translates to:
  /// **'پیشگیری از بیماری مرتبط با چاقی'**
  String get paymentDialogText2;

  /// No description provided for @paymentDialogText3.
  ///
  /// In fa, this message translates to:
  /// **'سریع‌ترین روش لاغری'**
  String get paymentDialogText3;

  /// No description provided for @paymentDialogText4.
  ///
  /// In fa, this message translates to:
  /// **'دسترسی به ثبت انواع غذا'**
  String get paymentDialogText4;

  /// No description provided for @paymentDialogOneMonthText5.
  ///
  /// In fa, this message translates to:
  /// **'یک ماه یا 600 عدد غذا'**
  String get paymentDialogOneMonthText5;

  /// No description provided for @paymentDialogThreeMonthText5.
  ///
  /// In fa, this message translates to:
  /// **'سه ماه یا 1800 عدد غذا'**
  String get paymentDialogThreeMonthText5;

  /// No description provided for @paymentDialogText6.
  ///
  /// In fa, this message translates to:
  /// **'مطابق سفره ایرانی'**
  String get paymentDialogText6;

  /// No description provided for @paymentDialogText7.
  ///
  /// In fa, this message translates to:
  /// **'همراه با پشتیبانی'**
  String get paymentDialogText7;

  /// No description provided for @paymentDialogSubmitButtonLabel.
  ///
  /// In fa, this message translates to:
  /// **'ادامه'**
  String get paymentDialogSubmitButtonLabel;

  /// No description provided for @profileRouteTansactionDialogTitle.
  ///
  /// In fa, this message translates to:
  /// **'لیست تراکنش‌ها'**
  String get profileRouteTansactionDialogTitle;

  /// No description provided for @profileRouteTansactionListTileID.
  ///
  /// In fa, this message translates to:
  /// **'شناسه'**
  String get profileRouteTansactionListTileID;

  /// No description provided for @profileRouteTansactionListTilePaidAmount.
  ///
  /// In fa, this message translates to:
  /// **'مبلغ پرداختی'**
  String get profileRouteTansactionListTilePaidAmount;

  /// No description provided for @profileRouteTansactionListTilePaymentMethod.
  ///
  /// In fa, this message translates to:
  /// **'روش پرداخت'**
  String get profileRouteTansactionListTilePaymentMethod;

  /// No description provided for @profileRouteTansactionListTilePurchaseDate.
  ///
  /// In fa, this message translates to:
  /// **'تاریخ خرید'**
  String get profileRouteTansactionListTilePurchaseDate;

  /// No description provided for @profileRouteTansactionListTileExpireDate.
  ///
  /// In fa, this message translates to:
  /// **'تاریخ اتمام'**
  String get profileRouteTansactionListTileExpireDate;

  /// No description provided for @profileRouteTansactionListTileUpdatedAt.
  ///
  /// In fa, this message translates to:
  /// **'تاریخ بروزرسانی'**
  String get profileRouteTansactionListTileUpdatedAt;

  /// No description provided for @profileRouteTansactionListTileSubscriptionType.
  ///
  /// In fa, this message translates to:
  /// **'نوع اشتراک'**
  String get profileRouteTansactionListTileSubscriptionType;

  /// No description provided for @profileRouteTansactionListTileCafeBazzarOrderID.
  ///
  /// In fa, this message translates to:
  /// **'شناسه کافه بازار'**
  String get profileRouteTansactionListTileCafeBazzarOrderID;

  /// No description provided for @profileRouteTansactionListTileFoodRequestLimit.
  ///
  /// In fa, this message translates to:
  /// **'تعداد غذای قابل ثبت'**
  String get profileRouteTansactionListTileFoodRequestLimit;

  /// No description provided for @profileRouteTansactionListTileNumberOfRequestedFoods.
  ///
  /// In fa, this message translates to:
  /// **'تعداد غذای ثبت شده'**
  String get profileRouteTansactionListTileNumberOfRequestedFoods;

  /// No description provided for @profileRouteTansactionListTileActive.
  ///
  /// In fa, this message translates to:
  /// **'فعال'**
  String get profileRouteTansactionListTileActive;

  /// No description provided for @searchRouteMicrophonePermissionMessage.
  ///
  /// In fa, this message translates to:
  /// **'لطفا برای گفتن غذاها دسترسی میکرفن دستگاه را بدهید'**
  String get searchRouteMicrophonePermissionMessage;
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
