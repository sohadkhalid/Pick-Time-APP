
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String phone, String password) {
    if (_isValidEmail(phone) && password.length >= 6) {
      emit(AuthSuccess());
    } else {
      emit(AuthError("Invalid email or password"));
    }
  }

  void signup(Map<String, String> data) {
    emit(AuthSuccess());
  }

  static bool _isValidEmail(String email) {
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
  }
}