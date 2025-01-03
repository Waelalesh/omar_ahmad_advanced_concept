import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:omar_ahmad_advanced_concept/core/networking/api_error_handler.dart';

part 'api_resault.freezed.dart';

@Freezed()
abstract class ApiResault<T> with _$ApiResault<T> {
  const factory ApiResault.success(T data) = Success<T>;
  const factory ApiResault.failure(ErrorHandler errorHandler) = Failure<T>;
}
