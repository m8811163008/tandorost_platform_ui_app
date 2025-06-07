// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'component_library_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class ComponentLibraryLocalizationsFa extends ComponentLibraryLocalizations {
  ComponentLibraryLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get drawerSupportText1 => 'شماره پشتیبانی 09212805230';

  @override
  String get drawerSupportText2 => 'محتویات برنامه متعلق به تیم توسعه دهنده تندرست می‌باشد.';

  @override
  String get foodName => 'نام غذا';

  @override
  String get fat => 'چربی';

  @override
  String get carbohydrate => 'کربوهیدرات';

  @override
  String get carbohydrateFruitsOrNonStarchyVegetables => 'کربوهیدرات میوه و سبزی';

  @override
  String get carbohydrateOthers => 'کربوهیدرات غنی';

  @override
  String get protein => 'پروتئین';

  @override
  String get id => 'شناسه';

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
  String carbohydrateSourceValue(String source) {
    String _temp0 = intl.Intl.selectLogic(
      source,
      {
        'fruitsOrNonStarchyVegetables': 'میوه و سبزی',
        'others': 'کربوهیدرات غنی',
        'other': 'ترجمه تعریف نشده',
      },
    );
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
  String get searchFoodBottomSheetTextFieldHintExample1 => 'برای مثال یک عدد سینه مرغ سرخ شده و دو عدد سیب زمینی پخته متوسط';

  @override
  String get searchFoodBottomSheetTextFieldHintExample2 => 'یک بشقاب قرمه سبزی و یک کاسه سالاد شیرازی و دو لیوان دوغ';

  @override
  String get searchFoodBottomSheetTextFieldHintExample3 => 'یه کاسه ماست یونانی و یک مشت جو دوسر';

  @override
  String get searchFoodBottomSheetTextFieldHintExample4 => 'نصف بشقاب باقلی قاتق و یک لیوان آب جو بدون الکل';

  @override
  String get searchFoodBottomSheetTextFieldHintExample5 => 'اشکنه شنبلیله و نعناع یک کاسه بزرگ';

  @override
  String get searchFoodBottomSheetButtonLabel => 'جستجو';

  @override
  String get networkError => 'خطای ارتباط. دوباره امتحان کنید';

  @override
  String get internetConnectionError => 'خطای اینترنت. اینترنت خود را روشن نمایید';

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
  String get verifyNumberTextFieldLabel => 'تایید شماره همراه';

  @override
  String get verifyFormOutlineLabel => 'ارسال';

  @override
  String get forgotPasswordLabel => 'فراموشی رمز عبور';

  @override
  String get phoneNumberTextFieldLabel => 'شماره تلفن همراه';

  @override
  String get passwordTextFieldLabel => 'رمز عبور';

  @override
  String get verificationCodeTextFieldLabel => 'کد پیامک شده';

  @override
  String get dialogTitleChangeApplicationLanguage => 'تغییر زبان نرم افزار';

  @override
  String get dialogTitleChangeName => 'تغییرنام';

  @override
  String get changeNameTextFieldLabel => 'نام';

  @override
  String get personalInfoNameLabel => 'نام';

  @override
  String get personalInfoPhoneLabel => 'شماره تلفن';

  @override
  String get updateButton => 'بروزرسانی';

  @override
  String get personalInfoSettingLabel => 'مشخصات فردی';

  @override
  String get settingLabel => 'تنظیمات';

  @override
  String get changeWeightSpeedLabel => 'سرعت کاهش وزن';

  @override
  String get changeWeightSpeedInfoConstantSpeed => 'در حالت تثبیت وزن از انرژی مورد نیاز کم نمیشود';

  @override
  String get changeWeightSpeedInfoSlowAndEasySpeed => 'در حالت آهسته و آسان در روز استراحت 10 درصد از انرژی مورد نیاز کم میشود و در روز تمرین 0 درصد از انرژی مورد نیاز کم میشود';

  @override
  String get changeWeightSpeedInfoMediumSpeed => 'در حالت طبیعی در روز استراحت 10 درصد از انرژی مورد نیاز کم میشود و در روز تمرین  5 درصد از انرژی مورد نیاز کم میشود';

  @override
  String get changeWeightSpeedInfoFastSpeed => 'در حالت سریع در روز استراحت 15 درصد از انرژی مورد نیاز کم میشود و در روز تمرین  5 درصد از انرژی مورد نیاز کم میشود';

  @override
  String get changeWeightSpeedInfoFastAndHardSpeed => 'در حالت سریع و سخت در روز استراحت 15 درصد از انرژی مورد نیاز کم میشود و در روز تمرین  15 درصد از انرژی مورد نیاز کم میشود';

  @override
  String get changeWeightSpeedInfoFastAndHardSpeedCaution => 'دقت کنید حالت سریع و سخت برای بعضی روزهای تمرین مناسب نیست چون باعث میشه انرژی کمی برای تمرین فراهم باشد.';

  @override
  String profileChangeWeightSpeedButtonLabel(String changeWeightSpeed) {
    String _temp0 = intl.Intl.selectLogic(
      changeWeightSpeed,
      {
        'constant': 'تثبیت وزن',
        'slowAndEasy': 'آهسته و آسان',
        'medium': 'طبیعی',
        'fast': 'سریع',
        'fastAndHard': 'سریع و سخت',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String get timeRestrictedEatingLabel => 'رژیم با زمان محدود(فستینگ)';

  @override
  String get languageSettingLabel => 'زبان نرم افزار';

  @override
  String languageTranslation(String language_name) {
    String _temp0 = intl.Intl.selectLogic(
      language_name,
      {
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
      },
    );
    return '$_temp0';
  }

  @override
  String profileChartTypeLabel(String chartType) {
    String _temp0 = intl.Intl.selectLogic(
      chartType,
      {
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
      },
    );
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
  String get photoEditorCloseEditorWarningMessage => 'آیا مطمئن هستید که می‌خواهید ویرایشگر تصویر را ببندید؟ تغییرات شما ذخیره نخواهد شد.';

  @override
  String get photoEditorCloseEditorWarningConfirmBtn => 'تأیید';

  @override
  String get photoEditorCloseEditorWarningCancelBtn => 'لغو';

  @override
  String get photoEditorImportStateHistoryMsg => 'ویرایشگر در حال راه‌اندازی است';

  @override
  String get photoEditorDoneLoadingMsg => 'تغییرات در حال اعمال هستند';

  @override
  String physicalDataGender(String gender) {
    String _temp0 = intl.Intl.selectLogic(
      gender,
      {
        'male': 'مرد',
        'female': 'زن',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String physicalActivityLevel(String activityLevel) {
    String _temp0 = intl.Intl.selectLogic(
      activityLevel,
      {
        'sedentary': 'غیرفعال و زیاد میشینم',
        'fairyActive': 'تقریبا فعال، هر هفته یکی دوبار ورزش میکنم و پیاده روی میکنم',
        'moderatelyActive': 'فعال، هر هفته دو سه روز ورزش میکنم',
        'active': 'خیلی فعال، هر هفته بیش از 3 بار با شدت بالا ورزش میکنم',
        'veryActive': 'روزی دوبار ورزش میکنم',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String get fitnessProfileImageGallaryTitle => 'تصاویر پیشرفت شما';

  @override
  String get fitnessProfileAddImageButton => 'افزودن تصویر جدید';

  @override
  String get fitnessProfilePhysicalDataLabel => 'اطلاعات فیزیکی شما';

  @override
  String get fitnessProfileRestingMetabolicRate => 'نرخ سوخت ساز در حالت استراحت';

  @override
  String get fitnessProfileTotalDailyEnergyExpenditure => 'کل انرژی مصرفی روزانه';

  @override
  String get fitnessProfileBodyMassIndex => 'شاخص توده بدنی';

  @override
  String get fitnessProfileBodyMassIndexPrime => 'BMI Prime';

  @override
  String get fitnessProfileBodyMassIndexLevelLabel => 'سطح شاخص توده بدنی';

  @override
  String get fitnessProfileWaistCircumferenceToHeightRatio => 'نسبت دور کمر به قد';

  @override
  String get fitnessProfileIsWaistCircumferenceToHeightRatioSafe => 'آیا نسبت دور کمر به قد ایمن است؟';

  @override
  String get fitnessProfileIsWaistCircumferenceSafeRange => 'آیا دور کمر در محدوده ایمن است؟';

  @override
  String get fitnessProfileYes => 'بله';

  @override
  String get fitnessProfileNo => 'خیر';

  @override
  String get fitnessProfileNA => 'در دسترس نیست';

  @override
  String fitnessProfileBmiDescription(double bmiValue, String bmiDescriptive) {
    final intl.NumberFormat bmiValueNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 1
    );
    final String bmiValueString = bmiValueNumberFormat.format(bmiValue);

    return 'شاخص توده بدنی شما $bmiValueString و در وضعیت $bmiDescriptive هستید.';
  }

  @override
  String get fitnessProfileWaistCircumferencePhysicalDataHintLabel => 'دور کمر و دیابت';

  @override
  String get fitnessProfileWaistCircumferenceToHeightRatioDescription => 'شاخص دور کمر به قد از شاخص توده بدنی برای ارزیابی خطرات مرتبط با سلامت دقیق‌تر است ، این نسبت هرچه به صفر نزدیک تر باشد وضعیت خطرات مرتبط با سلامتی برای شما کمتر میشود.';

  @override
  String fitnessProfileWaistCircumferenceToHeightRatioAvailableDescription(double ratio) {
    final intl.NumberFormat ratioNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 1
    );
    final String ratioString = ratioNumberFormat.format(ratio);

    return 'شاخص دور کمر به قد برای شما $ratioString است';
  }

  @override
  String get fitnessProfileWaistCircumferenceToHeightRatioNotAvailableDescription => 'شاخص دور کمر به قد برای شما در دسترس نیست، لطفا دور کمر خود را در قسمت اندازه گیری جدید در صفحه قبل، اندازه و اضافه کنید';

  @override
  String get fitnessProfileBmiWaistCircumferenceHealthDescription => 'خطرات مرتبط با سلامتی شامل بیماری های قلبی عروقی، بیماری کیسه صفرا، فشار خون بالا و دیابت نوع 2 میباشد.';

  @override
  String fitnessProfileBmiStatus(String bmiStatus) {
    String _temp0 = intl.Intl.selectLogic(
      bmiStatus,
      {
        'underweight': 'کمبود وزن',
        'healthyWeight': 'عادی',
        'overweight': 'اضافه وزن',
        'obeseClassOne': 'چاقی کلاس 1',
        'obeseClassTwo': 'چاقی کلاس 2',
        'obeseClassThree': 'چاقی کلاس 3',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String get fitnessProfileWaistCircumferenceSafeRangeDescription => 'محدوده سالم اندازه دور کمر بهتر است کمتر از 94 سانتی متر در آقایان و 80 سانتی متر در خانم‌ها باشد.این شاخص با احتمال ابتلا به دیابت نوع 2 در ارتباط است';

  @override
  String get fitnessProfileWaistCircumferenceSafeRangeNotAvailableDescription => 'شاخص محدوده مجاز دور کمر برای شما در دسترس نیست، لطفا دور کمر خود را در قسمت اندازه گیری جدید در صفحه قبل، اندازه و اضافه کنید';

  @override
  String fitnessProfileIsWaistCircumferenceSafeRangeDescription(String isWaistCircumferenceSafeRange) {
    String _temp0 = intl.Intl.selectLogic(
      isWaistCircumferenceSafeRange,
      {
        'true': 'دور کمر شما در محدوده مجاز می‌باشد',
        'false': 'دور کمر شما از محدوده مجاز بیشتر است و احتمال ابتلا به دیابت نوع 2 در شما بیشتر است. لطفا چربی خود را سریع کاهش دهید',
        'other': 'ترجمه تعریف نشده',
      },
    );
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
  String get fitnessProfileNewMeasurementDialogCalfMuscleCircumference => 'دور ماهیچه ساق پا';

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
  String get fitnessProfileDeleteDataPointDialogDescription => 'آیا از حذف این اندازه مطمئن هستید؟';

  @override
  String get foodReportUserFoodRequirementFrom => 'از';

  @override
  String get foodReportTabLabelRestDay => 'روز استراحت';

  @override
  String get foodReportTabLabelTrainingDay => 'روز تمرین';

  @override
  String get foodReportBannerContent => 'مشخصات تغذیه شما دردسترس نیست. لطفا مشخصات خود را در صفحه تناسب اندام کامل کنید';

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
    String _temp0 = intl.Intl.selectLogic(
      routesNames,
      {
        'loginRoute': 'ورود',
        'registerRoute': 'ثبت نام',
        'searchRoute': 'جستجو',
        'resultRoute': 'نتیجه',
        'forgotPassRoute': 'فراموشی رمز عبور',
        'verificationRoute': 'تایید شماره',
        'profileRoute': 'پروفایل',
        'fitnessProfileRoute': 'تناسب اندام',
        'foodReportRoute': 'گزارش تغذیه',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String get wellcomeMessage => 'سلام';

  @override
  String appAsyncCardStatusText(String asyncStatus) {
    String _temp0 = intl.Intl.selectLogic(
      asyncStatus,
      {
        'inital': 'بدون داده',
        'loading': 'درحال بارگیری',
        'serverConnectionError': 'خطای سرور ، دوباره تلاش کنید',
        'internetConnectionError': 'خطای اینترنت. اینترنت خود را وصل کنید',
        'success': 'داده ای برای نمایش دادن نیست',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String get bazzarNotFound => 'کافه بازار نصب نشده است. کافه بازار را نصب کنید';

  @override
  String get bazzarSuccessfulPayment => 'اشتراک با موفقیت اضافه شد';

  @override
  String get addMeasurementDialogHintTitle => 'شکل بدن';

  @override
  String get addMeasurementDialogHintText1 => 'بخاطر پیشگیری از وسواس فکری بیش از هفته‌ای یکبار خود را وزن نکنید.';

  @override
  String get addMeasurementDialogHintText2 => 'اندازه گیری شکل بدن نسبت به اندازه گیری وزن بیشتر باعث انگیزه تناسب اندام میشود.';

  @override
  String get addMeasurementDialogHintText3 => 'با اندازه گیری شکل بدن متوجه میشوید توزیع کاهش چربی در بدن چه شکلی داشته';

  @override
  String get addMeasurementDialogHintText4 => 'زمان اندازه گیری ماهیچه سرد باشد.';

  @override
  String get addMeasurementDialogHintText5 => 'حداکثر انقباض یا قطر ماهیچه را اندازه بگیرید.';

  @override
  String get addMeasurementDialogHintText6 => 'روش اندازه گیری دور کمر به توصیه سازمان بهداشت جهانی و فدراسیون بین المللی دیابت ';

  @override
  String get addMeasurementDialogHintText6Bold => 'بین پایین ترین دنده ها و ستیغ تهیگاهی ';

  @override
  String get addMeasurementDialogHintText7 => 'است.';

  @override
  String get addMeasurementDialogHintText8 => 'بالاتر از ناف باشد و پوست زیر متر جمع نشود';

  @override
  String get foodRequerementDialogGeneralRecommendationTitle => 'کلی';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminTitle => 'ویتامین و مواد معدنی';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminText2 => 'با مصرف میوه و سبزی با رنگ هاب مختلف در روز استراحت معمولا نیاز به ویتامین و مواد معدنی تامین میشود و برای تشخصی کمبود ویتامین و مواد معدنی به پزشک مراجعه کنید.';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminText3 => 'در صبح میزان هرمون هپسیدین در کمترین مقدار هست و آهن بهتر هست در صبح خورده بشه مثل املت اسفناج یا جگر که جذب را حداکثر میکند.';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminText4 => 'مصرف آهن برای انتقال اکسیژن در خون و مایچه مهم هست (هموگلوبین و میوگلوبین) . بعد از تمرین بخاطر اثر التهاب ، سطح هرمون تنظیم آهن یعنی هپسیدین به مدت 3 تا 6 ساعت بعد تمرین زیاد میشه و جذب آهن کاهش پیدا میکند و آهن در این مدت کمتر از صبح جذب میشود.';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminText5 => 'غذاهای غنی از آهن عبارتند از گوشت و کله پاچه، ساردین، ماهی تن، غلات سبوس دار، زرده تخم مرغ، لوبیا، عدس، سبزیجات برگ سبز، زردآلو خشک، آجیل و دانه ها. ';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminText6 => 'جذب آهن با مصرف ویتامین سی مانند پرتقال افزایش پیدا میکنه';

  @override
  String get foodRequerementDialogGeneralRecommendationVitaminText7 => 'آهن و زینک و کلسیم دارای سیستم جذب و انتقال یکسان هستند پس مصرف زیاد آهن باعث کاهش جذب زینک و کلسیم میشه پس اگر صبح مواد غذایی شامل آهن میخورید سعی کنید مواد غذایی شامل کلسیم مثل شیر یا مواد غذایی شامل زینک مثل گوشت قرمز یا غلات کامل را با آن نخورید.';

  @override
  String get foodRequerementDialogGeneralRecommendationProperSleepTitle => 'خواب';

  @override
  String get foodRequerementDialogGeneralRecommendationProperSleepText1 => 'خواب کم و شب بیداری باعث افزایش کورتیزل و پرخوری میشود. در نتیجه خوردن قند و چربی زیادتر از نیاز روزانه تان، به شکل چربی و وزن اضافه در بدن جمع میشود .';

  @override
  String get foodRequerementDialogGeneralRecommendationProperSleepText2 => 'اگر میخواهید صبح زودتر بیدار شوید، شب 7 تا 8 ساعت زودتر بخواب بروید';

  @override
  String get foodRequerementDialogGeneralRecommendationStressTitle => 'استرس';

  @override
  String get foodRequerementDialogGeneralRecommendationStressText1 => 'استرس روزمره و کاری باعث افزایش هورمون کورتیزل و اضطراب میشود و پاسخ طبیعی و ساده معمولا خوردن قند و چربی و نمک زیاد برای افزایش هورمون دوپامین جهت خنثی کردن اضطراب و استرس است. ';

  @override
  String get foodRequerementDialogGeneralRecommendationStressText2 => 'در حالت استرس ،میتوانید نفس عمیق بکشید و آب بخورید و ریشه مسئله را پیدا و حل کنید.';

  @override
  String get foodRequerementDialogHydrationTitle => 'آب';

  @override
  String get foodRequerementDialogHydrationRestDayText1 => 'نوشیدن ۵۰۰ میلی‌لیتر آب نیم ساعت قبل از هر وعده غذایی همراه با رژیم کم‌کالری می‌تواند به کاهش وزن بیشتر در افراد میانسال و مسن دارای اضافه وزن یا چاقی کمک کند. این کار ساده و بی‌خطر است، اما برای افراد با نارسایی قلبی یا مشکلات شدید کلیوی توصیه نمی‌شود.';

  @override
  String get foodRequerementDialogHydrationRestDayText2 => 'نوشیدن آب همراه غذا، به ویژه غذاهای جامد مانند برنج و نان، می‌تواند به فرآیند هضم کمک کند؛ زیرا آب به نرم شدن غذا و عملکرد بهتر آنزیم‌های گوارشی یاری می‌رساند.';

  @override
  String get foodRequerementDialogHydrationRestDayText3 => 'معده یک عضو ماهیچه‌ای با قابلیت انقباض و انبساط است و نوشیدن آب همراه با غذا یا سایر مواد غذایی باعث بزرگ شدن دائمی آن نمی‌شود؛ معده پس از تخلیه، به اندازه طبیعی خود بازمی‌گردد';

  @override
  String get foodRequerementDialogHydrationRestDayText4 => 'معده یک عضو ماهیچه‌ای با قابلیت انقباض و انبساط است و نوشیدن آب همراه با غذا یا سایر مواد غذایی باعث بزرگ شدن دائمی آن نمی‌شود؛ معده پس از تخلیه، به اندازه طبیعی خود بازمی‌گردد';

  @override
  String foodRequerementDialogHydrationRestDayText5(double waterVolume) {
    final intl.NumberFormat waterVolumeNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 1
    );
    final String waterVolumeString = waterVolumeNumberFormat.format(waterVolume);

    return 'اگر در منطقه معتدل آب و هوایی زندگی میکنید خوردن حداقل $waterVolumeString لیتر آب برای شما نیاز است مهم نیست آب از دمنوش و چای و قهوه یا آب میوه یا نوشیدنی انرژی باشد. هرچه محیط گرم تر باشد آب بیشتری نیاز دارید و برعکس.';
  }

  @override
  String get foodRequerementDialogHydrationTrainingDayText1 => 'کم‌آبی بدن باعث استرس قلبی‌عروقی می‌شود و دمای مرکزی بدن را افزایش می‌دهد.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText2 => 'پس از تمرین، آب را در چند نوبت و همراه با کمی نمک یا طعم‌دهنده بنوشید تا حجم خون به‌یکباره افزایش نیابد و بدن دچار کم‌آبی نشود؛ مصرف آب خالی می‌تواند احساس تشنگی را کاهش دهد و باعث ادرار بیشتر شود، در نتیجه ممکن است پیش از رفع کامل تشنگی نوشیدن آب را متوقف کنید.';

  @override
  String foodRequerementDialogHydrationTrainingDayText3(int fiveTimeWeight, int tenTimeWeight) {
    return 'با توجه به وزن شما، نوشیدن $fiveTimeWeight تا $tenTimeWeight میلی‌لیتر آب ۲ تا ۴ ساعت قبل از تمرین توصیه می‌شود. اگر ادرار نکردید یا رنگ ادرار تیره بود، باید آب بیشتری بنوشید.';
  }

  @override
  String get foodRequerementDialogHydrationTrainingDayText4 => 'پس از ورزش، توصیه می‌شود ۱.۲۵ تا ۱.۵ برابر حجم مایعی که در طول تمرین از دست داده‌اید مصرف کنید.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText5 => 'در فعالیت‌های سبک یا متوسط زیر ۴۵ دقیقه، آب کافی است. در تمرینات شدیدتر و طولانی‌تر (بیش از ۶۰ تا ۹۰ دقیقه)، نوشیدنی ورزشی با ۴۰ تا ۸۰ گرم کربوهیدرات در هر لیتر توصیه می‌شود. برای تمرینات ۱ تا ۲.۵ ساعت، مصرف ۳۰ تا ۶۰ گرم کربوهیدرات در ساعت و برای تمرینات شدیدتر بیش از ۲.۵ ساعت، تا ۹۰ گرم کربوهیدرات در ساعت (ترکیبی) پیشنهاد می‌شود.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText6 => 'سدیم در نوشیدنی ورزشی باعث افزایش میل به نوشیدن، حفظ آب بدن و خوش‌طعم‌تر شدن نوشیدنی می‌شود. کربوهیدرات به جذب بهتر آب و تأمین انرژی کمک می‌کند. نوشیدنی‌های انرژی‌زا حاوی کافئین می‌توانند عملکرد هوازی و بی‌هوازی را بهبود دهند.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText7 => 'نوشیدنی‌های ورزشی، نوشابه‌های گازدار و آبمیوه‌ها می‌توانند به دلیل اسیدیته بالا باعث فرسایش مینای دندان شوند؛ این اثر در حین ورزش به دلیل کاهش بزاق تشدید می‌شود.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText8 => 'برای محافظت از دندان‌ها: از بطری با نی یا نازل استفاده کنید، آب را به طور متناوب بنوشید و از نوشیدن مداوم یا چرخاندن نوشیدنی در دهان خودداری کنید.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText9 => 'برای بررسی وضعیت آب بدن خود، به رنگ ادرار در ابتدای صبح توجه کنید. ادرار رقیق و کم‌رنگ نشان‌دهنده آب رسانی مناسب است، در حالی که رنگ تیره و حجم کم می‌تواند به معنای کم‌آبی بدن باشد که نیازمند نوشیدن آب بیشتر، به خصوص قبل از تمرین، است.';

  @override
  String get foodRequerementDialogHydrationTrainingDayText10 => 'کم ابی یا هایپوهیدراشن به روزهای قبل و تمرین های قبلی بستگی داره و کم آبی امروز روی تمرین فردا تاثیر میگذارد.';

  @override
  String get foodRequerementDialogCarbohydrateRestDayText1 => 'قند و شکر که اغلب از نیشکر یا چغندر قند فرآوری می‌شوند، نوعی کربوهیدرات هستند. مصرف نوشیدنی‌های حاوی قند افزوده می‌تواند به پوسیدگی دندان منجر شود. این نوع قندها معمولاً در غذاهای فرآوری شده‌ای مانند شکلات، بیسکویت (که اغلب چربی بالایی دارند) یا چیپس (که نمک زیادی دارند) یافت می‌شوند. این دسته از غذاهای فرآوری شده انرژی زیادی دارند اما از نظر مواد مغذی و فیبر فقیر هستند و حجم کمی نسبت به انرژی خود دارند که می‌تواند منجر به احساس گرسنگی زودهنگام شود و دریافت انرژی بیش از نیاز بدن شما بگردد.';

  @override
  String foodRequerementDialogCarbohydrateRestDayText2(int fivePercentCalorie, int sugarCubeCount) {
    return 'توصیه می‌شود حداکثر 5 درصد از انرژی روزانه شما، معادل حدود $fivePercentCalorie کیلوکالری، از قندهای افزوده تأمین شود. این مقدار شکر برای شما تقریباً معادل $sugarCubeCount حبه قند است که شامل قند موجود در غذاهای فرآوری‌شده، شربت‌ها، آبمیوه‌ها و عسل می‌شود و قندهای طبیعی موجود در شیر، سبزیجات و میوه‌ها را در بر نمی‌گیرد.';
  }

  @override
  String get foodRequerementDialogCarbohydrateRestDayText3 => 'کربوهیدرات اصلی موجود در میوه‌ها، فروکتوز است. مصرف زیاد فروکتوز در افراد کم‌تحرک می‌تواند باعث افزایش تری‌گلیسیرید و چربی خون شود. با این حال، اگر فعالیت بدنی منظمی دارید، تأثیر آن بر چربی خون معمولاً ناچیز است.';

  @override
  String get foodRequerementDialogCarbohydrateRestDayText4 => 'حتی در صورت کم‌تحرکی، توصیه می‌شود روزانه حداقل 2 تا 3 واحد میوه مصرف کنید؛ زیرا میوه‌ها منبع عالی آب برای هیدراسیون بدن، فیبر برای تقویت سیستم ایمنی و ترکیبات فیتوشیمیایی برای مقابله با التهاب و اکسیدان‌ها هستند.';

  @override
  String get foodRequerementDialogCarbohydrateRestDayText5 => 'در هر وعده غذایی، تلاش کنید تا با تنوع بخشیدن به رنگ میوه‌ها و سبزیجات (سبز، قرمز، بنفش، زرد، سفید و نارنجی)، یک رنگین‌کمان از رنگ‌ها را در بشقاب خود داشته باشید. هر رنگ، حاوی مجموعه‌ای منحصربه‌فرد از مواد مغذی ساخته شده از نور خورشید (ترکیبات گیاهی مفید) است که بسیاری از آن‌ها به عنوان آنتی‌اکسیدان عمل کرده و به محافظت از سلول‌ها در برابر آسیب و کاهش التهاب پس از ورزش کمک می‌کنند.';

  @override
  String get foodRequerementDialogCarbohydrateRestDayText6 => 'در روزهای استراحت، با مصرف بیشتر میوه‌ها و سبزیجات، نیازهای ویتامینی و فیبر بدن را تأمین کنید؛ در روزهای تمرین نیز، برای تأمین انرژی مورد نیاز عضلات، بر مصرف کربوهیدرات‌های پیچیده و غنی تمرکز داشته باشید.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayText1 => '';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayText2 => '';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayText3 => '';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayText4 => '';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayText5 => '';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayText6 => '';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayText7 => '';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayText8 => '';
}
