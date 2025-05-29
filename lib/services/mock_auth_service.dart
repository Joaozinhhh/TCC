import 'package:src/common/models/user_model.dart';
import 'package:src/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(id: email.hashCode.toString(), email: email);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Erro ao realizar login. Verifique suas credenciais e tente novamente';
      }
      throw 'Não foi possível realizar login. Tente novamente mais tarde';
    }
  }

  @override
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(id: email.hashCode.toString(), name: name, email: email);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha insegura. Tente uma senha mais forte';
      }
      throw 'Não foi possível cadastrar o usuário. Tente novamente mais tarde';
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
