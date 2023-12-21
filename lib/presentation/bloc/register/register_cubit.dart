import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:forms_app/infrastructure/input/input.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Subit Submit: $state');
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    final password = state.password;
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([username, password])
      )
    );
  }

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
      )
    );
  }

  void passwordChanged(String value) {
    final username = state.username;
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([username, password])
      )
    );
  }
}
