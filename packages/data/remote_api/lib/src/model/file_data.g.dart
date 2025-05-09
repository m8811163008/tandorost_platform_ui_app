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
        'id',
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
      id: $checkedConvert('id', (v) => v as String),
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
  'id': instance.id,
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
  GallaryTag.profileImage: 'profileImage',
  GallaryTag.certificate: 'certificate',
};

const _$ProcessingStatusEnumMap = {
  ProcessingStatus.pending: 'pending',
  ProcessingStatus.approved: 'approved',
  ProcessingStatus.rejected: 'rejected',
  ProcessingStatus.archived: 'archived',
};

const _$ImageRejectionReasonEnumMap = {
  ImageRejectionReason.poorQuality: 'poorQuality',
  ImageRejectionReason.inappropriateContent: 'inappropriateContent',
  ImageRejectionReason.irrelevantContent: 'irrelevantContent',
  ImageRejectionReason.croppedOrObstructed: 'croppedOrObstructed',
  ImageRejectionReason.poorLighting: 'poorLighting',
  ImageRejectionReason.unsafeActivity: 'unsafeActivity',
  ImageRejectionReason.lackOfConsent: 'lackOfConsent',
  ImageRejectionReason.violatesGuidelines: 'violatesGuidelines',
  ImageRejectionReason.fileFormatUnsupported: 'fileFormatUnsupported',
  ImageRejectionReason.fileSizeTooLarge: 'fileSizeTooLarge',
  ImageRejectionReason.watermarkOrLogo: 'watermarkOrLogo',
  ImageRejectionReason.misleadingOrFalse: 'misleadingOrFalse',
  ImageRejectionReason.otherRejectionReason: 'otherRejectionReason',
};
