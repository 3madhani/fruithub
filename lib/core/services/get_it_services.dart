import 'package:get_it/get_it.dart';

import '../../feature/auth/data/repos/auth_repo_impl.dart';
import '../../feature/auth/domain/repos/auth_repo.dart';
import '../repos/orders_repo/orders_repo.dart';
import '../repos/orders_repo/orders_repo_impl.dart';
import '../repos/product_repo/product_repo.dart';
import '../repos/product_repo/product_repo_impl.dart';
import 'database_services.dart';
import 'firebase_auth_service.dart';
import 'firestore_services.dart';

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

  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(databaseServices: getIt<DatabaseServices>()),
  );
}
