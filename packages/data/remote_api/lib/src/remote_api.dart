import 'package:remote_api/remote_api.dart';
abstract interface class RemoteApi {
  factory RemoteApi({
    required Future<Language> Function() get_user_language,
    required Future<String> Function() get_access_token,
  }) => RemoteApiBase(
    get_user_language: get_user_language,
    get_access_token: get_access_token,
  );

  Future<String> sendVerificationCode({
    required VerificationCodeRequest verificationCodeRequest,
  });

  Future<String> register({required RegisterRequest registerRequest});

  Future<String> forgotPassword({
    required ForgotPasswordRequest forgotPasswordRequest,
  });

  Future<Token> authenticate({required Credential credential});

  Future<UserProfile> userProfile();

  Future<UserProfile> updateProfile(UserProfile updatedProfile);

  Future<UserBioData> userBioData();

  Future<void> deleteUserBioDataPoint({required String dataPointsId});

  Future<UserBioData> updateUserBioData(UserBioDataUpsert userBioDataUpsert);

  Future<List<FileData>> readUserImageGallary(List<GallaryTag> gallaryTags);

  Future<List<FileData>> readUserProfileImage();

  Future<FileDetail> readImage(FileData fileData);

  Future<ArchiveUserImagesResponse> archiveUserImages(List<String> imagesId);

  Future<List<FileData>> addUserImages(UserImage userImage);

  Future<List<Food>> readFoodsNutritionsByText(String prompt);

  Future<List<Food>> readFoodsNutrition(DateTime startDate, DateTime endDate);

  Future<Food> updateFoodsNutritions(Food food);

  Future<void> deleteFoodsNutritions(List<String> foodIds);

  Future<List<Food>> readFoodsNutritionsByVoice({
    required FileDetail prompt,
    required Language userSpokenLanguage,
  });
}
