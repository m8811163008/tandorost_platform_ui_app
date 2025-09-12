import 'package:remote_api/remote_api.dart';

class UriBuilder {
  // static final baseUri = Uri(scheme: 'https', host: 'tandorost-a.ir');
  static final baseUri = Uri(scheme: 'http', host: '10.105.146.85', port: 8001);
  // static final baseUri = Uri(
  //   scheme: 'http',
  //   host: '10.105.146.237',
  //   port: 8001,
  // );
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

  static Uri logout() {
    return baseUri.replace(path: '$basePath/auth/logout/');
  }

  static Uri userProfile() {
    return baseUri.replace(path: '$basePath/user/user_profile/');
  }

  static Uri updateProfile() {
    return baseUri.replace(path: '$basePath/user/update_profile/');
  }

  static Uri readUserPhysicalData() {
    return baseUri.replace(path: '$basePath/user/read_user_physical_data/');
  }

  static Uri updateUserPhysicalData() {
    return baseUri.replace(path: '$basePath/user/update_user_physical_data/');
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

  static Uri readFoodsNutritions(DateTime date1, DateTime date2) {
    return baseUri.replace(
      path: '$basePath/foods_nutrition/read_foods_nutritions/',
      queryParameters: {
        'date_1': date1.toIso8601String(),
        'date_2': date2.toIso8601String(),
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

  static Uri deleteUserPhysicalData(String dataPointsId) {
    return baseUri.replace(
      path: '$basePath/user/delete_user_physical_data/',
      queryParameters: {'data_point_id': dataPointsId},
    );
  }

  static Uri readSubscriptions() {
    return baseUri.replace(path: '$basePath/payment/read_subscriptions/');
  }

  static Uri readCoffeBazzarPayment() {
    return baseUri.replace(path: '$basePath/payment/cafe_bazzar_payment_info/');
  }

  static Uri createSubscriptionPayment() {
    return baseUri.replace(
      path: '$basePath/payment/create_subscription_payment/',
    );
  }

  static Uri readUserFoodCount() {
    return baseUri.replace(path: '$basePath/payment/read_user_food_count/');
  }

  static Uri readCoachProfile() {
    return baseUri.replace(path: '$basePath/coach/coach_profile/');
  }

  static Uri updateCoachProfile() {
    return baseUri.replace(path: '$basePath/coach/update_coach_profile/');
  }

  static Uri upsertCoachProgram() {
    return baseUri.replace(path: '$basePath/coach/upsert_coach_program/');
  }

  static Uri deleteCoachProgram(String programId) {
    return baseUri.replace(
      path: '$basePath/coach/delete_coach_program/',
      queryParameters: {'program_id': programId},
    );
  }

  static Uri readCoachPrograms() {
    return baseUri.replace(path: '$basePath/coach/read_coach_programs/');
  }

  static Uri readCoaches() {
    return baseUri.replace(path: '$basePath/coach/read_coaches/');
  }

  static Uri readCoachesProfile() {
    return baseUri.replace(path: '$basePath/coach/read_coaches_profile/');
  }

  static Uri readCoachProgramsByCoachId(String coachId) {
    return baseUri.replace(
      path: '$basePath/coach/read_coach_programs_by_coach_id/',
      queryParameters: {'coach_id': coachId},
    );
  }

  static Uri readCoachImages(String coachId) {
    return baseUri.replace(
      path: '$basePath/coach/read_coach_images/',
      queryParameters: {'coach_id': coachId},
    );
  }
}
