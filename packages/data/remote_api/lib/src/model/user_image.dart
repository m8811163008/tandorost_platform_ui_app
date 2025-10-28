import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:remote_api/src/model/gallary_tag.dart';
import 'package:http_parser/http_parser.dart';

class UserFile {
  final GallaryTag gallaryTag;
  final List<FileDetail> imageGallaryFiles;
  final DateTime? uploadDate;
  final String? description;

  UserFile({
    required this.gallaryTag,
    required this.imageGallaryFiles,
    this.uploadDate,
    this.description,
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
      // Image formats
      case 'png':
        return MediaType('image', 'png');
      case 'jpg':
        return MediaType('image', 'jpg');
      case 'jpeg':
        return MediaType('image', 'jpeg');

      // Video formats
      case 'mp4':
        return MediaType('video', 'mp4');
      case 'mov':
        return MediaType(
          'video',
          'quicktime',
        ); // Often used for MOV/QuickTime files
      case 'avi':
        return MediaType('video', 'x-msvideo');
      case 'webm':
        return MediaType('video', 'webm');
      case 'mkv':
        return MediaType('video', 'x-matroska');

      // Audio formats
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
