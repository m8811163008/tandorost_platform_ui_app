import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum Language {
  english('en'),
  chinese('zh'),
  hindi('hi'),
  spanish('es'),
  french('fr'),
  arabic('ar'),
  bengali('bn'),
  russian('ru'),
  portuguese('pt'),
  urdu('ur'),
  indonesian('id'),
  german('de'),
  japanese('ja'),
  marathi('mr'),
  telugu('te'),
  turkish('tr'),
  tamil('ta'),
  vietnamese('vi'),
  tagalog('tl'),
  korean('ko'),
  persian('fa'),
  hausa('ha'),
  javanese('jv'),
  italian('it'),
  punjabi('pa'),
  kannada('kn'),
  gujarati('gu'),
  thai('th'),
  polish('pl'),
  ukrainian('uk');

  const Language(this.code);
  final String code;
}
