import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/src/model/model.dart';

part 'file_data.g.dart';

@JsonSerializable()
class FileData {
  @JsonKey(name: '_id')
  final String id;
  final String userId;
  final GallaryTag tag;
  final String fileName;
  final int fileSize;
  final DateTime uploadDate;
  final String contentType;
  final String fileUploadPath;
  final ProcessingStatus processingStatus;
  final ImageRejectionReason? rejectProcessingStatusDesc;

  FileData({
    required this.id,
    required this.userId,
    required this.tag,
    required this.fileName,
    required this.fileSize,
    required this.uploadDate,
    required this.contentType,
    required this.fileUploadPath,
    required this.processingStatus,
    this.rejectProcessingStatusDesc,
  });

  factory FileData.fromJson(Map<String, dynamic> json) =>
      _$FileDataFromJson(json);

  Map<String, dynamic> toJson() => _$FileDataToJson(this);
}

@JsonEnum()
enum ProcessingStatus { pending, approved, rejected, archived }

@JsonEnum(fieldRename: FieldRename.snake)
enum ImageRejectionReason {
  poorQuality,

  inappropriateContent,

  irrelevantContent,

  croppedOrObstructed,

  poorLighting,

  unsafeActivity,

  lackOfConsent,

  violatesGuidelines,

  fileFormatUnsupported,

  fileSizeTooLarge,

  watermarkOrLogo,

  misleadingOrFalse,

  otherRejectionReason,
}
