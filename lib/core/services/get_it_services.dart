import 'package:fruithub/core/repos/product_repo/product_repo.dart';
import 'package:fruithub/core/services/database_services.dart';
import 'package:fruithub/core/services/firestore_services.dart';
import 'package:fruithub/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:fruithub/feature/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../repos/product_repo/product_repo_impl.dart';
import 'firebase_auth_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Register FirebaseAuthService as a singleton
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseServices: getIt<DatabaseServices>(),
    ),
  );

  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(databaseServices: getIt<DatabaseServices>()),
  );
}
