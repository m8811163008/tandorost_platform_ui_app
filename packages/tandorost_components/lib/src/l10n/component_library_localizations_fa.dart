// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'component_library_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class ComponentLibraryLocalizationsFa extends ComponentLibraryLocalizations {
  ComponentLibraryLocalizationsFa([String locale = 'fa']) : super(locale);

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
  String get foodReportUserFoodRequirementNA => 'N/A';
}
