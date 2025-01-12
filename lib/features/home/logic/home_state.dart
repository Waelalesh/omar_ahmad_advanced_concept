import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:omar_ahmad_advanced_concept/core/networking/api_error_handler.dart';
import 'package:omar_ahmad_advanced_concept/features/home/data/models/specializations_response_model.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  //Specialization
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccessful(
      SpecializationsResponseModel model) = SpecializationSuccessful;
  const factory HomeState.specializationError(ErrorHandler errorHandler) =
      SpecializationError;
}
