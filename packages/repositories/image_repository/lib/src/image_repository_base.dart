import 'package:remote_api/remote_api.dart';

class ImageRepository {
  final RemoteApi remoteApi;
  static final baseUriWithPath = UriBuilder.baseUriWithPath;
  //   static final baseUri = Uri(scheme: 'http', host: '10.233.31.85', port: 8001);
  // // static final baseUri = Uri(
  // //   scheme: 'http',
  // //   host: '10.105.146.237',
  // //   port: 8001,
  // // );
  // static final basePath = '/api/v1';

  // static final baseUriWithPath = baseUri.replace(path: basePath);

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

  Future<List<FileData>> addUserImages(UserFile userImage) =>
      remoteApi.addUserImages(userImage);
  Future<List<FileData>> readUsersImages({
    required List<GallaryTag> gallaryTags,
    required List<String> userIds,
  }) => remoteApi.readUsersImages(gallaryTags: gallaryTags, userIds: userIds);
}
