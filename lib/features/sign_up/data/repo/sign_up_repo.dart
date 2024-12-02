import 'package:omar_ahmad_advanced_concept/core/networking/api_error_handler.dart';
import 'package:omar_ahmad_advanced_concept/core/networking/api_resault.dart';
import 'package:omar_ahmad_advanced_concept/core/networking/api_service.dart';
import '../models/sign_up_request_body.dart';
import '../models/sign_up_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResault<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResault.success(response);
    } catch (errro) {
      return ApiResault.failure(ErrorHandler.handle(errro));
    }
  }
}
