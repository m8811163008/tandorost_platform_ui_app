import 'dart:typed_data';

import 'package:remote_api/src/model/gallary_tag.dart';
import 'package:http_parser/http_parser.dart';

class UserImage {
  final GallaryTag gallaryTag;
  final List<FileDetail> imageGallaryFiles;

  UserImage({required this.gallaryTag, required this.imageGallaryFiles});
}

class FileDetail {
  final String fileName;
  final Uint8List bytes;

  FileDetail({required this.fileName, required this.bytes});

  MediaType get mediaType {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'png':
        return MediaType('image', 'png');
      case 'jpg':
        return MediaType('image', 'jpg');
      case 'jpeg':
        return MediaType('image', 'jpeg');
      case 'wav':
        return MediaType('audio', 'wav');
      case 'mp3':
        return MediaType('audio', 'mp3');
      case 'aiff':
        return MediaType('audio', 'aiff');
      case 'aac':
        return MediaType('audio', 'aac');
      case 'ogg':
        return MediaType('audio', 'ogg');
      case 'flac':
        return MediaType('audio', 'flac');
      default:
        return MediaType('application', 'octet-stream');
    }
  }
}
