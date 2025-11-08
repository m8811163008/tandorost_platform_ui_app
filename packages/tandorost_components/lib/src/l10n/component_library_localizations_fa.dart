// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'component_library_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class ComponentLibraryLocalizationsFa extends ComponentLibraryLocalizations {
  ComponentLibraryLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String drawerSupportText1(String phoneNumber) {
    return 'شماره پشتیبانی $phoneNumber';
  }

  @override
  String get drawerSupportText2 =>
      'محتویات برنامه متعلق به تیم توسعه دهنده تندرست می‌باشد.';

  @override
  String get logout => 'خروج از حساب کاربری';

  @override
  String get notTranslated => 'ترجمه نشده است';

  @override
  String get foodName => 'نام غذا';

  @override
  String get fat => 'چربی';

  @override
  String get carbohydrate => 'کربوهیدرات';

  @override
  String get carbohydrateFruitsOrNonStarchyVegetables =>
      'کربوهیدرات میوه و سبزی';

  @override
  String get carbohydrateOthers => 'کربوهیدرات غنی';

  @override
  String get protein => 'پروتئین';

  @override
  String get id => 'شناسه';

  @override
  String get success => 'موفقیت آمیز بود';

  @override
  String get upsertDate => 'تاریخ ثبت/بروزرسانی';

  @override
  String get unitOfMeasurement => 'واحد اندازه‌گیری';

  @override
  String get calculatedCalorie => 'کالری محاسبه شده';

  @override
  String get foodEnergy => 'انرژی';

  @override
  String get quantityOfUnitOfMeasurement => 'تعداد واحد اندازه‌گیری';

  @override
  String get carbohydrateSource => 'منبع کربوهیدرات';

  @override
  String get emptyList => 'هنوز داده‌ای اضافه نشده است';

  @override
  String carbohydrateSourceValue(String source) {
    String _temp0 = intl.Intl.selectLogic(source, {
      'fruitsOrNonStarchyVegetables': 'میوه و سبزی',
      'others': 'کربوهیدرات غنی',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get cancle => 'لغو';

  @override
  String get delete => 'حذف';

  @override
  String get deleteAll => 'حذف همه';

  @override
  String get update => 'بروزرسانی';

  @override
  String delete_confirm_question(String food) {
    return 'آیا $food حذف شود؟';
  }

  @override
  String get searchFoodBottomSheetHeading => 'اضافه کردن غذا';

  @override
  String get searchFoodBottomSheetTextFieldHintExample1 =>
      'برای مثال یک عدد سینه مرغ سرخ شده و دو عدد سیب زمینی پخته متوسط';

  @override
  String get searchFoodBottomSheetTextFieldHintExample2 =>
      'یک بشقاب قرمه سبزی و یک کاسه سالاد شیرازی و دو لیوان دوغ';

  @override
  String get searchFoodBottomSheetTextFieldHintExample3 =>
      'یه کاسه ماست یونانی و یک مشت جو دوسر';

  @override
  String get searchFoodBottomSheetTextFieldHintExample4 =>
      'نصف بشقاب باقلی قاتق و یک لیوان آب جو بدون الکل';

  @override
  String get searchFoodBottomSheetTextFieldHintExample5 =>
      'اشکنه شنبلیله و نعناع یک کاسه بزرگ';

  @override
  String get searchFoodBottomSheetButtonLabel => 'جستجو';

  @override
  String get networkError => 'خطای ارتباط. دوباره امتحان کنید';

  @override
  String get internetConnectionError =>
      'خطای اینترنت. اینترنت خود را روشن نمایید';

  @override
  String setPrescriptionTimeLeft(int seconds) {
    return '$seconds ثانیه';
  }

  @override
  String voiceAiInsufficientLength(int seconds) {
    return 'حداقل $seconds ثانیه گفتگو کنید';
  }

  @override
  String get selectLanguageBottomSheetHeading => 'انتخاب کردن زبان گفتار';

  @override
  String get emptyFormFieldValidationError => 'این فیلد خالی است. درآن تایپ کن';

  @override
  String minLengthFormFieldValidationError(int minLength) {
    return 'حداقل $minLength حروف باید تایپ کنید';
  }

  @override
  String get registerLabel => 'ثبت نام';

  @override
  String get loginRouteLabel => 'ورود';

  @override
  String get verifyRouteOutlineLabel => 'ارسال کد';

  @override
  String get outlineLabelBackToHome => 'بازگشت به خانه';

  @override
  String get textButtonLabelLogin => 'ورود';

  @override
  String get verifyNumberTextFieldLabel => 'تایید کد';

  @override
  String get verifyFormOutlineLabel => 'ارسال';

  @override
  String get forgotPasswordLabel => 'فراموشی رمز عبور';

  @override
  String get identifierTextFieldLabel => 'شماره همراه یا ایمیل';

  @override
  String get identifierTextFieldValidationError => 'نام کاربری نا معتبر است';

  @override
  String get passwordTextFieldLabel => 'رمز عبور';

  @override
  String get newPasswordTextFieldLabel => 'رمز عبور جدید';

  @override
  String get verificationCodeTextFieldLabel => 'کد ارسال شده';

  @override
  String get dialogTitleChangeApplicationLanguage => 'تغییر زبان نرم افزار';

  @override
  String get dialogTitleChangeName => 'تغییرنام';

  @override
  String get changeNameTextFieldLabel => 'نام';

  @override
  String get dialogTitleChangePhoneNumber => 'تغییر شماره تماس';

  @override
  String get changePhoneNumberTextFieldLabel => 'شماره تماس';

  @override
  String get changePhoneNumberTextFieldValidatorErrorMessage =>
      'شماره تماس نامعتبر است';

  @override
  String get dialogTitleChangeEmail => 'تغییر ایمیل';

  @override
  String get changeEmailTextFieldLabel => 'ایمیل';

  @override
  String get changeEmailTextFieldValidatorErrorMessage => 'ایمیل نامعتبر است';

  @override
  String get personalInfoNameLabel => 'نام';

  @override
  String get personalInfoPhoneLabel => 'شماره تلفن';

  @override
  String get personalInfoEmailLabel => 'ایمیل';

  @override
  String get updateButton => 'بروزرسانی';

  @override
  String get personalInfoSettingLabel => 'مشخصات فردی';

  @override
  String get settingLabel => 'تنظیمات';

  @override
  String get coachSettingLabel => 'تنظیمات پروفایل مربی';

  @override
  String get coachSettingActivateToggleLabel => 'فعال کردن حالت مربی';

  @override
  String get coachSettingAvailabilityToggleLabel => 'پذیرش شاگرد جدید';

  @override
  String get coachSettingBiographyLabel => 'معرفی';

  @override
  String get coachSettingBiographyDialogTitle => 'درباره شما';

  @override
  String get coachSettingBiographyDialogTextFieldlabel => 'درباره';

  @override
  String get coachSettingBiographyDialogTextFieldHint =>
      'سوابق ، گواهینامه ها، روش تمرین 🏆';

  @override
  String get changeWeightSpeedLabel => 'سرعت کاهش وزن';

  @override
  String get changeWeightSpeedInfoHint =>
      'در وضعیت فعلی شاید عادت کرده باشید بیشتر از انرژی مورد نیاز روزانه میل کنید. ابتدا سرعت را در حالت ثابت بگذارید و بعد از تغییر عادت های غذایی و عادت به وضعیت جدید، سپس سرعت را به تدریج افزایش دهید تا ‌احساس گرسنگی و خیلی کمتری را تجربه کنید.';

  @override
  String get changeWeightSpeedInfoConstantSpeed =>
      'در حالت تثبیت وزن از انرژی مورد نیاز کم نمیشود';

  @override
  String get changeWeightSpeedInfoSlowAndEasySpeed =>
      'در حالت آهسته و آسان در روز استراحت 10 درصد از انرژی مورد نیاز کم میشود و در روز تمرین 0 درصد از انرژی مورد نیاز کم میشود';

  @override
  String get changeWeightSpeedInfoMediumSpeed =>
      'در حالت طبیعی در روز استراحت 10 درصد از انرژی مورد نیاز کم میشود و در روز تمرین  5 درصد از انرژی مورد نیاز کم میشود';

  @override
  String get changeWeightSpeedInfoFastSpeed =>
      'در حالت سریع در روز استراحت 15 درصد از انرژی مورد نیاز کم میشود و در روز تمرین  5 درصد از انرژی مورد نیاز کم میشود';

  @override
  String get changeWeightSpeedInfoFastAndHardSpeed =>
      'در حالت سریع و سخت در روز استراحت 15 درصد از انرژی مورد نیاز کم میشود و در روز تمرین  15 درصد از انرژی مورد نیاز کم میشود';

  @override
  String get changeWeightSpeedInfoFastAndHardSpeedCaution =>
      'دقت کنید حالت سریع و سخت برای بعضی روزهای تمرین مناسب نیست چون باعث میشه انرژی کمی برای تمرین فراهم باشد.';

  @override
  String profileChangeWeightSpeedButtonLabel(String changeWeightSpeed) {
    String _temp0 = intl.Intl.selectLogic(changeWeightSpeed, {
      'constant': 'تثبیت وزن',
      'slowAndEasy': 'آهسته و آسان',
      'medium': 'طبیعی',
      'fast': 'سریع',
      'fastAndHard': 'سریع و سخت',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get timeRestrictedEatingLabel => 'رژیم با زمان محدود(فستینگ)';

  @override
  String get notificationReminderLabel => 'اعلان یادآوری ثبت غذا';

  @override
  String get languageSettingLabel => 'زبان نرم افزار';

  @override
  String languageTranslation(String language_name) {
    String _temp0 = intl.Intl.selectLogic(language_name, {
      'english': 'انگلیسی',
      'chinese': 'چینی',
      'hindi': 'هندی',
      'spanish': 'اسپانیایی',
      'french': 'فرانسوی',
      'arabic': 'عربی',
      'bengali': 'بنگالی',
      'russian': 'روسی',
      'portuguese': 'پرتغالی',
      'urdu': 'اردو',
      'indonesian': 'اندونزیایی',
      'german': 'آلمانی',
      'japanese': 'ژاپنی',
      'marathi': 'مراتی',
      'telugu': 'تلوگو',
      'turkish': 'ترکی',
      'tamil': 'تامیلی',
      'vietnamese': 'ویتنامی',
      'tagalog': 'تاگالوگ',
      'korean': 'کره‌ای',
      'persian': 'فارسی',
      'hausa': 'هوسا',
      'javanese': 'جاوه‌ای',
      'italian': 'ایتالیایی',
      'punjabi': 'پنجابی',
      'kannada': 'کانادا',
      'gujarati': 'گجراتی',
      'thai': 'تایلندی',
      'polish': 'لهستانی',
      'ukrainian': 'اوکراینی',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String profileChartTypeLabel(String chartType) {
    String _temp0 = intl.Intl.selectLogic(chartType, {
      'weight': 'وزن',
      'height': 'قد',
      'waistCircumference': 'دور کمر',
      'armCircumference': 'دور بازو',
      'chestCircumference': 'دور سینه',
      'thighCircumference': 'دور ران',
      'calfMuscleCircumference': 'ماهیچه ساق پا',
      'hipCircumference': 'دور باسن',
      'activityLevel': 'سطح فعالیت',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get photoEditorRemove => 'حذف';

  @override
  String get photoEditorEdit => 'ویرایش';

  @override
  String get photoEditorRotateScale => 'چرخش و تغییر اندازه';

  @override
  String get photoEditorMoveAndZoom => 'بزرگنمایی';

  @override
  String get photoEditorBottomNavigationBarText => 'نقاشی';

  @override
  String get photoEditorFreestyle => 'آزاد';

  @override
  String get photoEditorArrow => 'فلش';

  @override
  String get photoEditorLine => 'خط';

  @override
  String get photoEditorRectangle => 'مستطیل';

  @override
  String get photoEditorCircle => 'دایره';

  @override
  String get photoEditorDashLine => 'خط چین';

  @override
  String get photoEditorBlur => 'محو کردن';

  @override
  String get photoEditorPixelate => 'پیکسلی کردن';

  @override
  String get photoEditorLineWidth => 'ضخامت خط';

  @override
  String get photoEditorEraser => 'پاک‌کن';

  @override
  String get photoEditorToggleFill => 'تغییر حالت پر کردن';

  @override
  String get photoEditorChangeOpacity => 'تغییر شفافیت';

  @override
  String get photoEditorUndo => 'برگرداندن';

  @override
  String get photoEditorRedo => 'دوباره انجام دادن';

  @override
  String get photoEditorDone => 'انجام شد';

  @override
  String get photoEditorBack => 'بازگشت';

  @override
  String get photoEditorSmallScreenMoreTooltip => 'بیشتر';

  @override
  String get photoEditorInputHintText => 'متن را وارد کنید';

  @override
  String get photoEditorBottomNavigationBarTextText => 'متن';

  @override
  String get photoEditorBackText => 'بازگشت';

  @override
  String get photoEditorDoneText => 'انجام شد';

  @override
  String get photoEditorTextAlign => 'تراز متن';

  @override
  String get photoEditorFontScale => 'مقیاس فونت';

  @override
  String get photoEditorBackgroundMode => 'حالت پس‌زمینه';

  @override
  String get photoEditorSmallScreenMoreTooltipText => 'بیشتر';

  @override
  String get photoEditorBottomNavigationBarTextCropRotate => 'برش/چرخش';

  @override
  String get photoEditorRotate => 'چرخش';

  @override
  String get photoEditorFlip => 'برعکس';

  @override
  String get photoEditorRatio => 'نسبت';

  @override
  String get photoEditorCancel => 'لغو';

  @override
  String get photoEditorReset => 'بازنشانی';

  @override
  String get photoEditorBottomNavigationBarTextFilter => 'فیلتر';

  @override
  String get photoEditorBottomNavigationBarTextTune => 'تنظیم';

  @override
  String get photoEditorBrightness => 'روشنایی';

  @override
  String get photoEditorContrast => 'کنتراست';

  @override
  String get photoEditorSaturation => 'اشباع رنگ';

  @override
  String get photoEditorExposure => 'نوردهی';

  @override
  String get photoEditorHue => 'رنگ‌مایه';

  @override
  String get photoEditorTemperature => 'دمای رنگ';

  @override
  String get photoEditorSharpness => 'وضوح';

  @override
  String get photoEditorFade => 'محو شدن';

  @override
  String get photoEditorLuminance => 'درخشندگی';

  @override
  String get photoEditorUndoText => 'برگرداندن';

  @override
  String get photoEditorRedoText => 'دوباره انجام دادن';

  @override
  String get photoEditorBottomNavigationBarTextBlur => 'محو کردن';

  @override
  String get photoEditorBottomNavigationBarTextSticker => 'برچسب';

  @override
  String get photoEditorLoadingDialogMsg => 'لطفاً صبر کنید...';

  @override
  String get photoEditorCloseEditorWarningTitle => 'بستن ویرایشگر تصویر؟';

  @override
  String get photoEditorCloseEditorWarningMessage =>
      'آیا مطمئن هستید که می‌خواهید ویرایشگر تصویر را ببندید؟ تغییرات شما ذخیره نخواهد شد.';

  @override
  String get photoEditorCloseEditorWarningConfirmBtn => 'تأیید';

  @override
  String get photoEditorCloseEditorWarningCancelBtn => 'لغو';

  @override
  String get photoEditorImportStateHistoryMsg =>
      'ویرایشگر در حال راه‌اندازی است';

  @override
  String get photoEditorDoneLoadingMsg => 'تغییرات در حال اعمال هستند';

  @override
  String physicalDataGender(String gender) {
    String _temp0 = intl.Intl.selectLogic(gender, {
      'male': 'مرد',
      'female': 'زن',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String imageSideDescription(String side) {
    String _temp0 = intl.Intl.selectLogic(side, {
      'front': 'روبرو',
      'back': 'پشت',
      'side': 'پهلو',
      'free': 'فیگور آزاد',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String physicalActivityLevel(String activityLevel) {
    String _temp0 = intl.Intl.selectLogic(activityLevel, {
      'sedentary': 'غیرفعال و زیاد میشینم',
      'fairyActive':
          'تقریبا فعال، هر هفته یکی دوبار ورزش میکنم و پیاده روی میکنم',
      'moderatelyActive': 'فعال، هر هفته دو سه روز ورزش میکنم',
      'active': 'خیلی فعال، هر هفته بیش از 3 بار با شدت بالا ورزش میکنم',
      'veryActive': 'روزی دوبار ورزش میکنم',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get fitnessProfileImageGallaryTitle => 'تصاویر پیشرفت شما';

  @override
  String get fitnessProfileAddImageButton => 'افزودن تصویر جدید';

  @override
  String get fitnessProfilePhysicalDataLabel => 'اطلاعات فیزیکی شما';

  @override
  String get fitnessProfileRestingMetabolicRate =>
      'نرخ سوخت ساز در حالت استراحت';

  @override
  String get fitnessProfileTotalDailyEnergyExpenditure =>
      'کل انرژی مصرفی روزانه';

  @override
  String get fitnessProfileBodyMassIndex => 'شاخص توده بدنی';

  @override
  String get fitnessProfileBodyMassIndexPrime => 'BMI Prime';

  @override
  String get fitnessProfileWaistCircumferenceToHeightRatio =>
      'نسبت دور کمر به قد';

  @override
  String get fitnessProfileIsWaistCircumferenceToHeightRatioSafe =>
      'آیا نسبت دور کمر به قد ایمن است؟';

  @override
  String get fitnessProfileIsWaistCircumferenceSafeRange =>
      'آیا دور کمر در محدوده ایمن است؟';

  @override
  String get yes => 'بله';

  @override
  String get no => 'خیر';

  @override
  String get fitnessProfileNA => 'در دسترس نیست';

  @override
  String get fitnessProfileBodyMassIndexLevelLabel => 'سطح شاخص توده بدنی';

  @override
  String fitnessProfileBmiDescription(double bmiValue, String bmiDescriptive) {
    final intl.NumberFormat bmiValueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String bmiValueString = bmiValueNumberFormat.format(bmiValue);

    return 'شاخص توده بدنی شما $bmiValueString و در وضعیت $bmiDescriptive هستید.';
  }

  @override
  String get fitnessProfileWaistCircumferencePhysicalDataHintLabel =>
      'دور کمر و دیابت';

  @override
  String get fitnessProfileWaistCircumferenceToHeightRatioDescription =>
      'شاخص دور کمر به قد از شاخص توده بدنی برای ارزیابی خطرات مرتبط با سلامت دقیق‌تر است ، این نسبت هرچه به صفر نزدیک تر باشد وضعیت خطرات مرتبط با سلامتی برای شما کمتر میشود.';

  @override
  String fitnessProfileWaistCircumferenceToHeightRatioAvailableDescription(
    double ratio,
  ) {
    final intl.NumberFormat ratioNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String ratioString = ratioNumberFormat.format(ratio);

    return 'شاخص دور کمر به قد برای شما $ratioString است';
  }

  @override
  String
  get fitnessProfileWaistCircumferenceToHeightRatioNotAvailableDescription =>
      'شاخص دور کمر به قد برای شما در دسترس نیست، لطفا دور کمر خود را در قسمت اندازه گیری جدید در صفحه قبل، اندازه و اضافه کنید';

  @override
  String get fitnessProfileBmiWaistCircumferenceHealthDescription =>
      'خطرات مرتبط با سلامتی شامل بیماری های قلبی عروقی، بیماری کیسه صفرا، فشار خون بالا و دیابت نوع 2 میباشد.';

  @override
  String fitnessProfileBmiStatus(String bmiStatus) {
    String _temp0 = intl.Intl.selectLogic(bmiStatus, {
      'underweight': 'کمبود وزن',
      'healthyWeight': 'عادی',
      'overWeight': 'اضافه وزن',
      'obeseClassOne': 'چاقی کلاس 1',
      'obeseClassTwo': 'چاقی کلاس 2',
      'obeseClassThree': 'چاقی کلاس 3',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get fitnessProfileWaistCircumferenceSafeRangeDescription =>
      'محدوده سالم اندازه دور کمر بهتر است کمتر از 94 سانتی متر در آقایان و 80 سانتی متر در خانم‌ها باشد.این شاخص با احتمال ابتلا به دیابت نوع 2 در ارتباط است';

  @override
  String get fitnessProfileWaistCircumferenceSafeRangeNotAvailableDescription =>
      'شاخص محدوده مجاز دور کمر برای شما در دسترس نیست، لطفا دور کمر خود را در قسمت اندازه گیری جدید در صفحه قبل، اندازه و اضافه کنید';

  @override
  String fitnessProfileIsWaistCircumferenceSafeRangeDescription(
    String isWaistCircumferenceSafeRange,
  ) {
    String _temp0 = intl.Intl.selectLogic(isWaistCircumferenceSafeRange, {
      'true': 'دور کمر شما در محدوده مجاز می‌باشد',
      'false':
          'دور کمر شما از محدوده مجاز بیشتر است و احتمال ابتلا به دیابت نوع 2 در شما بیشتر است. لطفا چربی خود را سریع کاهش دهید',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get fitnessProfileNewMeasurementLabel => 'اندازه‌گیری جدید';

  @override
  String get fitnessProfileNewMeasurementDialogArmCircumference => 'دور بازو';

  @override
  String get fitnessProfileNewMeasurementDialogChestCircumference => 'دور سینه';

  @override
  String get fitnessProfileNewMeasurementDialogThighCircumference => 'دور ران';

  @override
  String get fitnessProfileNewMeasurementDialogCalfMuscleCircumference =>
      'دور ماهیچه ساق پا';

  @override
  String get fitnessProfileNewMeasurementDialogHipCircumference => 'دور باسن';

  @override
  String get fitnessProfileNewMeasurementDialogWaistCircumference => 'دور کمر';

  @override
  String get fitnessProfileNewMeasurementDialogGender => 'جنسیت';

  @override
  String get fitnessProfileNewMeasurementDialogActivityLevel => 'سطح فعالیت';

  @override
  String get fitnessProfileNewMeasurementBirthday => 'تاریخ تولد';

  @override
  String get fitnessProfileNewMeasurementHeight => 'قد';

  @override
  String get fitnessProfileNewMeasurementWeight => 'وزن';

  @override
  String get measurementUnitCM => 'سانتی‌متر';

  @override
  String get measurementUnitKG => 'کیلوگرم';

  @override
  String get measurementUnitGram => 'گرم';

  @override
  String get measurementUnitCalorie => 'کیلوکالری';

  @override
  String get fitnessProfilePhysicaDataChart => 'نمودار پیشرفت شما';

  @override
  String get fitnessProfileDeleteDataPointDialogLabel => 'حذف اندازه';

  @override
  String get fitnessProfileDeleteDataPointDialogDescription =>
      'آیا از حذف این اندازه مطمئن هستید؟';

  @override
  String get foodReportUserFoodRequirementFrom => 'از';

  @override
  String get foodReportTabLabelRestDay => 'روز استراحت';

  @override
  String get foodReportTabLabelTrainingDay => 'روز تمرین';

  @override
  String get foodReportBannerContent =>
      'مشخصات تغذیه شما دردسترس نیست. لطفا مشخصات خود را در صفحه تناسب اندام کامل کنید';

  @override
  String get foodReportBannerGotoLabel => 'رفتن به صفحه تناسب اندام';

  @override
  String get foodReportFoodsStatics => 'وضعیت خوراک امروز';

  @override
  String get foodReportDeleteDialogTitle => 'حذف غذا';

  @override
  String get foodReportDeleteDialogContent => 'آیا این غذا حذف شود؟';

  @override
  String get foodReportFoodsListLabel => '‌لیست خوراکی‌ها';

  @override
  String get foodReportUserFoodRequirementNA => 'N/A';

  @override
  String appRoutesName(String routesNames) {
    String _temp0 = intl.Intl.selectLogic(routesNames, {
      'loginRoute': 'ورود',
      'registerRoute': 'ثبت نام',
      'searchRoute': 'جستجو',
      'resultRoute': 'نتیجه',
      'forgotPassRoute': 'فراموشی رمز عبور',
      'verificationRoute': 'تایید شماره',
      'profileRoute': 'پروفایل',
      'fitnessProfileRoute': 'ترکیب بدن | تناسب اندام',
      'foodReportRoute': 'گزارش تغذیه',
      'coachesListRoute': 'مربیان',
      'coachDetailRoute': 'جزئیات مربی',
      'athleteWorkoutView': 'اجرای تمرین',
      'traineeForm': 'فرم اطلاعات شاگرد',
      'athletesDirectoryRoute': 'مربی',
      'athleteDetailRoute': 'جزئیات شاگرد',
      'vo2maxCalculator': 'هوازی | حداکثر کاهش چربی',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get wellcomeMessage => 'سلام';

  @override
  String appAsyncCardStatusText(String asyncStatus) {
    String _temp0 = intl.Intl.selectLogic(asyncStatus, {
      'inital': 'بدون داده',
      'loading': 'درحال بارگیری',
      'serverConnectionError': 'خطای سرور ، دوباره تلاش کنید',
      'internetConnectionError': 'خطای اینترنت. اینترنت خود را وصل کنید',
      'success': 'داده ای برای نمایش دادن نیست',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get bazzarNotFound =>
      'کافه بازار نصب نشده است. کافه بازار را نصب کنید';

  @override
  String get bazzarSuccessfulPayment => 'اشتراک با موفقیت اضافه شد.';

  @override
  String get bazzarFailPayment => 'فرآیند تمدید اشتراک لغو شد';

  @override
  String get addMeasurementDialogHintTitle => 'شکل بدن';

  @override
  String get addMeasurementDialogHintText1 =>
      'بخاطر پیشگیری از وسواس فکری بیش از هفته‌ای یکبار خود را وزن نکنید.';

  @override
  String get addMeasurementDialogHintText2 =>
      'اندازه گیری شکل بدن نسبت به اندازه گیری وزن بیشتر باعث انگیزه تناسب اندام میشود.';

  @override
  String get addMeasurementDialogHintText3 =>
      'با اندازه گیری شکل بدن متوجه میشوید توزیع کاهش چربی در بدن چه شکلی داشته';

  @override
  String get addMeasurementDialogHintText4 =>
      'زمان اندازه گیری ماهیچه سرد باشد.';

  @override
  String get addMeasurementDialogHintText5 =>
      'حداکثر انقباض یا قطر ماهیچه را اندازه بگیرید.';

  @override
  String get addMeasurementDialogHintText6 =>
      'روش اندازه گیری دور کمر به توصیه سازمان بهداشت جهانی و فدراسیون بین المللی دیابت ';

  @override
  String get addMeasurementDialogHintText6Bold =>
      'بین پایین ترین دنده ها و ستیغ تهیگاهی ';

  @override
  String get addMeasurementDialogHintText7 => 'است.';

  @override
  String get addMeasurementDialogHintText8 =>
      'بالاتر از ناف باشد و پوست زیر متر جمع نشود';

  @override
  String get foodRequerementDialogGeneralRecommendationTitle =>
      'ویتامین و موادمعدنی';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminTitle =>
      'ویتامین و مواد معدنی';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminText2 =>
      'با مصرف میوه و سبزی با رنگ های مختلف در روز استراحت معمولا نیاز به ویتامین و مواد معدنی تامین میشود و برای تشخصی کمبود ویتامین و مواد معدنی به پزشک مراجعه کنید.';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminText3 =>
      'در صبح میزان هرمون هپسیدین در کمترین مقدار هست و آهن بهتر هست در صبح خورده بشه مثل املت اسفناج یا جگر که جذب آهن را حداکثر میکند.';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminText4 =>
      'مصرف آهن برای انتقال اکسیژن در خون و مایچه مهم هست (هموگلوبین و میوگلوبین) . بعد از تمرین بخاطر اثر التهاب ، سطح هرمون تنظیم آهن یعنی هپسیدین به مدت 3 تا 6 ساعت بعد تمرین زیاد میشه و جذب آهن کاهش پیدا میکند و آهن در این مدت کمتر از صبح جذب میشود.';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminText5 =>
      'غذاهای غنی از آهن عبارتند از گوشت و کله پاچه، ساردین، ماهی تن، غلات سبوس دار، زرده تخم مرغ، لوبیا، عدس، سبزیجات برگ سبز، زردآلو خشک، آجیل و دانه ها. ';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminText6 =>
      'جذب آهن با مصرف ویتامین سی مانند پرتقال افزایش پیدا میکنه';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminText7 =>
      'آهن و زینک و کلسیم دارای سیستم جذب و انتقال یکسان هستند پس مصرف زیاد آهن باعث کاهش جذب زینک و کلسیم میشه پس اگر صبح مواد غذایی شامل آهن میخورید سعی کنید مواد غذایی شامل کلسیم مثل شیر یا مواد غذایی شامل زینک مثل گوشت قرمز یا غلات کامل را با آن نخورید.';

  @override
  String get foodRequerementDialogGeneralRecommendationProperSleepTitle =>
      'خواب';

  @override
  String get foodRequerementDialogGeneralRecommendationProperSleepText1 =>
      'خواب کم و شب بیداری باعث افزایش کورتیزل و پرخوری میشود. در نتیجه خوردن قند و چربی زیادتر از نیاز روزانه تان، به شکل چربی و وزن اضافه در بدن جمع میشود .';

  @override
  String get foodRequerementDialogGeneralRecommendationProperSleepText2 =>
      'اگر میخواهید صبح زودتر بیدار شوید، شب 7 تا 8 ساعت زودتر بخواب بروید';

  @override
  String get foodRequerementDialogGeneralRecommendationStressTitle => 'استرس';

  @override
  String get foodRequerementDialogGeneralRecommendationStressText1 =>
      'استرس روزمره و کاری باعث افزایش هورمون کورتیزل و اضطراب میشود و پاسخ طبیعی و ساده معمولا خوردن قند و چربی و نمک زیاد برای افزایش هورمون دوپامین جهت خنثی کردن اضطراب و استرس است. ';

  @override
  String get foodRequerementDialogGeneralRecommendationStressText2 =>
      'در حالت استرس ،میتوانید نفس عمیق بکشید و آب بخورید و ریشه مسئله را پیدا و حل کنید.';

  @override
  String get foodRequerementDialogHydrationTitle => 'آب';

  @override
  String get foodRequerementDialogHydrationRestDayText1 =>
      'نوشیدن ۵۰۰ میلی‌لیتر آب نیم ساعت قبل از هر وعده غذایی همراه با رژیم کم‌کالری می‌تواند به کاهش وزن بیشتر در افراد میانسال و مسن دارای اضافه وزن یا چاقی کمک کند. این کار ساده و بی‌خطر است، اما برای افراد با نارسایی قلبی یا مشکلات شدید کلیوی توصیه نمی‌شود.';

  @override
  String get foodRequerementDialogHydrationRestDayText2 =>
      'نوشیدن آب همراه غذا، به ویژه غذاهای جامد مانند برنج و نان، می‌تواند به فرآیند هضم کمک کند؛ زیرا آب به نرم شدن غذا و عملکرد بهتر آنزیم‌های گوارشی یاری می‌رساند.';

  @override
  String get foodRequerementDialogHydrationRestDaySubtitle1 =>
      'نوشیدن آب و حجم معده';

  @override
  String get foodRequerementDialogHydrationRestDayText3 =>
      'معده یک عضو ماهیچه‌ای با قابلیت انقباض و انبساط است و نوشیدن آب همراه با غذا یا سایر مواد غذایی باعث بزرگ شدن دائمی آن نمی‌شود؛ معده پس از تخلیه، به اندازه طبیعی خود بازمی‌گردد';

  @override
  String get foodRequerementDialogHydrationRestDaySubtitle2 =>
      'مقدار آب‌رسانی موردنیاز';

  @override
  String foodRequerementDialogHydrationRestDayText5(double waterVolume) {
    final intl.NumberFormat waterVolumeNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String waterVolumeString = waterVolumeNumberFormat.format(
      waterVolume,
    );

    return 'اگر در منطقه معتدل آب و هوایی زندگی میکنید خوردن حداقل $waterVolumeString لیتر آب برای شما نیاز است مهم نیست آب از دمنوش و چای و قهوه یا آب میوه یا نوشیدنی انرژی باشد. هرچه محیط گرم تر باشد آب بیشتری نیاز دارید و برعکس.';
  }

  @override
  String get foodRequerementDialogHydrationTrainingTitle => 'آب‌رسانی';

  @override
  String get foodRequerementDialogHydrationTrainingDayText1 =>
      'کم‌آبی بدن باعث استرس قلبی‌عروقی می‌شود و دمای مرکزی بدن را افزایش می‌دهد.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText2 =>
      'پس از تمرین، آب را در چند نوبت و همراه با کمی نمک یا طعم‌دهنده بنوشید تا حجم خون به‌یکباره افزایش نیابد و بدن دچار کم‌آبی نشود؛ مصرف آب خالی می‌تواند احساس تشنگی را کاهش دهد و باعث ادرار بیشتر شود، در نتیجه ممکن است پیش از رفع کامل تشنگی نوشیدن آب را متوقف کنید.';

  @override
  String foodRequerementDialogHydrationTrainingDayText3(
    int fiveTimeWeight,
    int tenTimeWeight,
  ) {
    return 'با توجه به وزن شما، نوشیدن $fiveTimeWeight تا $tenTimeWeight میلی‌لیتر آب ۲ تا ۴ ساعت قبل از تمرین توصیه می‌شود. اگر ادرار نکردید یا رنگ ادرار تیره بود، باید آب بیشتری بنوشید.';
  }

  @override
  String get foodRequerementDialogHydrationTrainingDaySubtitle1 =>
      'مقدار نوشیدن آب';

  @override
  String get foodRequerementDialogHydrationTrainingDaySubtitle2 =>
      'نوشیدنی‌های طعم‌دار';

  @override
  String get foodRequerementDialogHydrationTrainingDaySubtitle3 =>
      'پوسیدگی دندان';

  @override
  String get foodRequerementDialogHydrationTrainingDayText4 =>
      'پس از ورزش، توصیه می‌شود ۱.۲۵ تا ۱.۵ برابر حجم مایعی که در طول تمرین از دست داده‌اید مصرف کنید.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText5 =>
      'در فعالیت‌های سبک یا متوسط زیر ۴۵ دقیقه، آب کافی است. در تمرینات شدیدتر و طولانی‌تر (بیش از ۶۰ تا ۹۰ دقیقه)، نوشیدنی ورزشی با ۴۰ تا ۸۰ گرم کربوهیدرات در هر لیتر توصیه می‌شود. برای تمرینات ۱ تا ۲.۵ ساعت، مصرف ۳۰ تا ۶۰ گرم کربوهیدرات در ساعت و برای تمرینات شدیدتر بیش از ۲.۵ ساعت، تا ۹۰ گرم کربوهیدرات در ساعت (ترکیبی) پیشنهاد می‌شود.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText6 =>
      'سدیم در نوشیدنی ورزشی باعث افزایش میل به نوشیدن، حفظ آب بدن و خوش‌طعم‌تر شدن نوشیدنی می‌شود. کربوهیدرات به جذب بهتر آب و تأمین انرژی کمک می‌کند. نوشیدنی‌های انرژی‌زا حاوی کافئین می‌توانند عملکرد هوازی و بی‌هوازی را بهبود دهند.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText7 =>
      'نوشیدنی‌های ورزشی، نوشابه‌های گازدار و آبمیوه‌ها می‌توانند به دلیل اسیدیته بالا باعث فرسایش مینای دندان شوند؛ این اثر در حین ورزش به دلیل کاهش بزاق تشدید می‌شود.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText8 =>
      'برای محافظت از دندان‌ها: از بطری با نی یا نازل استفاده کنید، آب را به طور متناوب بنوشید و از نوشیدن مداوم یا چرخاندن نوشیدنی در دهان خودداری کنید.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText9 =>
      'برای بررسی وضعیت آب بدن خود، به رنگ ادرار در ابتدای صبح توجه کنید. ادرار رقیق و کم‌رنگ نشان‌دهنده آب رسانی مناسب است، در حالی که رنگ تیره و حجم کم می‌تواند به معنای کم‌آبی بدن باشد که نیازمند نوشیدن آب بیشتر، به خصوص قبل از تمرین، است.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText10 =>
      'کم ابی یا هایپوهیدراشن به روزهای قبل و تمرین های قبلی بستگی داره و کم آبی امروز روی تمرین فردا تاثیر میگذارد.';

  @override
  String get foodRequerementDialogCarbohydrateRestDayText1 =>
      'قند و شکر که اغلب از نیشکر یا چغندر قند فرآوری می‌شوند، نوعی کربوهیدرات هستند. مصرف نوشیدنی‌های حاوی قند افزوده می‌تواند به پوسیدگی دندان منجر شود. این نوع قندها معمولاً در غذاهای فرآوری شده‌ای مانند شکلات، بیسکویت (که اغلب چربی بالایی دارند) یا چیپس (که نمک زیادی دارند) یافت می‌شوند. این دسته از غذاهای فرآوری شده انرژی زیادی دارند اما از نظر مواد مغذی و فیبر فقیر هستند و حجم کمی نسبت به انرژی خود دارند که می‌تواند منجر به احساس گرسنگی زودهنگام شود و دریافت انرژی بیش از نیاز بدن شما بگردد.';

  @override
  String get foodRequerementDialogCarbohydrateRestDaySubtitle1 =>
      'مقدار و نوع کربوهیدرات';

  @override
  String foodRequerementDialogCarbohydrateRestDayText2(
    int fivePercentCalorie,
    int sugarCubeCount,
  ) {
    return 'توصیه می‌شود حداکثر 5 درصد از انرژی روزانه شما، معادل حدود $fivePercentCalorie کیلوکالری، از قندهای افزوده تأمین شود. این مقدار شکر برای شما تقریباً معادل $sugarCubeCount حبه قند است که شامل قند موجود در غذاهای فرآوری‌شده، شربت‌ها، آبمیوه‌ها و عسل می‌شود و قندهای طبیعی موجود در شیر، سبزیجات و میوه‌ها را در بر نمی‌گیرد.';
  }

  @override
  String get foodRequerementDialogCarbohydrateRestDaySubtitle2 => 'میوه و چربی';

  @override
  String get foodRequerementDialogCarbohydrateRestDayText3 =>
      'کربوهیدرات اصلی موجود در میوه‌ها، فروکتوز است. مصرف زیاد فروکتوز در افراد کم‌تحرک می‌تواند باعث افزایش تری‌گلیسیرید و چربی خون شود. با این حال، اگر فعالیت بدنی منظمی دارید، تأثیر آن بر چربی خون معمولاً ناچیز است.';

  @override
  String get foodRequerementDialogCarbohydrateRestDaySubtitle3 =>
      'آنتی‌اکسیدان';

  @override
  String get foodRequerementDialogCarbohydrateRestDayText4 =>
      'حتی در صورت کم‌تحرکی، توصیه می‌شود روزانه حداقل 2 تا 3 واحد میوه مصرف کنید؛ زیرا میوه‌ها منبع عالی آب برای هیدراسیون بدن، فیبر برای تقویت سیستم ایمنی و ترکیبات فیتوشیمیایی برای مقابله با التهاب و اکسیدان‌ها هستند.';

  @override
  String get foodRequerementDialogCarbohydrateRestDayText5 =>
      'در هر وعده غذایی، تلاش کنید تا با تنوع بخشیدن به رنگ میوه‌ها و سبزیجات (سبز، قرمز، بنفش، زرد، سفید و نارنجی)، یک رنگین‌کمان از رنگ‌ها را در بشقاب خود داشته باشید. هر رنگ، حاوی مجموعه‌ای منحصربه‌فرد از مواد مغذی ساخته شده از نور خورشید (ترکیبات گیاهی مفید) است که بسیاری از آن‌ها به عنوان آنتی‌اکسیدان عمل کرده و به محافظت از سلول‌ها در برابر آسیب و کاهش التهاب پس از ورزش کمک می‌کنند.';

  @override
  String get foodRequerementDialogCarbohydrateRestDayText6 =>
      'در روزهای استراحت، با مصرف بیشتر میوه‌ها و سبزیجات، نیازهای ویتامینی و فیبر بدن را تأمین کنید؛ در روزهای تمرین نیز، برای تأمین انرژی مورد نیاز عضلات، بر مصرف کربوهیدرات‌های پیچیده و غنی تمرکز داشته باشید.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceTitle =>
      'کربوهیدرات قبل از ورزش';

  @override
  String foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText1(
    int weight,
    int carbohydrate,
    int protein,
  ) {
    return 'زمان و مقدار مصرف کربوهیدرات پیش از تمرین با یکدیگر مرتبط هستند. به طور کلی، می‌توانید ۱ تا ۴ گرم کربوهیدرات به ازای هر کیلوگرم وزن بدن، از ۱ تا ۴ ساعت پیش از شروع تمرین مصرف کنید. برای نمونه، با وزن $weight کیلوگرم، اگر ۲ ساعت تا آغاز تمرین باقی مانده است، می‌توانید $carbohydrate گرم کربوهیدرات به همراه $protein گرم پروتئین با کیفیت میل کنید.';
  }

  @override
  String
  get foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceSubtitle1 =>
      'زمان خوردن کربوهیدرات';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText2 =>
      'مصرف کربوهیدرات ۱ تا ۴ ساعت پیش از تمرین به افزایش ذخیره گلیکوژن و بهبود عملکرد تمرین کمک می‌کند. خوردن کربوهیدرات تا ۲ ساعت قبل از تمرین، زمان کافی برای هضم و جذب آن را فراهم می‌سازد.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText3 =>
      'در صورتی که وعده غذایی خود را نزدیک به زمان تمرین میل کنید، ممکن است دچار سوهاضمه و ناراحتی معده شوید؛ زیرا هنگام تمرین، جریان خون از معده به سمت عضلات هدایت می‌شود تا اکسیژن را به عضلات برساند.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText4 =>
      'اگر پیش از تمرین دچار ناراحتی معده یا سوهاضمه شدید، توصیه می‌شود دو ساعت پیش از شروع تمرین یک میان‌وعده سبک و ساده با کربوهیدرات با شاخص گلیسمی بالا مانند موز یا سایر میوه‌های تازه یا خشک و یک مشت آجیل میل کنید. همچنین می‌توانید نان و کره مغزیجات (مانند کره پسته یا بادام‌زمینی) یا فرنی و جودوسر با شیر (اوتمیل) مصرف نمایید.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceTitle =>
      'کربوهیدرات هنگام ورزش';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText1 =>
      'تا پیش از ۴۵ دقیقه تمرین، به جز آب نیازی به مصرف ماده غذایی دیگری نیست؛ زیرا در این مدت، احتمال تخلیه ذخایر گلیکوژن پایین است.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText2 =>
      'برای تمرین‌های ۴۵ تا ۷۵ دقیقه‌ای، می‌توانید کربوهیدرات شیرین را بمکید یا بچشید تا هم پیام خستگی به مغز کاهش یابد و هم در صورت دشواری خوردن هنگام تمرین، از مشکلات گوارشی جلوگیری شود.';

  @override
  String
  get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceSubtitle1 =>
      'حداکثر مقدار کربوهیدرات';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText3 =>
      'در تمرین‌های بیش از یک ساعت، می‌توانید به ازای هر ساعت، ۳۰ تا ۶۰ گرم کربوهیدرات بسته به شدت تمرین مصرف کنید. بدن قادر نیست بیش از ۱ گرم گلوکز در دقیقه را در عضله با اکسیژن ترکیب کند؛ مصرف بیش از ۶۰ گرم کربوهیدرات در ساعت ممکن است مشکلات گوارشی ایجاد کند و سود بیشتری نخواهد داشت.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText4 =>
      'حدود ۱۵ تا ۲۰ دقیقه طول می‌کشد تا کربوهیدرات مصرف‌شده به عضلات برسد؛ بنابراین، میان‌وعده تمرینی را پیش از شروع خستگی میل کنید. معمولاً هر ۲۰ تا ۳۰ دقیقه در طول تمرین می‌توانید کربوهیدرات مصرف نمایید.';

  @override
  String
  get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceSubtitle2 =>
      'نمونه‌های کربوهیدرات زمان تمرین';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText5 =>
      'سه نمونه از میان‌وعده‌های مناسب تمرین شامل یک عدد موز، دو عدد خرما یا یک عدد انبه است که هرکدام حدود ۳۰ گرم کربوهیدرات دارند. در صورت شدت بالای تمرین، می‌توانید تا دو برابر این مقدار مصرف کنید.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceTitle =>
      'کربوهیدرات بعد از ورزش';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText1 =>
      'گلیکوژن مصرف‌شده در طول تمرین باید برای تمرین‌های روزهای بعد جبران شود؛ در غیر این صورت، عملکرد تمرینات بعدی کاهش می‌یابد.';

  @override
  String
  get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceSubtitle1 =>
      'مقدار خوردن کربوهیدرات بعد تمرین';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText2 =>
      'در دو ساعت پس از تمرین، ذخیره‌سازی گلیکوژن تا ۱۵۰ درصد بیشتر از حالت عادی انجام می‌شود.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText3 =>
      'در دو ساعت ابتدایی پس از تمرین، جذب گلوکز بیشتر است؛ زیرا هم میزان گلوکز خون افزایش یافته و هم نفوذپذیری غشای سلولی برای دریافت گلوکز نسبت به حالت عادی بیشتر می‌شود.';

  @override
  String
  get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceSubtitle2 =>
      'کربوهیدرات و پروتئین';

  @override
  String foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText4(
    int carbohydrateValu1,
    int carbohydrateValu2,
  ) {
    return 'تا چهار ساعت پس از تمرین، می‌توانید به ازای هر کیلوگرم وزن بدن، ۱ تا ۱.۲ گرم کربوهیدرات در هر ساعت مصرف کنید که معادل $carbohydrateValu1 تا $carbohydrateValu2 گرم کربوهیدرات در هر ساعت است. این مقدار، حداکثر میزان کربوهیدراتی است که دستگاه گوارش می‌تواند در هر ساعت هضم کند.';
  }

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText5 =>
      'توصیه می‌شود کربوهیدرات را همراه با پروتئین با کیفیت (حاوی لوسین) برای حداکثرسازی عضله‌سازی و تأمین گلیکوژن مصرف کنید.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText6 =>
      'مصرف پروتئین همراه با کربوهیدرات باعث ترشح بیشتر انسولین نسبت به مصرف تنها کربوهیدرات می‌شود. افزایش انسولین، جذب گلوکز و آمینواسیدهای پروتئین توسط سلول‌های عضلانی را افزایش داده و سطح کورتیزول را کاهش می‌دهد؛ در نتیجه، ترکیب پروتئین برای ساخت عضله بیشتر خواهد شد.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText7 =>
      'وجود پروتئین در وعده غذایی پس از تمرین، به ساخت و ترمیم پروتئین عضلات کمک می‌کند و موجب کاهش تجزیه پروتئین و افزایش ذخیره پروتئین در عضلات برای بازسازی پس از تمرین می‌شود.';

  @override
  String foodRequerementDialogProteinRestDayText1(int proteinPerMeal) {
    return 'سعی کنید هر 3 ساعت در 5 وعده و هر وعده به مقدار مساوی و منظم حدود $proteinPerMeal گرم در هر وعده پروتئین بخورید*. پروتئین باعث سیری طولانی مدت تر نسبت به کربوهیدرات میشود و در کنار غلات سبوس دار و حبوبات فیبر دار باعث سیری و کاهش اشتها در روز میشود . 30 درصد از پروتئین را از منبع شیر و محصولات لبنی تامین کنید که همزمان غنی از کلسیم هستند.';
  }

  @override
  String get foodRequerementDialogProteinRestDayText2 =>
      'تمام پروتئین های حیوانی مانند شیر و گوشت با کیفیت هستند. اگر 9 آمینو اسید ضروری در ماده غذایی تقریبا به اندازه نیاز بدن باشد به آنها پروتئین با کیفیت بالا میگیم، به همین خاطر بین مواد غذایی گیاهی ، سویا(شیر و ماست سویا) ، گندم سیاه، دانه کینوا، دانه چیا و دانه کنف یا شاهدانه غذای گیاهی شامل پروتئین با کیفیت بالا هستند.';

  @override
  String get foodRequerementDialogProteinRestDaySubtitile1 => 'پروتئین باکیفیت';

  @override
  String get foodRequerementDialogProteinRestDayText3 =>
      'همچنین لوبیا، عدس، نخود، غلات و آجیل ها شامل برخی آمینو اسید های ضروری هستند که میتوانید با خوردن ترکیبی ازین مواد غذایی نیاز بدن به امینو اسید های ضروری را در 24 ساعت تامین کنید.برای مثال خوردن لوبیا و برنج و آجیل هر 9 آمینو اسید ضروری را تامین میکنند.';

  @override
  String get foodRequerementDialogProteinRestDaySubtitile2 =>
      'پروتئین موردنیاز شما';

  @override
  String foodRequerementDialogProteinRestDayText4(double proteinPerBodyWeight) {
    final intl.NumberFormat proteinPerBodyWeightNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String proteinPerBodyWeightString = proteinPerBodyWeightNumberFormat
        .format(proteinPerBodyWeight);

    return 'پروتئین با مقدار جذب بیشتر از روده بزرگ و امتیاز بیشتر DIAAS : شیر و تخم مرغ و سویا و محصولات سویا و نخود  وعدس سبز و لوبیا سیاه و بادام زمینی و برنج سفید هستند. شما روزانه به $proteinPerBodyWeightString گرم پروتئین به ازای هر کیلو از وزن بدنتون نیاز دارید تا با توجه به سطح فعالیت هفتگی و سرعت کاهش وزن عضله‌های خود را حفظ و افزایش دهید.';
  }

  @override
  String get foodRequerementDialogProteinRestDayText5 =>
      '*مبتدیان مقدار پروتئین بیشتری نسبت به ورزشکار حرفه ای نیاز دارند ( تا 3 هفته اول 40 درصد بیشتر از افراد حرفه ای هست)';

  @override
  String get foodRequerementDialogProteinRestDaySubtitile3 => 'لاغری بدون ورزش';

  @override
  String get foodRequerementDialogProteinRestDayText6 =>
      'اگر به اندازه کافی پروتئین بخورید میتوانید بدون ورزش و با حداقل کاهش ماهیچه ، چربی کم کنید.';

  @override
  String get foodRequerementDialogProteinRestDayText7 =>
      'برای سرعت بیشتر کاهش چربی و تناسب اندام و همچنین افزایش ماهیچه میتوانید ورزش پرورش اندام یا دیگر ورزش ها مانند بوکس یا شنا را انجام دهید';

  @override
  String get foodRequerementDialogProteinTrainingDayText1 =>
      'میل کردن غذای پروتئینی همراه با تمرین مقاومتی به ساخت ماهیچه کمک می‌کند. افزایش حجم ماهیچه باعث بالا رفتن نرخ سوخت‌وساز، کاهش سریع‌تر وزن، افزایش اعتماد به نفس و بهبود تناسب اندام می‌شود.';

  @override
  String get foodRequerementDialogProteinTrainingDayText2 =>
      'برای ساخت ماهیچه، مصرف پروتئین با کیفیت حاوی لوسین که سریع هضم و جذب می‌شود ضروری است. برای حداکثر عضله‌سازی باید آستانه لوسین (۲ تا ۳ گرم در هر وعده) تأمین شود.';

  @override
  String get foodRequerementDialogProteinTrainingDayText3 =>
      'مواد غذایی زیر حاوی ۲ تا ۳ گرم لوسین هستند و مصرف آن‌ها بعد از تمرین همراه با کربوهیدرات برای حداکثر عضله‌سازی توصیه می‌شود:';

  @override
  String get foodRequerementDialogProteinTrainingDaySubtitle1 =>
      'آستانه لوسین در پروتئین';

  @override
  String get foodRequerementDialogProteinTrainingDaySubtitle2 =>
      'اهمیت پروتئین بعد تمرین';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine1 =>
      '۶۰۰ میلی‌لیتر شیر کامل';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine2 =>
      '۸۵ گرم پنیر چدار';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine3 =>
      '۴۵۰ گرم ماست ساده';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine4 =>
      '۴ عدد تخم‌مرغ (یک زرده و ۴ سفیده توصیه می‌شود)';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine5 =>
      '۸۵ گرم گوشت قرمز یا گوشت پرنده';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine6 =>
      '۱۰۰ گرم ماهی';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine7 =>
      '۱۷ گرم پودر پروتئین وی';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine8 =>
      '۴۰۰ گرم لوبیا یا عدس پخته‌شده';

  @override
  String get foodRequerementDialogProteinTrainingDayText4 =>
      'شیر حاوی آب، پروتئین، کربوهیدرات و مواد مغذی است و گزینه‌ای عالی برای ریکاوری عضلات بعد از تمرین محسوب می‌شود؛ زیرا به تأمین ذخیره گلیکوژن، ساخت ماهیچه و آب‌رسانی بدن کمک می‌کند. نوع شیر (کم‌چرب، پرچرب، شیر قهوه، شیر کاکائو یا طعم‌دار) تفاوتی ندارد.';

  @override
  String get foodRequerementDialogProteinTrainingDayText5 =>
      'برای ریکاوری و عضله‌سازی در پایان شب، مواد غذایی حاوی کازئین مانند شیر، ماست یا مکمل مصرف کنید. پروتئین باعث احساس سیری طولانی‌تر و خواب عمیق‌تر می‌شود.';

  @override
  String get foodRequerementDialogProteinTrainingDayText6 =>
      'پروتئین‌ها از آمینواسیدها ساخته شده‌اند. یازده نوع آمینواسید در بدن ساخته می‌شوند (آمینواسیدهای غیرضروری) و نه نوع دیگر باید از طریق رژیم غذایی تأمین شوند (آمینواسیدهای ضروری).';

  @override
  String get foodRequerementDialogProteinTrainingDayText7 =>
      'پروتئین‌ها به طور مداوم در بدن تجزیه می‌شوند (تجزیه پروتئین عضله) و آمینواسیدها نیز به طور مداوم در ساخت پروتئین‌ها به کار می‌روند (سنتز پروتئین عضله).';

  @override
  String get foodRequerementDialogFatRestDayText1 =>
      'مقدار مصرف چربی بر اساس توصیه سازمان‌های بهداشت جهانی، رژیم مدیترانه‌ای و سبک آشپزی ایرانی، حدود ۳۵ درصد انرژی روزانه است. کاهش مصرف چربی به کاهش وزن، کاهش شاخص توده بدنی و دور کمر و افزایش اعتماد به نفس کمک می‌کند. بیشترین میزان چربی‌سوزی بدن شما در محدوده ۶۲ تا ۶۳ درصد VO2max رخ می‌دهد.';

  @override
  String get foodRequerementDialogFatRestDayText2 =>
      'چربی بیشترین مقدار انرژی را در بین مواد غذایی دارد و مصرف زیاد آن به‌راحتی اتفاق می‌افتد. برای مثال، انرژی یک قاشق غذاخوری روغن معادل ۹ کیلوکالری ضربدر ۱۵ گرم یا ۱۳۵ کیلوکالری است؛ بنابراین به مقدار روغن مصرفی خود دقت کنید.';

  @override
  String get foodRequerementDialogFatRestDaySubtitle1 => 'انواع چربی';

  @override
  String get foodRequerementDialogFatRestDayText3 =>
      '۳۵ درصد انرژی روزانه باید از چربی‌ها تأمین شود که شامل سه بخش زیر است:';

  @override
  String get foodRequerementDialogFatRestDayText4 =>
      '۱۰ درصد چربی اشباع (معمولاً جامد یا نیمه‌جامد در دمای اتاق): روغن‌های گیاهی مانند پالم، نارگیل و کاکائو و همچنین چربی‌های حیوانی مانند دنبه، چربی بین بافت ماهیچه و گوشت، کره و موارد مشابه.';

  @override
  String get foodRequerementDialogFatRestDayText5 =>
      'چربی‌های موجود در محصولات لبنی به دلیل ساختار مولکولی خاص چربی شیر، کلسترول خون را افزایش نمی‌دهند و خطر بیماری قلبی عروقی ندارند. همچنین بخشی از چربی غیراشباع آن به دلیل ترکیب با کلسیم جذب بدن نمی‌شود.';

  @override
  String get foodRequerementDialogFatRestDayText6 =>
      'حداکثر ۱۲ درصد چربی غیراشباع تک‌زنجیره‌ای (معمولاً مایع در دمای اتاق): روغن زیتون، روغن کلزا، روغن آفتابگردان، بادام‌زمینی، روغن فندق و بادام، آووکادو، زیتون، آجیل و دانه‌ها.';

  @override
  String get foodRequerementDialogFatRestDayText7 =>
      'حداقل ۱۳ درصد چربی غیراشباع چندزنجیره‌ای (معمولاً مایع در دمای اتاق): امگا ۳ نوع EPA و DHA عمدتاً در ماهی‌های چرب مانند قزل‌آلا، سالمون و خال‌مخالی و به مقدار کمتر در ماهی تن وجود دارد. حداقل هفته‌ای یک بار ماهی چرب مصرف کنید. روغن کلزا با نسبت ۲ به ۱ امگا ۶ به امگا ۳ و نقطه دود ۱۷۰ درجه سانتی‌گراد برای پخت‌وپز مناسب است.';

  @override
  String get foodRequerementDialogFatRestDayText8 =>
      'چربی منبع مهمی از انرژی برای ورزش است. نسبت مصرف چربی و کربوهیدرات در بدن به شدت و مدت زمان فعالیت، سطح آمادگی جسمانی و رژیم غذایی قبل از ورزش بستگی دارد.';

  @override
  String get foodRequerementDialogFatRestDaySubtitle2 => 'چربی و سلامت قلب';

  @override
  String get foodRequerementDialogFatRestDayText9 =>
      'سطح بالای کلسترول LDL یکی از عوامل اصلی بیماری‌های قلبی عروقی است. جایگزین کردن بخشی از چربی‌های اشباع با چربی‌های غیراشباع به کاهش کلسترول LDL و کاهش خطر بیماری قلبی کمک می‌کند.';

  @override
  String get foodRequerementDialogFatRestDayText10 =>
      'اسیدهای چرب امگا ۳ باعث کاهش التهاب و کاهش خطر بیماری‌های قلبی عروقی و سایر بیماری‌های مزمن می‌شوند.';

  @override
  String get foodRequerementDialogFatRestDayText11 =>
      'مصرف مکمل امگا ۳ می‌تواند به بهبود سازگاری عضلات، متابولیسم انرژی، ریکاوری عضلات و پیشگیری از آسیب کمک کند.';

  @override
  String get vo2maxCalculatorText1 =>
      'در طول تمرینات با شدت کم، چربی سوخت اصلی است، در حالی که کربوهیدرات سوخت اصلی در تمرینات با شدت بالا است.';

  @override
  String get vo2maxCalculatorText2 =>
      'با این حال، اکسیداسیون کل چربی بر حسب گرم با افزایش شدت ورزش از کم به زیاد افزایش می‌یابد، حتی اگر درصد سهم چربی کاهش یابد. این به این دلیل است که کل انرژی مصرفی افزایش می‌یابد، یعنی کالری بیشتری در دقیقه می‌سوزانید.';

  @override
  String get vo2maxCalculatorText3 =>
      'هر چه شدت تمرین بیشتر باشد، سرعت شکسته شدن گلیکوژن ماهیچه بیشتر می‌شود.';

  @override
  String get vo2maxCalculatorText4 =>
      'حداکثر اکسیژن مصرفی (V̇O₂ max) بالاترین نرخی است که بدن می‌تواند در طول فعالیت بدنی به آن برسد و اکسیژن را مصرف کند.';

  @override
  String get vo2maxCalculatorText5 =>
      'در طول تمرینات هوازی، بدن برای تأمین انرژی از ترکیبی از **گلیکوژن عضلانی** و **چربی** استفاده می‌کند.';

  @override
  String get vo2maxCalculatorText6 =>
      'به طور متوسط، بالاترین نرخ اکسیداسیون چربی (\"fat max\") در ۶۲-۶۳٪ VO2max رخ می‌دهد.';

  @override
  String get vo2maxCalculatorText7 =>
      'تمرین با شدت کم (کمتر از **۵۰٪ حداکثر اکسیژن مصرفی**) عمدتاً از طریق **چربی** تأمین سوخت می‌شود.';

  @override
  String get vo2maxCalculatorText8 =>
      'با افزایش شدت تمرین (به عنوان مثال، افزایش سرعت دویدن)، نسبت استفاده از **گلیکوژن** نسبت به چربی افزایش می‌یابد.';

  @override
  String get vo2maxCalculatorText9 =>
      'در تمرین با شدت متوسط (**۵۰ تا ۷۰٪ حداکثر اکسیژن مصرفی**)، گلیکوژن عضلانی حدود نیمی از نیاز انرژی شما را تأمین می‌کند؛ مابقی از **چربی** تأمین می‌شود. **بهینه ترین شدت تمرین برای سوزاندن چربی ۶۲-۶۳٪ حداکثر اکسیژن مصرفی است.**';

  @override
  String get vo2maxCalculatorText10 =>
      'هنگامی که شدت تمرین از **۷۰٪ حداکثر اکسیژن مصرفی** فراتر می‌رود، سرعت شکسته شدن و انتقال چربی برای تأمین انرژی کافی نیست و در نتیجه، **گلیکوژن عضلانی حداقل ۷۵٪** از نیاز انرژی شما را تأمین می‌کند.';

  @override
  String get vo2maxCalculatorText11 =>
      'به طور متوسط، در فعالیت‌های عمدتاً بی‌هوازی (Anaerobic)، ذخایر گلیکوژن عضلانی ظرف **۳۰ تا ۴۵ دقیقه** تخلیه می‌شوند و پس از آن گلیکوژن کبد مورد استفاده قرار می‌گیرد. بنابراین، توصیه می‌شود تمرینات مقاومتی/قدرتی (Strength Training) قبل از تمرینات استقامتی مانند دویدن هوازی انجام شود.';

  @override
  String get vo2maxCalculatorText12 =>
      'پس از تهی شدن ذخایر گلیکوژن عضلانی، **پروتئین** سهم فزاینده‌ای در تأمین نیازهای انرژی ایفا می‌کند. در این حالت، پروتئین‌های عضلانی شکسته می‌شوند تا اسیدهای آمینه لازم برای تولید انرژی و حفظ سطح طبیعی گلوکز خون فراهم شود.';

  @override
  String get vo2maxCalculatorText13 =>
      'برای محاسبه مقدار بهینه و بهترین سرعت برای حداکثر چربی‌سوزی ابتدا تست کوپر را اجرا می‌کنیم و سپس مقدار بهینه مسافتی که باید با سرعت تقریباً ثابت در زمان کاردیو راه بروید را محاسبه می‌کنیم.';

  @override
  String get vo2maxCalculatorText14 =>
      'به مدت ۱۲ دقیقه روی تردمیل یا زمین صاف حداکثر مسافتی که می‌توانید، بدوید. سپس مسافت دویده شده را به متر، برای محاسبه VO2max در کادر زیر وارد کنید.';

  @override
  String get vo2maxCalculatorLabelText => 'مسافت طی شده به متر';

  @override
  String get vo2maxCalculatorHintText => 'مسافت طی شده در ۱۲ دقیقه به متر';

  @override
  String vo2maxCalculatorVo2maxRate(double vo2max) {
    final intl.NumberFormat vo2maxNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 2,
        );
    final String vo2maxString = vo2maxNumberFormat.format(vo2max);

    return 'مقدار VO2max شما $vo2maxString میلی‌لیتر اکسیژن به ازای هر کیلوگرم وزن بدن در دقیقه (mL/kg/min) می‌باشد';
  }

  @override
  String vo2maxCalculatorVo2maxEfficientDistance(
    double maxDistanceInMeterInOneMinues,
  ) {
    final intl.NumberFormat maxDistanceInMeterInOneMinuesNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String maxDistanceInMeterInOneMinuesString =
        maxDistanceInMeterInOneMinuesNumberFormat.format(
          maxDistanceInMeterInOneMinues,
        );

    return 'مسافت بهینه شما در 62 درصد VO2max در هر دقیقه $maxDistanceInMeterInOneMinuesString متر میباشد';
  }

  @override
  String get vo2maxCalculatorVo2maxRecommandation =>
      'برای حداکثر کردن سرعت چربی سوزی بعد از تمرین مقاومتی بین 15 تا 30 دقیقه تمرین هوازی انجام دهید';

  @override
  String vo2maxCalculatorVo2maxDistance(int minutes, int distance) {
    return 'در $minutes دقیقه مسافت $distance متر را با سرعت متوسط طی کنید';
  }

  @override
  String get timeRestrictedText1 =>
      'فستینگ یا غذا خوردن با محدودیت زمانی، نوعی روزه‌داری متناوب است که شامل یک بازه روزه‌داری ۱۲ تا ۱۶ ساعته و یک بازه غذا خوردن ۸ تا ۱۲ ساعته در روز می‌شود.';

  @override
  String get timeRestrictedText2 =>
      'تنظیم وعده‌های غذایی بر اساس ریتم شبانه‌روزی (ساعت زیستی بدن) به بهبود عملکرد بدن، سلامت و کاهش وزن کمک می‌کند.';

  @override
  String get timeRestrictedText3 =>
      'مطالعات نشان داده‌اند که اختلال در ریتم شبانه‌روزی می‌تواند بر هورمون‌های کنترل‌کننده اشتها، مصرف انرژی و قند خون اثر منفی بگذارد.';

  @override
  String get timeRestrictedSubtitle1 => 'مناسبترین زمان فستینگ';

  @override
  String get timeRestrictedText4 =>
      'خوردن از ساعت ۸ صبح تا ۲ ظهر می‌تواند مفید باشد و اشتها و مصرف غذا را کاهش دهد.';

  @override
  String get timeRestrictedText5 =>
      'یک مطالعه نشان داده است که غذا خوردن در یک بازه ۶ ساعته پیش از ساعت ۳ بعدازظهر، گرسنگی و عوامل خطر دیابت نوع ۲ را در مردان مبتلا به پیش‌دیابت کاهش داده است.';

  @override
  String get timeRestrictedSubtitle2 => 'نکات قابل توجه در رژيم ساعات محدود';

  @override
  String get timeRestrictedText6 =>
      'در فستینگ، به دلیل محدودیت زمانی غذا خوردن، احتمال دریافت کالری کمتر و کاهش وزن وجود دارد و همچنین با تنظیم وعده‌ها بر اساس ساعت زیستی بدن، از دیر خوردن شام جلوگیری می‌شود.';

  @override
  String get timeRestrictedText7 =>
      'بیشتر مطالعات فستینگ روی حیوانات انجام شده و شواهد انسانی محدود است؛ تنها تعداد کمی از مطالعات، کاهش وزن را در انسان‌ها نشان داده‌اند.';

  @override
  String get timeRestrictedText8 =>
      'در بازه غذا خوردن، مطابق نیاز انرژی و درشت‌مغذی‌های خود رژیم بگیرید.';

  @override
  String get timeRestrictedText9 =>
      'فستینگ‌های رایج شامل ۱۲ ساعت روزه‌داری و ۱۲ ساعت غذا خوردن است و می‌توانید تا ۱۶ ساعت روزه‌داری را افزایش دهید.';

  @override
  String get timeRestrictedText10 =>
      'نوشیدن مایعات مانند آب و دمنوش در تمام طول شبانه‌روز مجاز است.';

  @override
  String get introductionSkipText => 'بعدا میبینم';

  @override
  String get introductionDoneText => 'دیدم';

  @override
  String get introductionNextText => 'جلو';

  @override
  String get introductionSingleIntroScreen1TitleText => 'پلتفرم لاغری تندرست';

  @override
  String get introductionSingleIntroScreen1DescriptionText =>
      'سریع‌ترین روش لاغری بدون دارو در جهان';

  @override
  String get introductionSingleIntroScreen1BannerText => 'سریع';

  @override
  String get introductionSingleIntroScreen2TitleText => 'تناسب اندام';

  @override
  String get introductionSingleIntroScreen2DescriptionText =>
      'کاهش چربی و افزایش جذابیت اندام شما را در پی دارد';

  @override
  String get introductionSingleIntroScreen3TitleText => 'پشتیبانی';

  @override
  String get introductionSingleIntroScreen3DescriptionText =>
      'پشتیبانی از سفره ایرانی';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationTitle =>
      'تغذیه بزرگسالان';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText1 =>
      'با افزایش سن، عملکرد ورزشی به‌تدریج کاهش می‌یابد؛ این کاهش معمولاً از دهه ۲۰ یا ۳۰ زندگی آغاز می‌شود و هر دهه حدود ۷٪ کمتر می‌شود. علت اصلی این کاهش، افت عملکرد قلب، ریه، کاهش توده و قدرت عضلات و استخوان‌هاست. زنان بیشتر از مردان دچار این تغییرات می‌شوند. کاهش هورمون‌های رشد، تستوسترون و استروژن نقش مهمی دارد و باعث افزایش چربی بدن و کاهش عضله می‌شود.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText2 =>
      'توده استخوانی از میانه دهه ۳۰ کاهش می‌یابد و خطر پوکی استخوان و شکستگی در زنان بالای ۵۰ سال و مردان بالای ۶۰ سال افزایش می‌یابد. انعطاف‌پذیری بدن نیز کمتر شده و ریکاوری و بهبود آسیب‌ها زمان بیشتری می‌برد. برای کاهش آسیب، تمرینات کم‌برخورد و خواب کافی توصیه می‌شود.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText3 =>
      'در زنان، کاهش عملکرد ورزشی زودتر از مردان و معمولاً از ۵۵ تا ۶۰ سالگی آغاز می‌شود، در حالی که در مردان این کاهش از ۷۰ تا ۷۵ سالگی شروع می‌شود. علت اصلی این تفاوت، تغییرات هورمونی دوران پیش‌یائسگی و یائسگی است که باعث کاهش توده عضلانی، افزایش چربی زیرپوستی و احشایی و تغییر توزیع چربی به سمت شکم می‌شود. این تغییرات خطر بیماری‌های قلبی، دیابت نوع ۲ و پوکی استخوان را افزایش می‌دهد.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText4 =>
      'دوران پیش‌یائسگی معمولاً از ۴۵ سالگی آغاز می‌شود و با کاهش هورمون‌های استروژن و پروژسترون همراه است. این تغییرات باعث کاهش توده عضلانی، افزایش چربی شکمی، کاهش تراکم استخوان و کاهش حساسیت به انسولین می‌شود. همچنین، علائمی مانند گرگرفتگی، تغییرات خلقی و اختلال خواب شایع است.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText5 =>
      'یائسگی به خودی خود باعث افزایش وزن نمی‌شود، اما نحوه ذخیره و توزیع چربی بدن را تغییر می‌دهد و چربی بیشتر در ناحیه شکم تجمع می‌یابد. علائمی مانند خستگی و کم‌خوابی می‌تواند منجر به انتخاب‌های غذایی ناسالم و کاهش فعالیت بدنی شود. هورمون‌درمانی جایگزین (HRT) می‌تواند به کاهش تجمع چربی شکمی و حفظ توده عضلانی کمک کند، اما اگر کالری دریافتی بیش از نیاز باشد، افزایش وزن رخ می‌دهد.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText6 =>
      'کاهش توده عضلانی و عملکرد با افزایش سن اجتناب‌ناپذیر نیست. با انجام منظم تمرینات مقاومتی و هوازی، تغذیه مناسب و ریکاوری کافی می‌توان بسیاری از اثرات منفی پیری را کاهش داد یا حتی معکوس کرد. گرم‌کردن پویا و ریکاوری فعال برای پیشگیری از آسیب و حفظ انعطاف‌پذیری اهمیت دارد.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText7 =>
      'تمرینات مقاومتی حداقل دو بار در هفته می‌تواند از سارکوپنی (کاهش عضله) جلوگیری کند و حتی باعث افزایش توده عضلانی و قدرت شود. این تمرینات سطح هورمون‌های رشد و تستوسترون را افزایش داده و به بهبود ترکیب بدن، تراکم استخوان و کنترل قند خون کمک می‌کند.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText8 =>
      'تمرینات هوازی با شدت بالا (HIIT) نسبت به تمرینات هوازی ملایم، تأثیر بیشتری در بهبود ظرفیت هوازی (VO2max)، کنترل قند خون و کاهش چربی بدن دارند. با این حال، تمرینات هوازی با شدت متوسط نیز برای حفظ سلامت قلب و عروق مفید هستند.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText9 =>
      'ریکاوری برای ورزشکاران مسن اهمیت بیشتری دارد. پس از تمرینات شدید یا مقاومتی، زمان ریکاوری باید افزایش یابد. همچنین، استفاده از دوره‌های تمرینی کوتاه‌تر (مثلاً دو هفته تمرین و یک هفته ریکاوری) و ریکاوری فعال مانند پیاده‌روی یا شنا در روزهای استراحت توصیه می‌شود.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText10 =>
      'ورزش‌های مکمل مانند وزنه‌برداری و یوگا به حفظ توده عضلانی و انعطاف‌پذیری کمک می‌کنند و خطر آسیب‌های ناشی از استفاده بیش از حد را کاهش می‌دهند. خواب کافی و عادات خواب سالم برای ریکاوری و عملکرد بهتر ضروری است.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText11 =>
      'با افزایش سن، پاسخ عضلات به پروتئین و ورزش کمتر می‌شود و پدیده‌ای به نام مقاومت آنابولیک رخ می‌دهد. این موضوع باعث کاهش ساخت عضله و افزایش خطر کاهش توده عضلانی می‌شود. برای پیشگیری، مصرف پروتئین کافی و انجام منظم تمرین مقاومتی ضروری است.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText12 =>
      'افراد بالای ۶۵ سال برای حفظ عضله و پیشگیری از سارکوپنی به پروتئین بیشتری نسبت به جوانان نیاز دارند. مقدار توصیه‌شده برای افراد غیرفعال ۱ تا ۱.۲ گرم به ازای هر کیلوگرم وزن بدن و برای افراد فعال ۱.۲ تا ۱.۵ گرم است. مصرف پروتئین در وعده‌های مساوی در طول روز مؤثرتر از مصرف یک‌باره آن است.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText13 =>
      'مصرف ۴۰ گرم پروتئین یا ۰.۴ گرم به ازای هر کیلوگرم وزن بدن در هر وعده، بیشترین تحریک ساخت عضله را در سالمندان ایجاد می‌کند. این مقدار بیشتر از نیاز جوانان است. مصرف پروتئین بلافاصله بعد از تمرین، ساخت عضله را افزایش می‌دهد.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText14 =>
      'مصرف پروتئین با کیفیت بالا شامل تمام آمینواسیدهای ضروری (مانند شیر، لبنیات، تخم‌مرغ، گوشت، ماهی، سویا، کینوا و دانه‌ها) اهمیت دارد. گیاه‌خواران باید ترکیبی از منابع گیاهی مانند حبوبات و غلات مصرف کنند تا همه آمینواسیدهای ضروری تأمین شود.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText15 =>
      'مصرف میان‌وعده پروتئینی قبل از خواب (مانند شیر، ماست یونانی یا نوشیدنی حاوی پروتئین) می‌تواند ساخت عضله را در سالمندان افزایش دهد و اثر تمرین مقاومتی را تقویت کند.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText16 =>
      'با افزایش سن، توانایی ذخیره و استفاده از کربوهیدرات به صورت گلیکوژن در کبد و عضلات حفظ می‌شود و نیاز کربوهیدراتی افراد مسن مشابه جوانان است. اما با کاهش فعالیت بدنی و مصرف انرژی روزانه، مقدار کربوهیدرات مورد نیاز ممکن است کمتر شود.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText17 =>
      'مقدار کربوهیدرات مصرفی باید متناسب با حجم و شدت تمرین و وزن بدن باشد. هرچه وزن و حجم تمرین بیشتر باشد، نیاز به کربوهیدرات نیز بیشتر است. عضلات سالمندان نسبت به آسیب ناشی از تمرینات اکسنتریک (مانند پایین آوردن وزنه یا دویدن سرازیری) حساس‌تر هستند و ترمیم آن‌ها زمان بیشتری می‌برد.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText18 =>
      'برای ریکاوری بهتر پس از تمرین، به‌ویژه اگر کمتر از ۸ ساعت تا تمرین بعدی زمان دارید، مصرف ۱ تا ۱.۲ گرم کربوهیدرات به ازای هر کیلوگرم وزن بدن در هر ساعت طی ۴ ساعت اول توصیه می‌شود. افزودن پروتئین به وعده پس از تمرین به ترمیم عضله و ذخیره گلیکوژن کمک می‌کند.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText19 =>
      'رژیم کم‌کربوهیدرات برای کاهش وزن در ورزشکاران مسن مزیت خاصی نسبت به سایر رژیم‌ها ندارد و مهم‌ترین عامل کاهش وزن، ایجاد کسری کالری و تداوم رژیم است. محدودیت شدید کربوهیدرات می‌تواند عملکرد ورزشی را در تمرینات با شدت متوسط و بالا کاهش دهد.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText20 =>
      'مطالعات کمی روی ورزشکاران زن و سالمند درباره رژیم کم‌کربوهیدرات انجام شده و شواهدی مبنی بر بهبود عملکرد وجود ندارد. زنان به طور طبیعی توانایی بالایی در اکسیداسیون چربی دارند و محدودیت کربوهیدرات برای آن‌ها سودی ندارد.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText21 =>
      'دوره‌بندی مصرف کربوهیدرات (مصرف کمتر در تمرینات سبک و بیشتر در تمرینات شدید) می‌تواند برای ورزشکاران حرفه‌ای مفید باشد و به سازگاری بهتر بدن با تمرینات کمک کند.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText22 =>
      'با افزایش سن، احساس تشنگی و میزان تعریق کاهش می‌یابد و عملکرد کلیه‌ها نیز ضعیف‌تر می‌شود؛ بنابراین سالمندان بیشتر در معرض کم‌آبی بدن قرار دارند. توصیه می‌شود در ۲۴ ساعت قبل از تمرین آب کافی بنوشید و ۲ تا ۴ ساعت قبل از ورزش، به ازای هر کیلوگرم وزن بدن ۵ تا ۱۰ میلی‌لیتر آب مصرف کنید. در طول تمرین، بهتر است طبق برنامه آب بنوشید و فقط به احساس تشنگی اکتفا نکنید.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText23 =>
      'برای پیشگیری از کم‌آبی و پرآبی، مصرف ۴۰۰ تا ۸۰۰ میلی‌لیتر آب در هر ساعت تمرین توصیه می‌شود. پس از تمرین، به ازای هر کیلوگرم وزنی که از دست داده‌اید، ۱.۲ تا ۱.۵ لیتر آب بنوشید. وزن‌کشی قبل و بعد از تمرین به شما کمک می‌کند میزان آب مورد نیاز را بهتر تنظیم کنید.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText24 =>
      'مکمل امگا ۳ می‌تواند به کاهش التهاب و پیشگیری از کاهش عضله در سالمندان کمک کند. مصرف روزانه ۴۵۰ تا ۹۰۰ میلی‌گرم امگا ۳ یا دو وعده ماهی (یک وعده ماهی چرب) در هفته توصیه می‌شود. منابع خوب امگا ۳ شامل ماهی‌های چرب، بذر کتان، تخم کدو، گردو و دانه چیا هستند.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText25 =>
      'مصرف مکمل کراتین همراه با تمرین مقاومتی باعث افزایش قدرت، توده عضلانی و عملکرد بدنی سالمندان می‌شود. دوز معمول ۵ گرم در روز است و کراتین مونوهیدرات بهترین و مطمئن‌ترین نوع آن است.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationRestDayText26 =>
      'ویتامین D برای سلامت استخوان، عضله، سیستم ایمنی و عملکرد قلب و مغز ضروری است. با افزایش سن، کمبود ویتامین D شایع‌تر می‌شود. منابع غذایی محدودند (تخم‌مرغ، جگر، ماهی چرب، لبنیات غنی‌شده)، بنابراین مصرف مکمل روزانه ۱۰ میکروگرم (۴۰۰ واحد) برای سالمندان توصیه می‌شود. در صورت کمبود شدید، دوز بالاتر طبق نظر پزشک مصرف شود.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText1 =>
      'قدرت و توان عضلانی با افزایش سن سریع‌تر کاهش می‌یابد، مگر اینکه تمرینات مقاومتی (وزنه یا کششی) به برنامه ورزشی اضافه شود. کاهش توده عضله قلب نیز باعث افت عملکرد قلب و ریه می‌شود.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText2 =>
      'در افراد کم‌تحرک، حجم ضربه‌ای قلب، حداکثر ضربان قلب و توانایی استفاده از اکسیژن (VO2max) از میانه دهه ۲۰ هر دهه حدود ۱۰٪ کاهش می‌یابد. این کاهش باعث افت استقامت و عملکرد ورزشی می‌شود. ریکاوری بعد از تمرینات سخت طولانی‌تر شده و احتمال آسیب‌های مزمن بیشتر می‌شود؛ بنابراین باید شدت و حجم تمرینات را با افزایش سن تنظیم و به ریکاوری توجه بیشتری کرد.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText3 =>
      'در دوران پیش‌یائسگی و یائسگی، کاهش هورمون‌های زنانه باعث کاهش ساخت عضله و افزایش تجزیه عضلات می‌شود. همچنین، حساسیت بدن به ورزش و پروتئین کمتر می‌شود و ریکاوری کندتر خواهد بود. برای حفظ سلامت عضلات و استخوان‌ها، انجام تمرینات مقاومتی و مصرف پروتئین کافی اهمیت بیشتری دارد.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText4 =>
      'تمرینات مقاومتی با تکرار کم و وزنه سنگین باعث افزایش قدرت، توده عضلانی، تراکم استخوان و کارایی متابولیک می‌شود. در زنان یائسه، این تمرینات به بهبود ترکیب بدن، کاهش چربی شکمی و کنترل قند خون کمک می‌کند.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText5 =>
      'تمرینات هوازی با شدت بالا (HIIT) و تمرینات تناوبی بیشترین تأثیر را در افزایش VO2max و بهبود سلامت قلب دارند. نسبت ۲ به ۱ (۲۰ ثانیه فعالیت، ۱۰ ثانیه استراحت) برای بهبود سیستم قلبی-عروقی مؤثر است. ترکیب انواع تمرینات و شدت‌ها بهترین نتیجه را دارد.';

  @override
  String get foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText6 =>
      'افراد فعال در سنین بالا می‌توانند سطح آمادگی جسمانی بالاتری نسبت به افراد کم‌تحرک جوان داشته باشند. تمرین منظم هوازی و مقاومتی باعث حفظ قدرت، استقامت و ظرفیت هوازی می‌شود و روند افت عملکرد با افزایش سن را به تأخیر می‌اندازد.';

  @override
  String get foodInputChatButtonLoadingText1 => 'در حال پردازش...';

  @override
  String get foodInputChatButtonLoadingText2 => 'لطفاً منتظر بمانید';

  @override
  String get privacyDialogTitle => 'شرایط استفاده';

  @override
  String get privacyDialogSubtitle0 => 'قرآن';

  @override
  String get privacyDialogText0 =>
      'قوانین و شرایط استفاده مطابق متن عربی مبین قرآن است و مراجع و کتب غیرقرآن ساخت بشر و ممکن است دارای خطا یا تناقض با قرآن باشند';

  @override
  String get privacyDialogTitle1 => 'چگونه از اطلاعات شما حراست میکنیم؟';

  @override
  String get privacyDialogSubtitle1 => 'چگونه از اطلاعات شما حراست میکنیم؟';

  @override
  String get privacyDialogSubtitle2 => 'چه اطلاعاتی از شما دریافت می‌شود؟';

  @override
  String get privacyDialogSubtitle3 => 'چگونه از اطلاعات شما محافظت می‌شود؟';

  @override
  String get privacyDialogSubtitle4 => 'چه استفاده‌ای اطلاعات شما خواهد شد؟';

  @override
  String get privacyDialogSubtitle5 => 'چه کسانی به اطلاعات شما دسترسی دارند؟';

  @override
  String get privacyDialogText1 =>
      'امروزه با گسترش جریان اطلاعات و استفاده روزمره کاربران از اینترنت و وسایل ارتباطی، حریم خصوصی کاربران به یکی از جدی‌ترین دغدغه‌ها تبدیل شده‌است. نگرانی بسیاری از مشتریان، محفوظ ماندن اطلاعات شخصی همچنین شماره موبایل، نام و نام خانوادگی و ایمیل است که برای ثبت نام و لاگین شدن به ما می‌سپارند. باید گفت ما نیز اهمیت این موضوع را درک می‌کنیم و حریم خصوصی کاربران برای ما اهمیت بسیاری دارد. در ذیل سیاست حفظ حریم خصوصی و محرمانگی اطلاعات کاربران را ملاحظه خواهیدکرد.';

  @override
  String get privacyDialogText2 =>
      'برای ثبت نام در اپلیکشین تندرست لازم است تا اطلاعاتی مانند نام، تلفن همراه، تاریخ تولد و قد و وزن و اندازه ترکیب بدنی خود را در اختیار ما قرار دهید. دریافت مشخصات فردی شما نیز صرفاً برای ثبت نام در سایت، محاسبات تغذیه شما مانند انرژی مورد نیاز روزانه، ارسال اعلان‌های مهم و باخبر کردن شما از رویدادها و تخفیف‌های ویژه، استفاده از خدمات تندرست است.';

  @override
  String get privacyDialogText3 =>
      'با وجود این‌که امنیت به صورت نسبی تعریف شده است اما در طراحی اپلیکیشن تندرست سعی شده که از بالاترین سطوح امنیتی سخت‌افزاری و نرم‌افزاری در نظر گرفته شود. در زمان ثبت نام، درخواست کد اعتبار، دریافت داده های کاربر، گزارشات و غیره، تمامی در خواست‌ها و خدمات بر روی سرورهای ایمن ما ذخیره و توسط فایروال‌های مستحکم محافظت خواهند شد. اطلاعات شخصی شما نیز به صورت رمزنگاری‌شده در بستر امن HTTPS به وب‌سایت ما منتقل و برای تعاملات بعدی نگهداری خواهند شد.';

  @override
  String get privacyDialogText4 =>
      'چه از نظر قانونی چه از نظر اخلاقی ما موظف به صیانت از اطلاعات و پرونده‌های شما هستیم. اطلاعات شخصی شما نیز صرفاً جهت تعاملات بعدی به صورت ایمن در پایگاه داده نگهداری می‌شوند تا در درخواست‌های آینده بتوانید به راحتی از نرم افزار استفاده کنید . ایمیل‌ها و پیام‌های تبلیغاتی بی مورد را برای کاربران‌مان ارسال نخواهیم کرد.';

  @override
  String get privacyDialogText5 =>
      'برای ارائه پشتیبانی بهتر و خدمات با کیفیت‌تر بخش پشتیبانی به برخی از اطلاعات شما دسترسی دارند. تمامی اطلاعات شخصی شما نزد ما محفوظ خواهد ماند و در اختیار افراد یا سازمان‌های دیگری قرار نخواهد گرفت. بدیهی است که مراجع قانونی با ارائه حکم دادگاه قادرند به این اطلاعات دسترسی داشته باشند. به طور کلی ما موظفیم از اطلاعات شما حفاظت و حراست نماییم.';

  @override
  String get privacyDialogText6 =>
      'امیدواریم بهترین استفاده را از نرم افزار تندرست داشته باشید';

  @override
  String get aiChatButtonTitle =>
      'دکمه را نگه دارید و نام غذاهایی که خوردید خلاصه و بدون مکث بگویید';

  @override
  String get aiChatButtonSubTitle =>
      'یا آیکن کیبورد را لمس کنید و نام غذاهایی که خوردید تایپ نمایید.';

  @override
  String get paymentDialogTitle => 'ارتقا اشتراک';

  @override
  String get paymentDialogOneMonth => 'ارتقا به برنزی';

  @override
  String get paymentDialogThreeMonth => 'ارتقا به نقره‌ای';

  @override
  String get paymentDialogSixMonth => 'ارتقا به طلایی';

  @override
  String get paymentDialogIrCurrency => 'هزار تومان';

  @override
  String get paymentDialogText1 => 'سریع‌ترین روش لاغری بدون دارو';

  @override
  String get paymentDialogText2 => 'پیشگیری از بیماری‌های مرتبط با چاقی';

  @override
  String get paymentDialogText3 => 'تغذیه ورزشی و غیرورزشی';

  @override
  String get paymentDialogText4 => 'بیش از 2 میلیون دستور پخت';

  @override
  String get paymentDialogOneMonthText5 => 'یک ماه';

  @override
  String get paymentDialogThreeMonthText5 => 'یک ماه رایگان (سه ماه)';

  @override
  String get paymentDialogSixMonthText5 => 'دو ماه رایگان (شش ماه)';

  @override
  String get paymentDialogText6 => 'مطابق سفره ایرانی';

  @override
  String get paymentDialogText7 => 'با پشتیبانی تلفنی مربی';

  @override
  String get paymentDialogSubmitButtonLabel => 'ادامه';

  @override
  String get profileRouteTansactionDialogTitle => 'لیست تراکنش‌ها';

  @override
  String get profileRouteTansactionListTileID => 'شناسه';

  @override
  String get profileRouteTansactionListTilePaidAmount => 'مبلغ پرداختی';

  @override
  String get profileRouteTansactionListTilePaymentMethod => 'روش پرداخت';

  @override
  String get profileRouteTansactionListTilePurchaseDate => 'تاریخ خرید';

  @override
  String get profileRouteTansactionListTileExpireDate => 'تاریخ اتمام';

  @override
  String get profileRouteTansactionListTileUpdatedAt => 'تاریخ بروزرسانی';

  @override
  String get profileRouteTansactionListTileProgramId =>
      'شناسه برنامه پشتیبانی مربی';

  @override
  String get profileRouteTansactionListTileSubscriptionType => 'نوع اشتراک';

  @override
  String get profileRouteTansactionListTileCafeBazzarOrderID =>
      'شناسه کافه بازار';

  @override
  String get profileRouteTansactionListTileFoodRequestLimit =>
      'تعداد غذای قابل ثبت';

  @override
  String get profileRouteTansactionListTileNumberOfRequestedFoods =>
      'تعداد غذای ثبت شده';

  @override
  String get profileRouteTansactionListTileActive => 'فعال';

  @override
  String get searchRouteMicrophonePermissionMessage =>
      'لطفا برای گفتن غذاها دسترسی میکرفن دستگاه را بدهید';

  @override
  String get scheduleMessageTitle => 'یادآوری ثبت وعده غذایی';

  @override
  String get scheduleMessageBody =>
      'لطفا وعده‌های غذایی امروز خود را ثبت کنید 👏';

  @override
  String get scheduleMessageHint => 'وعده‌های غذایی...';

  @override
  String get reviewDialogTitle => 'نظر بدهید 👏';

  @override
  String get reviewDialogText =>
      'کاربر محترم برای حمایت و بهبود امکانات پلتفرم تندرست امتیاز 5 ستاره و نظر سازنده خود را بدهید';

  @override
  String get reviewDialogSubmitButtonText => 'ثبت نظر';

  @override
  String get homeWidgetDialogTitle => 'اضاف کردن Home Widget';

  @override
  String get homeWidgetDialogText =>
      'برای صرفه‌جویی در زمان Home Widget را به صفحه اصلی اضافه نمایید';

  @override
  String get homeWidgetDialogSubmitButtonText => 'اضافه کردن';

  @override
  String get paymentDialogCarouselTitle => 'تصاویر ما';

  @override
  String get googleAuthExceptionCanceled => 'ورود با گوگل لغو شد';

  @override
  String get googleAuthExceptionUnknownError => 'خطای ناشناخته در ورود با گوگل';

  @override
  String get googleAuthExceptionInterrupted => 'فرآیند ورود با گوگل قطع شد';

  @override
  String get googleAuthExceptionClientConfigurationError =>
      'خطا در پیکربندی کلاینت ورود با گوگل';

  @override
  String get googleAuthExceptionProviderConfigurationError =>
      'خطا در پیکربندی ارائه‌دهنده ورود با گوگل';

  @override
  String get googleAuthExceptionUiUnavailable =>
      'رابط کاربری ورود با گوگل در دسترس نیست';

  @override
  String get googleAuthExceptionUserMismatch =>
      'کاربر ورود با گوگل مطابقت ندارد';

  @override
  String get prfileArchiveImagesButtonTooltip => 'آرشیو کردن تصاویر در سرور';

  @override
  String get profileAchievementsLabel => 'افتخارات';

  @override
  String get profileCertificatesLabel => 'گواهینامه‌ها';

  @override
  String get profileImageCoachDescriptionDialogTitle => 'توضیحات تصویر';

  @override
  String get profileImageCoachDescriptionDialogTextFieldLabel => 'توضیحات';

  @override
  String get profileImageCoachDescriptionDialogTextFieldHint =>
      'مدرک مربیگری یا قهرمانی کشوری';

  @override
  String get profileCoachProfileCoachProgramCardTitle => 'برنامه‌های مربی';

  @override
  String get profileCoachProfileCoachProgramDialogTitle => 'برنامه مربی';

  @override
  String get profileCoachProfileCoachProgramTitleLabel => 'عنوان برنامه';

  @override
  String get profileCoachProfileCoachProgramDescriptionLabel => 'شرح برنامه';

  @override
  String get profileCoachProfileCoachProgramPriceLabel => 'قیمت';

  @override
  String get profileCoachProfileCoachProgramDurationWeekLabel =>
      'مدت برنامه( تعداد هفته)';

  @override
  String get profileCoachProfileCoachProgramFeatureLabel => 'ویژگی‌های برنامه';

  @override
  String get profileCoachProfileCoachProgramElevatedButoonTitle =>
      'خرید برنامه';

  @override
  String profileCoachProfileCoachProgramFeatureValue(String feature) {
    String _temp0 = intl.Intl.selectLogic(feature, {
      'phoneSupport': 'پشتیبانی تلفنی',
      'personalizedNutritionGuide': 'راهنمای تغذیه شخصی‌سازی‌شده',
      'personalizedSportSupplementGuide': 'راهنمای مکمل ورزشی شخصی‌سازی‌شده',
      'formingCheckVideoSupport': 'پشتیبانی بررسی فرم حرکت انجام‌شده با ویدیو',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get profileCoachProfileCoachProgramDurationWeekFieldValidationError =>
      'مدت باید بزرگتر از صفر باشد';

  @override
  String get profileCoachProfileCoachProgramSaveButtonLabel =>
      'اضافه کردن برنامه';

  @override
  String get profileCoachProfileCoachProgramDeleteDialogTitle => 'حذف برنامه';

  @override
  String get profileCoachProfileCoachProgramDeleteDialogLabel =>
      'آیا این برنامه مربی حذف شود؟';

  @override
  String get coachDetailLanguageLabel => 'زبان مربی';

  @override
  String get verifyByAiSnackbar =>
      'فرآیند احراز هویت هوش مصنوعی Gemini ممکن است اشتباه باشد ، بنابراین دوباره بررسی کنید';

  @override
  String get coachListEmptyListlabel =>
      'مربی فعالی پیدا نمیشود. لطفا با پشتیبانی تماس بگیرید';

  @override
  String get athleteListEmptyListlabel =>
      'هنوز شاگردی ندارید، تبلیغ کنید یا شاگرد دعوت کنید';

  @override
  String get histoyListEmptyListlabel => 'درخواست‌های شاگرد در دسترس نیست';

  @override
  String get inviteTraineeSectionHeadline => 'دعوت از شاگرد';

  @override
  String get inviteTraineeSectionSubtitle1 =>
      'با دعوت شاگرد، خرید برنامه‌های شما در نرم افزار برای شاگرد رایگان میشود';

  @override
  String get inviteTraineeSectionSubtitle2 =>
      'دستمزد مربی‌گری را مستقیم مانند کارت به کارت دریافت نمایید';

  @override
  String get inviteTraineeSectionTextFieldHint =>
      'شماره همراه یا ایمیل وارد کنید';

  @override
  String get inviteTraineeSectionTextFieldLabel => 'شماره همراه یا ایمیل شاگرد';

  @override
  String get inviteTraineeSectionSubmitButton => 'ارسال دعوتنامه';

  @override
  String get financeSectionHeadline => 'حسابداری';

  @override
  String financeSectionBalance(double balanceValue, String currency) {
    final intl.NumberFormat balanceValueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 2,
        );
    final String balanceValueString = balanceValueNumberFormat.format(
      balanceValue,
    );

    return 'موجودی حسابتون در پلتفرم تندرست $balanceValueString $currency ';
  }

  @override
  String get financeSectionBalanceSubtitle =>
      'دستمزدهای شما را 2 هفته بعد از خرید و نداشتن شکایت از مشتریان واریز میکنیم';

  @override
  String get traineeHistoryFormIllnessHitoryLabel => 'سابقه بیماری';

  @override
  String get traineeHistoryFormIllnessHitoryHint =>
      'آیا تاکنون جراحی داشته‌اید؟ اگر بله، لطفاً نوع آن را بنویس. آیا تاکنون پزشک به شما گفته است که به بیماری قلبی، فشار خون بالا، دیابت، آسم یا هر بیماری مزمن یا کهنه دیگری مبتلا هستید؟ لطفاً توضیح دهید.';

  @override
  String get traineeHistoryFormInguryHitoryLabel => 'آسیب‌های گذشته';

  @override
  String get traineeHistoryFormInguryHitoryHint =>
      'آیا در حال حاضر یا در گذشته دچار آسیب‌دیدگی جدی در مفاصل (مانند زانو، شانه، کمر) یا عضلات شده‌اید؟ اگر بله، لطفاً نوع آسیب و وضعیت فعلی آن را شرح دهید.';

  @override
  String get traineeHistoryFormDisabilitiesHitoryLabel => 'محدودیت جسمانی';

  @override
  String get traineeHistoryFormDisabilitiesHitoryHint =>
      'آیا شرایط خاصی مانند دیسک کمر، آرتروز یا مشکلات تعادلی دارید که مربی باید از آن آگاه باشد?';

  @override
  String get traineeHistoryFormSupplementLabel => 'مکمل‌های مصرفی';

  @override
  String get traineeHistoryFormSupplementHint =>
      'آیا در حال حاضر مکمل خاصی مصرف می‌کنید که ممکن است بر انرژی، ضربان قلب یا توانایی ورزشی شما تأثیر بگذارد؟ لطفاً نام مکمل و دلیل مصرف را ذکر کنید.';

  @override
  String get traineeHistoryFormGoalsLabel =>
      'اولویت اهداف شما از شروع این برنامه چیست؟';

  @override
  String get traineeHistoryFormGoalsHint =>
      'ممکن است مربی هدف بهتری را پیشنهاد دهد';

  @override
  String traineeHistoryFormGoalsValue(String goal) {
    String _temp0 = intl.Intl.selectLogic(goal, {
      'loseWeight': 'کاهش وزن',
      'power': 'سرعت و توان',
      'strength': 'قدرت',
      'endurance': 'استقامت',
      'hypertrophy': 'هایپرتروفی یا افزایش ماهیچه',
      'prepareASportingEvent': 'آمادگی برای مسابقه',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get traineeHistoryDailyActivityLabel => 'فعالیت روزانه و سبک زندگی';

  @override
  String get traineeHistoryDailyActivityHint =>
      'شغل یا فعالیت روزانه شما چیست و بدن شما در چه حالتی و زیر چه استرسی قرار دارد.به طور میانگین در طول روز چند ساعت می‌نشینید';

  @override
  String get traineeHistorySportTrainingHistoryLabel =>
      'سابقه ورزشی و نوع تمرینات قبل';

  @override
  String get traineeHistorySportTrainingHistoryHint =>
      'چه ورزش‌هایی قبلاً انجام داده‌اید؟ نوع تمرینات و مدت سابقه را بنویسید.';

  @override
  String get traineeHistoryCurrentPracticeFrequencyPerWeekLabel =>
      'تعداد دفعات فعلی تمرین در هفته';

  @override
  String get traineeHistoryCurrentPracticeFrequencyPerWeekHint =>
      'در حال حاضر چند روز تمرین میکنید؟ ممکن است مربی تعداد روز متفاوتی پیشنهاد دهد';

  @override
  String get traineeHistoryExerciseEquipmentLabel => 'دسترسی به تجهیزات ورزشی';

  @override
  String traineeHistoryExerciseEquipmentValue(String equipment) {
    String _temp0 = intl.Intl.selectLogic(equipment, {
      'weightMachine': 'دستگاه بدنسازی',
      'cableMachine': 'دستگاه سیمکش',
      'bodyWeight': 'وزن بدن',
      'barbell': 'هالتر',
      'dumbbell': 'دمبل',
      'band': 'کش تمرینی',
      'kettlebell': 'کتل‌بل',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String exerciseDefinitionFocusAreaValue(String focusArea) {
    String _temp0 = intl.Intl.selectLogic(focusArea, {
      'arm': 'بازو',
      'shoulder': 'شانه',
      'chest': 'سینه',
      'back': 'پشت',
      'leg': 'پا',
      'buttocks': 'باسن',
      'abdomen': 'شکم',
      'fullBody': 'کل بدن',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get athleteDetailRouteEnrollmentDate => 'تاریخ ثبت‌نام';

  @override
  String get athleteDetailRouteHistoryIllness => 'سابقه بیماری';

  @override
  String get athleteDetailRouteHistoryInjuries => 'آسیب‌های گذشته';

  @override
  String get athleteDetailRouteHistoryDisabilities => 'محدودیت جسمانی';

  @override
  String get athleteDetailRouteHistorySportTrainingHistory =>
      'سابقه ورزشی و نوع تمرینات قبل';

  @override
  String get athleteDetailRouteHistoryPracticeFrequencyPerWeek =>
      'تعداد دفعات فعلی تمرین در هفته';

  @override
  String get athleteDetailRouteHistoryExerciseGoal => 'هدف تمرین';

  @override
  String get athleteDetailRouteHistoryExerciseEquipment => 'تجهیزات ورزشی';

  @override
  String get athleteDetailRouteHistoryDailyActivity =>
      'فعالیت روزانه و سبک زندگی';

  @override
  String get athleteDetailRouteHistorySupplements => 'مکمل‌های مصرفی';

  @override
  String get athleteDetailRouteHistoryCoachAnalisys => 'تحلیل مربی';

  @override
  String get athleteDetailRouteHistoryCoachFoodInstructions => 'راهنمای تغذیه';

  @override
  String get athleteDetailRouteHistoryCoachSupplementsInstructions =>
      'راهنمای مکمل ورزشی';

  @override
  String get athleteDetailRouteHistoryUpsertButtonWorkoutProgram =>
      'مشاهده/ویرایش تمرین‌های ورزشکار';

  @override
  String get athleteDetailRouteHistoryEditAnalysisTitle => 'نظر مربی';

  @override
  String get athleteDetailRouteHistoryEditAnalysisLabel =>
      'نظر مربی درباره تاریخچه ورزشی';

  @override
  String get athleteDetailRouteHistoryEditAnalysisHint =>
      'نظر مربی مانند نقاط قوت و ضعف و برنامه ماکروسیکل';

  @override
  String get athleteDetailRouteHistoryEditFoodInstructionTitle => 'نظر مربی';

  @override
  String get athleteDetailRouteHistoryEditFoodInstructionLabel =>
      'برنامه تغذیه';

  @override
  String get athleteDetailRouteHistoryEditFoodInstructionHint =>
      'مانند رژیم در روزهای هفته یا برنامه غذایی هنگام باشگاه یا نکات تکمیلی تغذیه ورزشی';

  @override
  String get athleteDetailRouteHistoryEditSupplementsInstructionTitle =>
      'نظر مربی';

  @override
  String get athleteDetailRouteHistoryEditSupplementsInstructionLabel =>
      'راهنمای مکمل ورزشی';

  @override
  String get athleteDetailRouteHistoryEditSupplementsInstructionHint =>
      'راهنمای مصرف مکمل های مجاز wada یا آژانس ضددوپینک جهانی برای ورزشکار';

  @override
  String get save => 'ذخیره';

  @override
  String get send => 'ارسال';

  @override
  String get workoutProgramRouteHeader => 'انتخاب بین هفته ها';

  @override
  String workoutProgramRouteWeekTileLabel(int index) {
    return '$index هفته';
  }

  @override
  String get athleteDaysListListTileTitleNoPlan =>
      'برنامه‌ای برای این روز تعریف نشده';

  @override
  String athleteDaysListListTileTitleWithPlan(String isRest) {
    String _temp0 = intl.Intl.selectLogic(isRest, {
      'true': 'روز استراحت',
      'false': 'روز تمرین',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get enrollmentsListEmptyTitle => 'هنوز برنامه ای ثبت نام نکردید';

  @override
  String get selectAthelteDayRouteTitle => 'انتخاب روز در هفته';

  @override
  String get selectAthelteDayRouteSubTitle => '7 روز هفته';

  @override
  String get selectAthelteDayRouteEmptyDay => 'روز بدون برنامه';

  @override
  String get selectAthelteDayRouteIsRestDay => 'روز استراحت';

  @override
  String get selectAthelteDayRouteIsExerciseDay => 'روز تمرین';

  @override
  String get createDayActivitiesRouteTitle => 'انتخاب بین تمرین و استراحت';

  @override
  String get createDayActivitiesRouteUpsertRestDialogTitle =>
      'اضافه کردن استراحت';

  @override
  String get createDayActivitiesRouteUpsertRestDialogLabel =>
      'مدت استراحت (ثانیه)';

  @override
  String createDayActivitiesRouteListTileSubtitleLabelIsRest(int duration) {
    return 'مدت استراحت $duration ثانیه';
  }

  @override
  String get createDayActivitiesRouteSubtitle =>
      'بین تمرین‌ها و استراحت بین تمرین‌ها انتخاب کنید';

  @override
  String createDayActivitiesRouteDeleteDialogTitle(String isRest) {
    String _temp0 = intl.Intl.selectLogic(isRest, {
      'true': 'حذف ',
      'false': 'حذف تمرین',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get createDayActivitiesRouteDeleteDialogSubtile =>
      'آیا مطمئن به حذف این ردیف هستید؟';

  @override
  String get selectAthelteDayRouteDeleteDialogTitle => 'حذف روز';

  @override
  String get selectAthelteDayRouteDeleteDialogSubtile =>
      'آیا مطمئن به حذف این روز هستید؟';

  @override
  String athleteDetailRouteHistoryExerciseGoalValue(String goal) {
    String _temp0 = intl.Intl.selectLogic(goal, {
      'loseWeight': 'کاهش وزن',
      'power': 'سرعت و توان',
      'strength': 'قدرت',
      'endurance': 'استقامت',
      'hypertrophy': 'هایپرتروفی یا افزایش ماهیچه',
      'prepareASportingEvent': 'آمادگی برای مسابقه',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String athleteDetailRouteHistoryExerciseEquipmentValue(String equipment) {
    String _temp0 = intl.Intl.selectLogic(equipment, {
      'bodyWeight': 'وزن بدن',
      'weightMachine': 'دستگاه بدنسازی',
      'cableMachine': 'دستگاه سیمکش',
      'barbell': 'هالتر',
      'dumbbell': 'دمبل',
      'band': 'کش تمرینی',
      'kettlebell': 'کتل‌بل',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get selectExerciseAppbarTitle => 'انتخاب تمرین';

  @override
  String get activitySettingDialogTitle => 'انتخاب مدت و شدت تمرین';

  @override
  String get activitySettingDialogAddSetLabel => 'اضافه کردن ست';

  @override
  String setPrescriptionRowSetLabel(int setNumber) {
    return 'ست $setNumber';
  }

  @override
  String get setPrescriptionRowRemoveSet => 'حذف ست';

  @override
  String get setPrescriptionRowRestLabel => 'استراحت بعد از ست (ثانیه)';

  @override
  String get setPrescriptionRepsLabel => 'تکرار در ست';

  @override
  String get setPrescriptionDrationLabel => 'مدت ست (ثانیه)';

  @override
  String get setPrescriptionPercentOneRepeatitionMaximumLabel =>
      'درصد یک تکرار بیشینه (% 1RM)';

  @override
  String get exerciseDefenitionListTilePreparationSteps => 'قدم‌های آماده‌سازی';

  @override
  String get exerciseDefenitionListTileExecutionSteps => 'قدم‌های اجرا';

  @override
  String get exerciseDefenitionListTileKeyTips => 'نکات کلیدی';

  @override
  String get exerciseDefenitionListTileFocusAreas => 'ناحیه‌های اثرگذاری';

  @override
  String get exerciseDefenitionListTileEquipment => 'ابزار مورد نیاز';

  @override
  String get exerciseDefenitionListTileWatchVideo => 'دیدن ویدئو انجام حرکت';

  @override
  String get reorderExercisesDialogTitle => 'ترتیب حرکات';

  @override
  String get reorderExercisesDialogSubTitle => 'اولویت تمرین‌ها را مشخص نمایید';

  @override
  String get carouselSliderBuilderEmptyState => 'شاگرد تصویری اضافه نکرده است';

  @override
  String get setPtescribedDialogTitle => 'تعداد تمرین و زمان استراحت';

  @override
  String get workoutsListFABTitle => 'شروع ورزش';

  @override
  String get workoutsListRouteTitle => 'حرکات این جلسه';

  @override
  String get athleteDaysListRouteTitle => 'روزهای برنامه ورزشی';

  @override
  String setPtescribedDialogRepsOnlyLabel(int reps) {
    return '$reps تکرار';
  }

  @override
  String setPtescribedDialogPercent1rmAndRepsLabel(int reps, double rm) {
    final intl.NumberFormat rmNumberFormat = intl.NumberFormat.percentPattern(
      localeName,
    );
    final String rmString = rmNumberFormat.format(rm);

    return '$reps تکرار با شدت $rmString یک تکرار بیشینه RM% ';
  }

  @override
  String setPtescribedDialogTimeBasedLabel(int sec) {
    return '$sec ثانیه';
  }

  @override
  String setPtescribedDialogRestAfterExerciseLabel(int sec) {
    return '$sec ثانیه استراحت';
  }

  @override
  String restScreenAddRestElevatedButtonLabel(int sec) {
    return 'ثانیه $sec +';
  }

  @override
  String get enrollmentsListEnrollmentCardTitle => 'تاریخ ثبت‌نام در برنامه';

  @override
  String get enrollmentsListEnrollmentCardCoachAnalysis => 'تحلیل مربی از شما';

  @override
  String get enrollmentsListEnrollmentCardCoachFoodInstruction =>
      'راهنمای تغذیه';

  @override
  String get enrollmentsListEnrollmentCardCoachSupplementsInstruction =>
      'راهنمای مکمل‌های ورزشی';

  @override
  String get enrollmentsListEnrollmentCardCoachProfileName => 'نام مربی';

  @override
  String get enrollmentsListEnrollmentCardCoachProfilePhoneNumber =>
      'شماره تماس';

  @override
  String get enrollmentsListEnrollmentCardCoachProfileEmail => 'ایمیل';

  @override
  String get enrollmentsListEnrollmentCardElevatedButtonTitle =>
      'مشاهده روزهای برنامه';

  @override
  String get workoutScreenCotrollerRestTitle => 'استراحت';

  @override
  String get workoutScreenDoneElevatedButtonExerciseTitle => 'انجام دادم';

  @override
  String get introductionRouteLearnDialogTitle => 'آموزش پلتفرم تندرست';

  @override
  String get introductionRouteLearnDialogSubTitle =>
      'جهت یادگیری نرم‌افزار پلتفرم لاغری تندرست ویدئوهای زیر را ببینید';

  @override
  String get introductionRouteLearnDialogLinkALabel =>
      'آموزش پلتفرم بدنسازی تندرست - قسمت یک';

  @override
  String get introductionRouteLearnDialogLinkBLabel =>
      'آموزش پلتفرم بدنسازی تندرست - قسمت دو';

  @override
  String get introductionRouteLearnDialogSubmitLabel => 'ورود / ثبت‌نام';

  @override
  String get googleSignInButtonText => 'ادامه با گوگل';

  @override
  String get congratulationScreenAppBarTitle => 'انجام دادید :)';

  @override
  String get congratulationScreenTitle => 'انجام شد!';

  @override
  String get congratulationScreenSubtitle => 'تمرین را انجام دادید، عالی بود!';

  @override
  String get congratulationScreenFinishButtonLabel => 'پایان جلسه 👏';

  @override
  String get congratulationScreenFinishResetButtonLabel => 'انجام دوباره جلسه';

  @override
  String get verificationCodeDialogTitle => 'تایید کد احراز اصالت درخواست';

  @override
  String get verificationCodeDialogVerificationCodeTextFieldLabel => 'کد تایید';

  @override
  String get verificationCodeDialogVerificationCodeTextFieldHint =>
      'کد ارسال شده را وارد  نمایید';

  @override
  String get fitnessInfoTitleAthlete => 'اطلاعات فیزیکی شاگرد';

  @override
  String get fitnessInfoAthletePhysicaDataChart => 'نمودار پیشرفت شاگرد';

  @override
  String get fitnessInfoAthleteHistoryTitle => 'برنامه شاگرد';

  @override
  String get restScreenWorkoutTitle => 'حرکت بعدی';

  @override
  String get restScreenWorkoutRestTimeTitle => 'مدت باقی‌مانده استراحت';

  @override
  String get workoutScreenWorkoutTitle => 'حرکت حالا';

  @override
  String get videoPlayerWidgetHasErrorStatusLabel => 'نمایش ویدئو خطا دارد.';

  @override
  String get videoPlayerWidgetLodingStatusLabel =>
      'در حال بارگذاری.صبر کنید...';

  @override
  String get videoPlayerWidgetViewOnline => 'نمایش ویدئو در وب';

  @override
  String get athletesDirectoryBuilderCoachTraineeTitle => 'شاگردان شما';

  @override
  String get inviteTraineeSuccessMessage =>
      'با موفقیت به پلتفرم تندرست دعوت شد.';

  @override
  String get profileRouteReferralsElevatedButtonTitle => 'وضعیت ارسال‌ها';

  @override
  String get profileRouteReferralsDialogTitle => 'دعوتنامه‌ها';

  @override
  String get noReferralsFound => 'هنوز کسی را دعوت نکرده‌اید';

  @override
  String get referralTileInvitedContact => 'دعوتنامه برای';

  @override
  String get referralTileStatus => 'وضعیت دعوتنامه';

  @override
  String get referralTileUpdatedDate => 'آخرین بروزرسانی';

  @override
  String get coachFinanceId => 'شماره کارت یا شبا';

  @override
  String referralStatus(String status) {
    String _temp0 = intl.Intl.selectLogic(status, {
      'pending': 'هنوز ثبت‌نام نکرده',
      'claimed': 'ثبت‌نام کرده',
      'expired': 'منقضی‌شده',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }

  @override
  String get choose => 'انتخاب';

  @override
  String get vo2maxLabel => 'هوازی و چربی سوزی';

  @override
  String get vo2maxCalculatorLabel => 'محسابه مسافت بهینه هوازی';

  @override
  String get lanchUriFailedSnackBarMessage =>
      'خطا در بازکردن آدرس، بعدا تلاش کنید';

  @override
  String contactCoachEmailSubject(String username) {
    return '$username پشتیبانی پلتفرم لاغری تندرست';
  }

  @override
  String coachesListShowingStatus(String status) {
    String _temp0 = intl.Intl.selectLogic(status, {
      'pendingVerification': 'در انتظار احراز هویت',
      'isNotAcceptingNewTrainer': 'عدم نمایش شاگرد جدید',
      'regullar': 'در حال نمایش',
      'unknown': 'نامشخص',
      'other': 'ترجمه تعریف نشده',
    });
    return '$_temp0';
  }
}
