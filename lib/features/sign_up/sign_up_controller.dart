import 'package:flutter/foundation.dart';
import 'package:src/features/sign_up/sign_up_state.dart';
import 'package:src/services/auth_service.dart';
import 'package:src/services/secure_storage.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;
  final SecureStorage _secureStorage;

  SignUpController(this._service, this._secureStorage);

  SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    _changeState(SignUpLoadingState());

    try {
      final user = await _service.signUp(
        name: name,
        email: email,
        password: password,
      );
      if (user.id != null) {
        await _secureStorage.write(key: "CURRENT_USER", value: user.toJson());

        _changeState(SignUpSuccessState());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}
