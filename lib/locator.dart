import 'package:get_it/get_it.dart';
import 'package:src/features/sign_in/sign_in_controller.dart';
import 'package:src/features/sign_up/sign_up_controller.dart';
import 'package:src/features/splash/splash_controller.dart';
import 'package:src/services/auth_service.dart';
import 'package:src/services/firebase_auth_service.dart';
import 'package:src/services/secure_storage.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());

  locator.registerFactory<SplashController>(
    () => SplashController(const SecureStorage()),
  );

  locator.registerFactory<SignInController>(
    () => SignInController(locator.get<AuthService>(), const SecureStorage()),
  );

  locator.registerFactory<SignUpController>(
    () => SignUpController(locator.get<AuthService>(), const SecureStorage()),
  );
}
