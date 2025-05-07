import 'package:fruithub/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:fruithub/feature/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import 'firebase_auth_service.dart';

final getIt = GetIt.instance;

void setup() {
  // Register FirebaseAuthService as a singleton
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()),
  );
}
