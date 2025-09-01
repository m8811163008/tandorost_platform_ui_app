import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/src/model/gallary_tag.dart';
import 'package:http_parser/http_parser.dart';

class UserImage {
  final GallaryTag gallaryTag;
  final List<FileDetail> imageGallaryFiles;
  final DateTime? uploadDate;

  UserImage({
    required this.gallaryTag,
    required this.imageGallaryFiles,
    this.uploadDate,
  });
}

class FileDetail extends Equatable {
  final String fileName;
  final Uint8List bytes;

  final DateTime? uploadDate;

  FileDetail({required this.fileName, required this.bytes, this.uploadDate});

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
        return MediaType('audio', 'mpeg');
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

  @override
  List<Object?> get props => [fileName, bytes, uploadDate];
}
