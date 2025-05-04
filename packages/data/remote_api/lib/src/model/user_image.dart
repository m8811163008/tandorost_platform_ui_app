import 'dart:io';

import 'package:remote_api/src/model/gallary_tag.dart';

class UserImage {
  final GallaryTag gallaryTag;
  final List<File> imageGallaryFiles;

  UserImage({required this.gallaryTag, required this.imageGallaryFiles});
}
