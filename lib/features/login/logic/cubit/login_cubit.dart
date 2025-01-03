import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmad_advanced_concept/core/networking/api_error_handler.dart';
import 'package:omar_ahmad_advanced_concept/features/login/data/models/login_request_body.dart';
import 'package:omar_ahmad_advanced_concept/features/login/data/repos/login_repo.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim()));
    response.when(success: (loginResponse) {
      emit(LoginState.success(loginResponse));
    }, failure: (ErrorHandler error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}
