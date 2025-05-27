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
  /// **'{chartType, select, weight{وزن} waistCircumference{دور کمر} armCircumference{دور بازو} chestCircumference{دور سینه} thightCircumference{دور ران} calfMuscleCircumference{ماهیچه ساق پا} hipCircumference{دور باسن} activityLevel{سطح فعالیت} other{ترجمه تعریف نشده}}'**
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
  /// **'{gender, select, male{وزن} female{دور کمر} other{ترجمه تعریف نشده}}'**
  String physicalDataGender(String gender);
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
