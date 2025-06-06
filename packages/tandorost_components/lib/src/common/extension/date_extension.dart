import 'package:domain_model/domain_model.dart';
import 'package:flutter/widgets.dart';
import 'package:tandorost_components/tandorost_components.dart';

extension DateExtension on DateTime {
  String formattedDate(BuildContext context) {
    final locale = Localizations.localeOf(context);
    late final String formattedDate;
    if (locale.languageCode == Language.persian.code) {
      final shamsiDate = Jalali.fromDateTime(this);
      formattedDate =
          '${shamsiDate.year}/${_twoDigits(shamsiDate.month)}/${_twoDigits(shamsiDate.day)}';
    } else {
      formattedDate = '$year/${_twoDigits(month)}/${_twoDigits(day)}';
    }
    return formattedDate;
  }

  String formattedDateTime(BuildContext context) {
    final locale = Localizations.localeOf(context);
    late final String formattedDateTime;
    if (locale.languageCode == Language.persian.code) {
      final shamsiDate = Jalali.fromDateTime(this);
      formattedDateTime =
          '${_twoDigits(hour)}:${_twoDigits(minute)} ${shamsiDate.year}/${_twoDigits(shamsiDate.month)}/${_twoDigits(shamsiDate.day)}';
    } else {
      formattedDateTime =
          '${_twoDigits(hour)}:${_twoDigits(minute)} $year/${_twoDigits(month)}/${_twoDigits(day)}';
    }
    return formattedDateTime;
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}
