import 'package:dio/dio.dart';
import 'package:omar_ahmad_advanced_concept/core/networking/api_constants.dart';
import 'package:omar_ahmad_advanced_concept/features/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/login/data/models/login_request_body.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
}
