// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileData _$FileDataFromJson(Map<String, dynamic> json) => $checkedCreate(
  'FileData',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        '_id',
        'user_id',
        'tag',
        'file_name',
        'file_size',
        'upload_date',
        'content_type',
        'file_upload_path',
        'processing_status',
        'reject_processing_status_desc',
      ],
    );
    final val = FileData(
      id: $checkedConvert('_id', (v) => v as String),
      userId: $checkedConvert('user_id', (v) => v as String),
      tag: $checkedConvert('tag', (v) => $enumDecode(_$GallaryTagEnumMap, v)),
      fileName: $checkedConvert('file_name', (v) => v as String),
      fileSize: $checkedConvert('file_size', (v) => (v as num).toInt()),
      uploadDate: $checkedConvert(
        'upload_date',
        (v) => DateTime.parse(v as String),
      ),
      contentType: $checkedConvert('content_type', (v) => v as String),
      fileUploadPath: $checkedConvert('file_upload_path', (v) => v as String),
      processingStatus: $checkedConvert(
        'processing_status',
        (v) => $enumDecode(_$ProcessingStatusEnumMap, v),
      ),
      rejectProcessingStatusDesc: $checkedConvert(
        'reject_processing_status_desc',
        (v) => $enumDecodeNullable(_$ImageRejectionReasonEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'id': '_id',
    'userId': 'user_id',
    'fileName': 'file_name',
    'fileSize': 'file_size',
    'uploadDate': 'upload_date',
    'contentType': 'content_type',
    'fileUploadPath': 'file_upload_path',
    'processingStatus': 'processing_status',
    'rejectProcessingStatusDesc': 'reject_processing_status_desc',
  },
);

Map<String, dynamic> _$FileDataToJson(FileData instance) => <String, dynamic>{
  '_id': instance.id,
  'user_id': instance.userId,
  'tag': _$GallaryTagEnumMap[instance.tag]!,
  'file_name': instance.fileName,
  'file_size': instance.fileSize,
  'upload_date': instance.uploadDate.toIso8601String(),
  'content_type': instance.contentType,
  'file_upload_path': instance.fileUploadPath,
  'processing_status': _$ProcessingStatusEnumMap[instance.processingStatus]!,
  if (_$ImageRejectionReasonEnumMap[instance.rejectProcessingStatusDesc]
      case final value?)
    'reject_processing_status_desc': value,
};

const _$GallaryTagEnumMap = {
  GallaryTag.defaultTag: 'default',
  GallaryTag.profileImage: 'profile_image',
  GallaryTag.certificate: 'certificate',
};

const _$ProcessingStatusEnumMap = {
  ProcessingStatus.pending: 'pending',
  ProcessingStatus.approved: 'approved',
  ProcessingStatus.rejected: 'rejected',
  ProcessingStatus.archived: 'archived',
};

const _$ImageRejectionReasonEnumMap = {
  ImageRejectionReason.poorQuality: 'poor_quality',
  ImageRejectionReason.inappropriateContent: 'inappropriate_content',
  ImageRejectionReason.irrelevantContent: 'irrelevant_content',
  ImageRejectionReason.croppedOrObstructed: 'cropped_or_obstructed',
  ImageRejectionReason.poorLighting: 'poor_lighting',
  ImageRejectionReason.unsafeActivity: 'unsafe_activity',
  ImageRejectionReason.lackOfConsent: 'lack_of_consent',
  ImageRejectionReason.violatesGuidelines: 'violates_guidelines',
  ImageRejectionReason.fileFormatUnsupported: 'file_format_unsupported',
  ImageRejectionReason.fileSizeTooLarge: 'file_size_too_large',
  ImageRejectionReason.watermarkOrLogo: 'watermark_or_logo',
  ImageRejectionReason.misleadingOrFalse: 'misleading_or_false',
  ImageRejectionReason.otherRejectionReason: 'other_rejection_reason',
};
