import 'dart:io';

import 'package:remote_api/src/model/audio_meme_type.dart';

class ReadFoodNutritionByVoiceRequest {
  final AudioMemeType audioMemeType;
  final File prompt;

  ReadFoodNutritionByVoiceRequest({
    required this.audioMemeType,
    required this.prompt,
  });
}
