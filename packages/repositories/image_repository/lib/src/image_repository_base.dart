import 'package:remote_api/remote_api.dart';

class ImageRepository {
  final RemoteApi remoteApi;

  ImageRepository({required this.remoteApi});

  Future<List<FileData>> readUserImageGallary(List<GallaryTag> gallaryTags) =>
      remoteApi.readUserImageGallary(gallaryTags);
  Future<List<FileData>> readUserProfileImage() =>
      remoteApi.readUserProfileImage();

  Future<FileDetail> readImage(FileData fileData) =>
      remoteApi.readImage(fileData);

  Future<ArchiveUserImagesResponse> archiveUserImages(List<String> imagesId) =>
      remoteApi.archiveUserImages(imagesId);

  Future<List<FileData>> addUserImages(UserImage userImage) =>
      remoteApi.addUserImages(userImage);
}
