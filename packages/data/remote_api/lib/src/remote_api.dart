import 'package:remote_api/remote_api.dart';
import 'remote_api_base.dart';

/// An abstract interface class for interacting with a remote API.
///
/// This class provides a set of methods for performing various operations
/// such as user authentication, profile management, image handling, and
/// food nutrition data management.
abstract interface class RemoteApi {
  /// Factory constructor to create an instance of [RemoteApi].
  ///
  /// - [get_user_language]: A function that retrieves the user's language.
  /// - [get_access_token]: A function that retrieves the access token.
  factory RemoteApi() {
    return RemoteApiBase();
  }

  late final Stream<Language> userLanguageProvider;
  late final Future<Token?> Function() accessTokenProvider;

  Stream<AuthenticationStatus> get authenticationStatusStream;

  /// Sends a verification code to the user.
  ///
  /// - [verificationCodeRequest]: The request object containing the necessary
  ///   details for sending the verification code.
  ///
  /// Returns a [Future] that resolves to a string response.
  Future<String> sendVerificationCode({
    required VerificationCodeRequest verificationCodeRequest,
  });

  /// Registers a new user.
  ///
  /// - [registerRequest]: The request object containing the user's registration
  ///   details.
  ///
  /// Returns a [Future] that resolves to a string response.
  Future<String> register({required RegisterRequest registerRequest});

  /// Initiates a forgot password process for the user.
  ///
  /// - [forgotPasswordRequest]: The request object containing the necessary
  ///   details for resetting the password.
  ///
  /// Returns a [Future] that resolves to a string response.
  Future<String> forgotPassword({
    required ForgotPasswordRequest forgotPasswordRequest,
  });

  /// Authenticates the user with the provided credentials.
  ///
  /// - [credential]: The user's credentials for authentication.
  ///
  /// Returns a [Future] that resolves to a [Token] object.
  Future<Token> authenticate({required Credential credential});

  /// Retrieves the user's profile information.
  ///
  /// Returns a [Future] that resolves to a [UserProfile] object.
  Future<UserProfile> userProfile();

  /// Updates the user's profile with the provided information.
  ///
  /// - [updatedProfile]: The updated user profile data.
  ///
  /// Returns a [Future] that resolves to the updated [UserProfile].
  Future<UserProfile> updateProfile(UserProfile updatedProfile);

  /// Retrieves the user's physicaldata.
  ///
  /// Returns a [Future] that resolves to a [UserPhysicalProfile] object.
  Future<UserPhysicalProfile?> readUserPhysicalProfile();

  /// Deletes a specific physicaldata point for the user.
  ///
  /// - [dataPointsId]: The ID of the physicaldata point to delete.
  ///
  /// Returns a [Future] that completes when the operation is done.
  Future<void> deleteUserPhysicalDataPoint({required String dataPointsId});

  /// Updates the user's physicaldata with the provided information.
  ///
  /// - [userPhysicalDataUpsert]: The physicaldata to update or insert.
  ///
  /// Returns a [Future] that resolves to the updated [UserPhysicalProfile].
  Future<UserPhysicalProfile> updateUserPhysicalData(
    UserPhysicalDataUpsert userPhysicalDataUpsert,
  );

  /// Reads the user's image gallery based on the provided tags.
  ///
  /// - [gallaryTags]: A list of tags to filter the gallery images.
  ///
  /// Returns a [Future] that resolves to a list of [FileData].
  Future<List<FileData>> readUserImageGallary(List<GallaryTag> gallaryTags);

  /// Reads the user's profile images.
  ///
  /// Returns a [Future] that resolves to a list of [FileData].
  Future<List<FileData>> readUserProfileImage();

  /// Reads the details of a specific image.
  ///
  /// - [fileData]: The file data of the image to read.
  ///
  /// Returns a [Future] that resolves to a [FileDetail] object.
  Future<FileDetail> readImage(FileData fileData);

  /// Archives the user's images with the specified IDs.
  ///
  /// - [imagesId]: A list of image IDs to archive.
  ///
  /// Returns a [Future] that resolves to an [ArchiveUserImagesResponse].
  Future<ArchiveUserImagesResponse> archiveUserImages(List<String> imagesId);

  /// Adds new images to the user's gallery.
  ///
  /// - [userImage]: The image data to add.
  ///
  /// Returns a [Future] that resolves to a list of [FileData].
  Future<List<FileData>> addUserImages(UserImage userImage);

  /// Reads food nutrition data based on a text prompt.
  ///
  /// - [prompt]: The text prompt to search for food nutrition data.
  ///
  /// Returns a [Future] that resolves to a list of [Food].
  Future<List<Food>> readFoodsNutritionsByText(String prompt);

  /// Reads food nutrition data within a specified date range.
  ///
  /// - [startDate]: The start date of the range.
  /// - [endDate]: The end date of the range.
  ///
  /// Returns a [Future] that resolves to a list of [Food].
  Future<List<Food>> readFoodsNutrition(DateTime startDate, DateTime endDate);

  /// Updates the nutrition data of a specific food item.
  ///
  /// - [food]: The food item to update.
  ///
  /// Returns a [Future] that resolves to the updated [Food].
  Future<Food> updateFoodsNutritions(Food food);

  /// Deletes food nutrition data for the specified food IDs.
  ///
  /// - [foodIds]: A list of food IDs to delete.
  ///
  /// Returns a [Future] that completes when the operation is done.
  Future<void> deleteFoodsNutritions(List<String> foodIds);

  /// Reads food nutrition data based on a voice prompt.
  ///
  /// - [prompt]: The voice prompt file details.
  /// - [userSpokenLanguage]: The language spoken by the user.
  ///
  /// Returns a [Future] that resolves to a list of [Food].
  Future<List<Food>> readFoodsNutritionsByVoice({
    required FileDetail prompt,
    required Language userSpokenLanguage,
  });

  /// Reads the fitness data from the remote API.
  ///
  /// Returns a [FitnessData] object containing the fitness-related information.
  Future<FitnessData?> readFitnessData();

  /// Reads the nutrition requirements from the remote API.
  ///
  /// Returns a [NutritionRequirements] object containing the nutritional information.
  Future<NutritionRequirements?> readNutritionRequirements();
}
