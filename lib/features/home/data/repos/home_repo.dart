import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_resault.dart';
import '../apis/home_api_service.dart';
import '../models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResault<SpecializationsResponseModel>> getSpecialization() async {
    try {
      final response = await _homeApiService.getSpecializationData();
      return ApiResault.success(response);
    } catch (error) {
      return ApiResault.failure(ErrorHandler.handle(error));
    }
  }
}
