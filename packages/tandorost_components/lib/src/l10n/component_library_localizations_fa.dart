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
        'fitnessProfileRoute': 'ترکیب بدن | تناسب اندام',
        'foodReportRoute': 'گزارش تغذیه',
        'vo2maxCalculator': 'هوازی | حداکثر کاهش چربی',
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
  String foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText1(int weight, int carbohydrate, int protein) {
    return 'زمان و مقدار مصرف کربوهیدرات پیش از تمرین با یکدیگر مرتبط هستند. به طور کلی، می‌توانید ۱ تا ۴ گرم کربوهیدرات به ازای هر کیلوگرم وزن بدن، از ۱ تا ۴ ساعت پیش از شروع تمرین مصرف کنید. برای نمونه، با وزن $weight کیلوگرم، اگر ۲ ساعت تا آغاز تمرین باقی مانده است، می‌توانید $carbohydrate گرم کربوهیدرات به همراه $protein گرم پروتئین با کیفیت میل کنید.';
  }

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText2 => 'مصرف کربوهیدرات ۱ تا ۴ ساعت پیش از تمرین به افزایش ذخیره گلیکوژن و بهبود عملکرد تمرین کمک می‌کند. خوردن کربوهیدرات تا ۲ ساعت قبل از تمرین، زمان کافی برای هضم و جذب آن را فراهم می‌سازد.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText3 => 'در صورتی که وعده غذایی خود را نزدیک به زمان تمرین میل کنید، ممکن است دچار سوهاضمه و ناراحتی معده شوید؛ زیرا هنگام تمرین، جریان خون از معده به سمت عضلات هدایت می‌شود تا اکسیژن را به عضلات برساند.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText4 => 'اگر پیش از تمرین دچار ناراحتی معده یا سوهاضمه شدید، توصیه می‌شود دو ساعت پیش از شروع تمرین یک میان‌وعده سبک و ساده با کربوهیدرات با شاخص گلیسمی بالا مانند موز یا سایر میوه‌های تازه یا خشک و یک مشت آجیل میل کنید. همچنین می‌توانید نان و کره مغزیجات (مانند کره پسته یا بادام‌زمینی) یا فرنی و جودوسر با شیر (اوتمیل) مصرف نمایید.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText1 => 'تا پیش از ۴۵ دقیقه تمرین، به جز آب نیازی به مصرف ماده غذایی دیگری نیست؛ زیرا در این مدت، احتمال تخلیه ذخایر گلیکوژن پایین است.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText2 => 'برای تمرین‌های ۴۵ تا ۷۵ دقیقه‌ای، می‌توانید کربوهیدرات شیرین را بمکید یا بچشید تا هم پیام خستگی به مغز کاهش یابد و هم در صورت دشواری خوردن هنگام تمرین، از مشکلات گوارشی جلوگیری شود.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText3 => 'در تمرین‌های بیش از یک ساعت، می‌توانید به ازای هر ساعت، ۳۰ تا ۶۰ گرم کربوهیدرات بسته به شدت تمرین مصرف کنید. بدن قادر نیست بیش از ۱ گرم گلوکز در دقیقه را در عضله با اکسیژن ترکیب کند؛ مصرف بیش از ۶۰ گرم کربوهیدرات در ساعت ممکن است مشکلات گوارشی ایجاد کند و سود بیشتری نخواهد داشت.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText4 => 'حدود ۱۵ تا ۲۰ دقیقه طول می‌کشد تا کربوهیدرات مصرف‌شده به عضلات برسد؛ بنابراین، میان‌وعده تمرینی را پیش از شروع خستگی میل کنید. معمولاً هر ۲۰ تا ۳۰ دقیقه در طول تمرین می‌توانید کربوهیدرات مصرف نمایید.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText5 => 'سه نمونه از میان‌وعده‌های مناسب تمرین شامل یک عدد موز، دو عدد خرما یا یک عدد انبه است که هرکدام حدود ۳۰ گرم کربوهیدرات دارند. در صورت شدت بالای تمرین، می‌توانید تا دو برابر این مقدار مصرف کنید.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText1 => 'گلیکوژن مصرف‌شده در طول تمرین باید برای تمرین‌های روزهای بعد جبران شود؛ در غیر این صورت، عملکرد تمرینات بعدی کاهش می‌یابد.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText2 => 'در دو ساعت پس از تمرین، ذخیره‌سازی گلیکوژن تا ۱۵۰ درصد بیشتر از حالت عادی انجام می‌شود.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText3 => 'در دو ساعت ابتدایی پس از تمرین، جذب گلوکز بیشتر است؛ زیرا هم میزان گلوکز خون افزایش یافته و هم نفوذپذیری غشای سلولی برای دریافت گلوکز نسبت به حالت عادی بیشتر می‌شود.';

  @override
  String foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText4(int carbohydrateValu1, int carbohydrateValu2) {
    return 'تا چهار ساعت پس از تمرین، می‌توانید به ازای هر کیلوگرم وزن بدن، ۱ تا ۱.۲ گرم کربوهیدرات در هر ساعت مصرف کنید که معادل $carbohydrateValu1 تا $carbohydrateValu2 گرم کربوهیدرات در هر ساعت است. این مقدار، حداکثر میزان کربوهیدراتی است که دستگاه گوارش می‌تواند در هر ساعت هضم کند.';
  }

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText5 => 'توصیه می‌شود کربوهیدرات را همراه با پروتئین با کیفیت (حاوی لوسین) برای حداکثرسازی عضله‌سازی و تأمین گلیکوژن مصرف کنید.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText6 => 'مصرف پروتئین همراه با کربوهیدرات باعث ترشح بیشتر انسولین نسبت به مصرف تنها کربوهیدرات می‌شود. افزایش انسولین، جذب گلوکز و آمینواسیدهای پروتئین توسط سلول‌های عضلانی را افزایش داده و سطح کورتیزول را کاهش می‌دهد؛ در نتیجه، ترکیب پروتئین برای ساخت عضله بیشتر خواهد شد.';

  @override
  String get foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText7 => 'وجود پروتئین در وعده غذایی پس از تمرین، به ساخت و ترمیم پروتئین عضلات کمک می‌کند و موجب کاهش تجزیه پروتئین و افزایش ذخیره پروتئین در عضلات برای بازسازی پس از تمرین می‌شود.';

  @override
  String foodRequerementDialogProteinRestDayText1(int proteinPerMeal) {
    return 'سعی کنید هر 3 ساعت در 5 وعده و هر وعده به مقدار مساوی و منظم حدود $proteinPerMeal گرم در هر وعده پروتئین بخورید*. پروتئین باعث سیری طولانی مدت تر نسبت به کربوهیدرات میشود و در کنار غلات سبوس دار و حبوبات فیبر دار باعث سیری و کاهش اشتها در روز میشود . 30 درصد از پروتئین را از منبع شیر و محصولات لبنی تامین کنید که همزمان غنی از کلسیم هستند.';
  }

  @override
  String get foodRequerementDialogProteinRestDayText2 => 'تمام پروتئین های حیوانی مانند شیر و گوشت با کیفیت هستند. اگر 9 آمینو اسید ضروری در ماده غذایی تقریبا به اندازه نیاز بدن باشد به آنها پروتئین با کیفیت بالا میگیم، به همین خاطر بین مواد غذایی گیاهی ، سویا(شیر و ماست سویا) ، گندم سیاه، دانه کینوا، دانه چیا و دانه کنف یا شاهدانه غذای گیاهی شامل پروتئین با کیفیت بالا هستند.';

  @override
  String get foodRequerementDialogProteinRestDayText3 => 'همچنین لوبیا، عدس، نخود، غلات و آجیل ها شامل برخی آمینو اسید های ضروری هستند که میتوانید با خوردن ترکیبی ازین مواد غذایی نیاز بدن به امینو اسید های ضروری را در 24 ساعت تامین کنید.برای مثال خوردن لوبیا و برنج و آجیل هر 9 آمینو اسید ضروری را تامین میکنند.';

  @override
  String foodRequerementDialogProteinRestDayText4(double proteinPerBodyWeight) {
    final intl.NumberFormat proteinPerBodyWeightNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 1
    );
    final String proteinPerBodyWeightString = proteinPerBodyWeightNumberFormat.format(proteinPerBodyWeight);

    return 'پروتئین با مقدار جذب بیشتر از روده بزرگ و امتیاز بیشتر DIAAS : شیر و تخم مرغ و سویا و محصولات سویا و نخود  وعدس سبز و لوبیا سیاه و بادام زمینی و برنج سفید هستند. شما روزانه به $proteinPerBodyWeightString گرم پروتئین به ازای هر کیلو از وزن بدنتون نیاز دارید تا با توجه به سطح فعالیت هفتگی و سرعت کاهش وزن عضله‌های خود را حفظ و افزایش دهید.';
  }

  @override
  String get foodRequerementDialogProteinRestDayText5 => '*مبتدیان مقدار پروتئین بیشتری نسبت به ورزشکار حرفه ای نیاز دارند ( تا 3 هفته اول 40 درصد بیشتر از افراد حرفه ای هست)';

  @override
  String get foodRequerementDialogProteinRestDayText6 => 'اگر به اندازه کافی پروتئین بخورید میتوانید بدون ورزش و با حداقل کاهش ماهیچه ، چربی کم کنید.';

  @override
  String get foodRequerementDialogProteinRestDayText7 => 'برای سرعت بیشتر کاهش چربی و تناسب اندام و همچنین افزایش ماهیچه میتوانید ورزش پرورش اندام یا دیگر ورزش ها مانند بوکس یا شنا را انجام دهید';

  @override
  String get foodRequerementDialogProteinTrainingDayText1 => 'مصرف غذای پروتئینی همراه با تمرین مقاومتی به ساخت ماهیچه کمک می‌کند. افزایش حجم ماهیچه باعث بالا رفتن نرخ سوخت‌وساز، کاهش سریع‌تر وزن، افزایش اعتماد به نفس و بهبود تناسب اندام می‌شود.';

  @override
  String get foodRequerementDialogProteinTrainingDayText2 => 'برای ساخت ماهیچه، مصرف پروتئین با کیفیت حاوی لوسین که سریع هضم و جذب می‌شود ضروری است. برای حداکثر عضله‌سازی باید آستانه لوسین (۲ تا ۳ گرم در هر وعده) تأمین شود.';

  @override
  String get foodRequerementDialogProteinTrainingDayText3 => 'مواد غذایی زیر حاوی ۲ تا ۳ گرم لوسین هستند و مصرف آن‌ها بعد از تمرین همراه با کربوهیدرات برای حداکثر عضله‌سازی توصیه می‌شود:';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine1 => '۶۰۰ میلی‌لیتر شیر کامل';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine2 => '۸۵ گرم پنیر چدار';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine3 => '۴۵۰ گرم ماست ساده';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine4 => '۴ عدد تخم‌مرغ (یک زرده و ۴ سفیده توصیه می‌شود)';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine5 => '۸۵ گرم گوشت قرمز یا گوشت پرنده';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine6 => '۱۰۰ گرم ماهی';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine7 => '۱۷ گرم پودر پروتئین وی';

  @override
  String get foodRequerementDialogProteinTrainingDayText3SampleLucine8 => '۴۰۰ گرم لوبیا یا عدس پخته‌شده';

  @override
  String get foodRequerementDialogProteinTrainingDayText4 => 'شیر حاوی آب، پروتئین، کربوهیدرات و مواد مغذی است و گزینه‌ای عالی برای ریکاوری عضلات بعد از تمرین محسوب می‌شود؛ زیرا به تأمین ذخیره گلیکوژن، ساخت ماهیچه و آب‌رسانی بدن کمک می‌کند. نوع شیر (کم‌چرب، پرچرب، شیر قهوه، شیر کاکائو یا طعم‌دار) تفاوتی ندارد.';

  @override
  String get foodRequerementDialogProteinTrainingDayText5 => 'برای ریکاوری و عضله‌سازی در پایان شب، مواد غذایی حاوی کازئین مانند شیر، ماست یا مکمل مصرف کنید. پروتئین باعث احساس سیری طولانی‌تر و خواب عمیق‌تر می‌شود.';

  @override
  String get foodRequerementDialogProteinTrainingDayText6 => 'پروتئین‌ها از آمینواسیدها ساخته شده‌اند. یازده نوع آمینواسید در بدن ساخته می‌شوند (آمینواسیدهای غیرضروری) و نه نوع دیگر باید از طریق رژیم غذایی تأمین شوند (آمینواسیدهای ضروری).';

  @override
  String get foodRequerementDialogProteinTrainingDayText7 => 'پروتئین‌ها به طور مداوم در بدن تجزیه می‌شوند (تجزیه پروتئین عضله) و آمینواسیدها نیز به طور مداوم در ساخت پروتئین‌ها به کار می‌روند (سنتز پروتئین عضله).';

  @override
  String get foodRequerementDialogFatRestDayText1 => 'مقدار مصرف چربی بر اساس توصیه سازمان‌های بهداشت جهانی، رژیم مدیترانه‌ای و سبک آشپزی ایرانی، حدود ۳۵ درصد انرژی روزانه است. کاهش مصرف چربی به کاهش وزن، کاهش شاخص توده بدنی و دور کمر و افزایش اعتماد به نفس کمک می‌کند. بیشترین میزان چربی‌سوزی بدن شما در محدوده ۶۲ تا ۶۳ درصد VO2max رخ می‌دهد.';

  @override
  String get foodRequerementDialogFatRestDayText2 => 'چربی بیشترین مقدار انرژی را در بین مواد غذایی دارد و مصرف زیاد آن به‌راحتی اتفاق می‌افتد. برای مثال، انرژی یک قاشق غذاخوری روغن معادل ۹ کیلوکالری ضربدر ۱۵ گرم یا ۱۳۵ کیلوکالری است؛ بنابراین به مقدار روغن مصرفی خود دقت کنید.';

  @override
  String get foodRequerementDialogFatRestDayText3 => '۳۵ درصد انرژی روزانه باید از چربی‌ها تأمین شود که شامل سه بخش زیر است:';

  @override
  String get foodRequerementDialogFatRestDayText4 => '۱۰ درصد چربی اشباع (معمولاً جامد یا نیمه‌جامد در دمای اتاق): روغن‌های گیاهی مانند پالم، نارگیل و کاکائو و همچنین چربی‌های حیوانی مانند دنبه، چربی بین بافت ماهیچه و گوشت، کره و موارد مشابه.';

  @override
  String get foodRequerementDialogFatRestDayText5 => 'چربی‌های موجود در محصولات لبنی به دلیل ساختار مولکولی خاص چربی شیر، کلسترول خون را افزایش نمی‌دهند و خطر بیماری قلبی عروقی ندارند. همچنین بخشی از چربی غیراشباع آن به دلیل ترکیب با کلسیم جذب بدن نمی‌شود.';

  @override
  String get foodRequerementDialogFatRestDayText6 => 'حداکثر ۱۲ درصد چربی غیراشباع تک‌زنجیره‌ای (معمولاً مایع در دمای اتاق): روغن زیتون، روغن کلزا، روغن آفتابگردان، بادام‌زمینی، روغن فندق و بادام، آووکادو، زیتون، آجیل و دانه‌ها.';

  @override
  String get foodRequerementDialogFatRestDayText7 => 'حداقل ۱۳ درصد چربی غیراشباع چندزنجیره‌ای (معمولاً مایع در دمای اتاق): امگا ۳ نوع EPA و DHA عمدتاً در ماهی‌های چرب مانند قزل‌آلا، سالمون و خال‌مخالی و به مقدار کمتر در ماهی تن وجود دارد. حداقل هفته‌ای یک بار ماهی چرب مصرف کنید. روغن کلزا با نسبت ۲ به ۱ امگا ۶ به امگا ۳ و نقطه دود ۱۷۰ درجه سانتی‌گراد برای پخت‌وپز مناسب است.';

  @override
  String get foodRequerementDialogFatRestDayText8 => 'چربی منبع مهمی از انرژی برای ورزش است. نسبت مصرف چربی و کربوهیدرات در بدن به شدت و مدت زمان فعالیت، سطح آمادگی جسمانی و رژیم غذایی قبل از ورزش بستگی دارد.';

  @override
  String get foodRequerementDialogFatRestDayText9 => 'سطح بالای کلسترول LDL یکی از عوامل اصلی بیماری‌های قلبی عروقی است. جایگزین کردن بخشی از چربی‌های اشباع با چربی‌های غیراشباع به کاهش کلسترول LDL و کاهش خطر بیماری قلبی کمک می‌کند.';

  @override
  String get foodRequerementDialogFatRestDayText10 => 'اسیدهای چرب امگا ۳ باعث کاهش التهاب و کاهش خطر بیماری‌های قلبی عروقی و سایر بیماری‌های مزمن می‌شوند.';

  @override
  String get foodRequerementDialogFatRestDayText11 => 'مصرف مکمل امگا ۳ می‌تواند به بهبود سازگاری عضلات، متابولیسم انرژی، ریکاوری عضلات و پیشگیری از آسیب کمک کند.';

  @override
  String get vo2maxCalculatorText1 => 'در طول تمرینات با شدت کم، چربی سوخت اصلی است، در حالی که کربوهیدرات سوخت اصلی در تمرینات با شدت بالا است.';

  @override
  String get vo2maxCalculatorText2 => 'با این حال، اکسیداسیون کل چربی بر حسب گرم با افزایش شدت ورزش از کم به زیاد افزایش می‌یابد، حتی اگر درصد سهم چربی کاهش یابد. این به این دلیل است که کل انرژی مصرفی افزایش می‌یابد، یعنی کالری بیشتری در دقیقه می‌سوزانید.';

  @override
  String get vo2maxCalculatorText3 => 'به طور متوسط، بالاترین نرخ اکسیداسیون چربی (\"fat max\") در ۶۲-۶۳٪ VO2max رخ می‌دهد.';

  @override
  String get vo2maxCalculatorText4 => 'هر چه شدت تمرین بیشتر باشد، سرعت شکسته شدن گلیکوژن ماهیچه بیشتر می‌شود.';

  @override
  String get vo2maxCalculatorText5 => 'برای محاسبه مقدار بهینه و بهترین سرعت برای حداکثر چربی‌سوزی ابتدا تست کوپر را اجرا می‌کنیم و سپس مقدار بهینه مسافتی که باید با سرعت تقریباً ثابت در زمان کاردیو راه بروید را محاسبه می‌کنیم.';

  @override
  String get vo2maxCalculatorText6 => 'به مدت ۱۲ دقیقه روی تردمیل یا زمین صاف حداکثر مسافتی که می‌توانید، بدوید و سپس مسافت را به متر برای محاسبه VO2max در زیر وارد کنید.';

  @override
  String get vo2maxCalculatorLabelText => 'مسافت طی شده به متر';

  @override
  String get vo2maxCalculatorHintText => 'مسافت طی شده در ۱۲ دقیقه به متر';

  @override
  String vo2maxCalculatorVo2maxRate(double vo2max) {
    final intl.NumberFormat vo2maxNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 2
    );
    final String vo2maxString = vo2maxNumberFormat.format(vo2max);

    return 'مقدار VO2max شما $vo2maxString می‌باشد';
  }

  @override
  String vo2maxCalculatorVo2maxEfficientDistance(double maxDistanceInMeterInOneMinues) {
    final intl.NumberFormat maxDistanceInMeterInOneMinuesNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 1
    );
    final String maxDistanceInMeterInOneMinuesString = maxDistanceInMeterInOneMinuesNumberFormat.format(maxDistanceInMeterInOneMinues);

    return 'مسافت بهینه شما در 62 درصد VO2max در هر دقیقه $maxDistanceInMeterInOneMinuesString متر میباشد';
  }

  @override
  String get vo2maxCalculatorVo2maxRecommandation => 'برای حداکثر کردن سرعت چربی سوزی بعد از تمرین مقاومتی بین 15 تا 30 دقیقه تمرین هوازی انجام دهید';

  @override
  String vo2maxCalculatorVo2maxDistance(int minutes, double distance) {
    final intl.NumberFormat distanceNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 2
    );
    final String distanceString = distanceNumberFormat.format(distance);

    return 'در $minutes دقیقه مسافت $distanceString متر را با سرعت متوسط طی کنید';
  }

  @override
  String get timeRestrictedText1 => 'فستینگ یا غذا خوردن با محدودیت زمانی، نوعی روزه‌داری متناوب است که شامل یک بازه روزه‌داری ۱۲ تا ۱۶ ساعته و یک بازه غذا خوردن ۸ تا ۱۲ ساعته در روز می‌شود.';

  @override
  String get timeRestrictedText2 => 'تنظیم وعده‌های غذایی بر اساس ریتم شبانه‌روزی (ساعت زیستی بدن) به بهبود عملکرد بدن، سلامت و کاهش وزن کمک می‌کند.';

  @override
  String get timeRestrictedText3 => 'مطالعات نشان داده‌اند که اختلال در ریتم شبانه‌روزی می‌تواند بر هورمون‌های کنترل‌کننده اشتها، مصرف انرژی و قند خون اثر منفی بگذارد.';

  @override
  String get timeRestrictedText4 => 'خوردن از ساعت ۸ صبح تا ۲ ظهر می‌تواند مفید باشد و اشتها و مصرف غذا را کاهش دهد.';

  @override
  String get timeRestrictedText5 => 'یک مطالعه نشان داده است که غذا خوردن در یک بازه ۶ ساعته پیش از ساعت ۳ بعدازظهر، گرسنگی و عوامل خطر دیابت نوع ۲ را در مردان مبتلا به پیش‌دیابت کاهش داده است.';

  @override
  String get timeRestrictedText6 => 'در فستینگ، به دلیل محدودیت زمانی غذا خوردن، احتمال دریافت کالری کمتر و کاهش وزن وجود دارد و همچنین با تنظیم وعده‌ها بر اساس ساعت زیستی بدن، از دیر خوردن شام جلوگیری می‌شود.';

  @override
  String get timeRestrictedText7 => 'بیشتر مطالعات فستینگ روی حیوانات انجام شده و شواهد انسانی محدود است؛ تنها تعداد کمی از مطالعات، کاهش وزن را در انسان‌ها نشان داده‌اند.';

  @override
  String get timeRestrictedText8 => 'در بازه غذا خوردن، مطابق نیاز انرژی و درشت‌مغذی‌های خود رژیم بگیرید.';

  @override
  String get timeRestrictedText9 => 'فستینگ‌های رایج شامل ۱۲ ساعت روزه‌داری و ۱۲ ساعت غذا خوردن است و می‌توانید تا ۱۶ ساعت روزه‌داری را افزایش دهید.';

  @override
  String get timeRestrictedText10 => 'نوشیدن مایعات مانند آب و دمنوش در تمام طول شبانه‌روز مجاز است.';
}
