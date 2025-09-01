import 'package:remote_api/remote_api.dart';

class ImageRepository {
  final RemoteApi remoteApi;

  ImageRepository({required this.remoteApi});

  Future<List<FileData>> readUserImageGallary(List<GallaryTag> gallaryTags) =>
      remoteApi.readUserImageGallary(gallaryTags);
  Future<List<FileData>> readUnarchivedUserImageGallary(
    List<GallaryTag> gallaryTags,
  ) async {
    final images = await remoteApi.readUserImageGallary(gallaryTags);
    return images
        .where((image) => image.processingStatus != ProcessingStatus.archived)
        .toList();
  }

  Future<List<FileData>> readUserProfileImage() =>
      remoteApi.readUserProfileImage();
  // TODO add behavior subject for drawer

  Future<FileDetail> readImage(FileData fileData) =>
      remoteApi.readImage(fileData);

  Future<ArchiveUserImagesResponse> archiveUserImages(List<String> imagesId) =>
      remoteApi.archiveUserImages(imagesId);

  Future<List<FileData>> addUserImages(UserImage userImage) =>
      remoteApi.addUserImages(userImage);
}
