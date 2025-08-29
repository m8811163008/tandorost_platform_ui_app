import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/src/model/model.dart';

part 'file_data.g.dart';

@JsonSerializable()
class FileData extends Equatable {
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
  final String? description;

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
    required this.description,
    this.rejectProcessingStatusDesc,
  });

  factory FileData.fromJson(Map<String, dynamic> json) =>
      _$FileDataFromJson(json);

  Map<String, dynamic> toJson() => _$FileDataToJson(this);

  @override
  List<Object?> get props => [
    id,
    userId,
    tag,
    fileName,
    fileSize,
    uploadDate,
    contentType,
    fileUploadPath,
    processingStatus,
    rejectProcessingStatusDesc,
    description,
  ];
  FileData copyWith({
    String? id,
    String? userId,
    GallaryTag? tag,
    String? fileName,
    int? fileSize,
    DateTime? uploadDate,
    String? contentType,
    String? fileUploadPath,
    ProcessingStatus? processingStatus,
    String? description,
    ValueGetter<ImageRejectionReason?>? rejectProcessingStatusDesc,
  }) {
    return FileData(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      tag: tag ?? this.tag,
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
      uploadDate: uploadDate ?? this.uploadDate,
      contentType: contentType ?? this.contentType,
      fileUploadPath: fileUploadPath ?? this.fileUploadPath,
      processingStatus: processingStatus ?? this.processingStatus,
      rejectProcessingStatusDesc: rejectProcessingStatusDesc != null
          ? rejectProcessingStatusDesc()
          : this.rejectProcessingStatusDesc,
      description: description ?? this.description,
    );
  }
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
