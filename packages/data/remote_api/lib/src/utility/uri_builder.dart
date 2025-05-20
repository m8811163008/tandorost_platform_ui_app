import 'package:remote_api/remote_api.dart';

class UriBuilder {
  // static final baseUri = Uri(scheme: 'http', host: '10.0.2.2', port: 8001);
  static final baseUri = Uri(scheme: 'http', host: '127.0.0.1', port: 8001);
  static final basePath = '/api/v1';
  static Uri authSendVerificationCode(VerificationType verificationType) {
    return baseUri.replace(
      path: '$basePath/auth/send_verification_code/',
      queryParameters: {'verification_type': verificationType.snakeCase},
    );
  }

  static Uri register() {
    return baseUri.replace(path: '$basePath/auth/register/');
  }

  static Uri forgotPasswrd() {
    return baseUri.replace(path: '$basePath/auth/forgot_password/');
  }

  static Uri authToken() {
    return baseUri.replace(path: '$basePath/auth/token/');
  }

  static Uri userProfile() {
    return baseUri.replace(path: '$basePath/user/user_profile/');
  }

  static Uri updateProfile() {
    return baseUri.replace(path: '$basePath/user/update_profile/');
  }

  static Uri readUserBioData() {
    return baseUri.replace(path: '$basePath/user/read_user_bio_data/');
  }

  static Uri updateUserBioData() {
    return baseUri.replace(path: '$basePath/user/update_user_bio_data/');
  }

  static Uri addUsersImages() {
    return baseUri.replace(path: '$basePath/user/add_user_images/');
  }

  static Uri readFoodsNutritionsByText() {
    return baseUri.replace(
      path: '$basePath/foods_nutrition/read_foods_nutritions_by_text/',
    );
  }

  static Uri readFoodsNutritionsByVoice() {
    return baseUri.replace(
      path: '$basePath/foods_nutrition/read_foods_nutritions_by_voice/',
    );
  }

  static Uri readFoodsNutritions(DateTime startDate, DateTime endDate) {
    return baseUri.replace(
      path: '$basePath/foods_nutrition/read_foods_nutritions/',
      queryParameters: {
        'start_date': startDate.toIso8601String(),
        'end_date': endDate.toIso8601String(),
      },
    );
  }

  static Uri updateFoodsNutritions() {
    return baseUri.replace(
      path: '$basePath/foods_nutrition/update_foods_nutritions/',
    );
  }

  static Uri deleteFoodsNutritions(List<String> foodIds) {
    return baseUri.replace(
      path: '$basePath/foods_nutrition/delete_foods_nutritions/',
      queryParameters: {'food_ids': foodIds},
    );
  }

  static Uri readNutritionRequirements() {
    return baseUri.replace(
      path: '$basePath/fitness/nutrition_requerment_data/',
    );
  }

  static Uri readFitnessData() {
    return baseUri.replace(path: '$basePath/fitness/fitness_data/');
  }

  static Uri readUserImageGallary(List<GallaryTag> gallaryTags) {
    return baseUri.replace(
      path: '$basePath/user/read_user_image_gallary/',
      queryParameters: {'tags': gallaryTags.map((e) => e.requestName).toList()},
    );
  }

  static Uri readUserProfileImage() {
    return baseUri.replace(path: '$basePath/user/read_user_image_profile/');
  }

  static Uri archiveUserImages() {
    return baseUri.replace(path: '$basePath/user/archive_user_images/');
  }

  static Uri readImage(String fileUploadPath) {
    return baseUri.replace(path: '$basePath/$fileUploadPath');
  }

  static Uri deleteUserBioData(String dataPointsId) {
    return baseUri.replace(
      path: '$basePath/user/delete_user_bio_data/',
      queryParameters: {'data_point_id': dataPointsId},
    );
  }
}
