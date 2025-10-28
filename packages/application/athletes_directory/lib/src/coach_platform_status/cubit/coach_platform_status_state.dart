part of 'coach_platform_status_cubit.dart';

@immutable
class CoachPlatformStatusState extends Equatable {
  final AsyncProcessingStatus onVerifyByAiStatus;
  final FileDetail? lastVerifyVideo;
  final AsyncProcessingStatus onReadVerifyVideos;
  final List<FileDetail> videoFilesDetail;
  final List<FileData> videoFilesData;
  final CoachesListShowingStatus showingStatus;

  const CoachPlatformStatusState({
    this.onVerifyByAiStatus = AsyncProcessingStatus.inital,
    this.onReadVerifyVideos = AsyncProcessingStatus.inital,
    this.showingStatus = CoachesListShowingStatus.regullar,
    this.lastVerifyVideo,
    this.videoFilesDetail = const [],
    this.videoFilesData = const [],
  });

  CoachPlatformStatusState copyWith({
    AsyncProcessingStatus? onVerifyByAiStatus,
    ValueGetter<FileDetail?>? lastVerifyVideo,
    AsyncProcessingStatus? onReadVerifyVideosStatus,
    List<FileDetail>? videoFilesDetail,
    List<FileData>? videoFilesData,
    CoachesListShowingStatus? showingStatus,
  }) {
    return CoachPlatformStatusState(
      onVerifyByAiStatus: onVerifyByAiStatus ?? this.onVerifyByAiStatus,
      lastVerifyVideo: lastVerifyVideo != null
          ? lastVerifyVideo()
          : this.lastVerifyVideo,
      onReadVerifyVideos: onReadVerifyVideosStatus ?? this.onReadVerifyVideos,
      videoFilesDetail: videoFilesDetail ?? this.videoFilesDetail,
      videoFilesData: videoFilesData ?? this.videoFilesData,
      showingStatus: showingStatus ?? this.showingStatus,
    );
  }

  @override
  List<Object?> get props => [
    onVerifyByAiStatus,
    lastVerifyVideo,
    onReadVerifyVideos,
    videoFilesDetail,
    videoFilesData,
    showingStatus,
  ];
}

enum CoachesListShowingStatus {
  // add arb file
  pendingVerification,
  regullar;

  bool get isShowing => this == CoachesListShowingStatus.regullar;
}
