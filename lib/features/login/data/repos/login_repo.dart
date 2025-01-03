import 'package:omar_ahmad_advanced_concept/core/networking/api_error_handler.dart';
import 'package:omar_ahmad_advanced_concept/core/networking/api_resault.dart';
import 'package:omar_ahmad_advanced_concept/core/networking/api_service.dart';
import 'package:omar_ahmad_advanced_concept/features/login/data/models/login_request_body.dart';
import 'package:omar_ahmad_advanced_concept/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService apiService;
  LoginRepo(this.apiService);
  Future<ApiResault<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await apiService.login(loginRequestBody);
      return ApiResault.success(response);
    } catch (error) {
      return ApiResault.failure(ErrorHandler.handle(error));
    }
  }
}
