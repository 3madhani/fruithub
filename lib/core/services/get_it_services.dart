import 'package:get_it/get_it.dart';

import '../../feature/account/data/repos/user_info_repo_impl.dart';
import '../../feature/account/domain/repos/user_info_repo.dart';
import '../../feature/account/presentation/manager/user_info/user_info_cubit.dart';
import '../../feature/auth/data/repos/auth_repo_impl.dart';
import '../../feature/auth/domain/repos/auth_repo.dart';
import '../../feature/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import '../../feature/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import '../cubits/cubit/add_favorite_cubit.dart';
import '../repos/favourite_repo/favorite_repo.dart';
import '../repos/favourite_repo/favorite_repo_impl.dart';
import '../repos/images_repo/images_repo.dart';
import '../repos/images_repo/images_repo_impl.dart';
import '../repos/orders_repo/orders_repo.dart';
import '../repos/orders_repo/orders_repo_impl.dart';
import '../repos/product_repo/product_repo.dart';
import '../repos/product_repo/product_repo_impl.dart';
import 'database_services.dart';
import 'fire_storage.dart';
import 'firebase_auth_service.dart';
import 'firestore_services.dart';
import 'storage_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Register FirebaseAuthService as a singleton
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<StorageServices>(FireStorage());
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(storageServices: getIt<StorageServices>()),
  );
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

  getIt.registerSingleton<UserInfoRepo>(
    UserInfoRepoImpl(databaseServices: getIt<DatabaseServices>()),
  );

  getIt.registerSingleton<FavouritesRepo>(
    FavouritesRepoImpl(databaseServices: getIt<DatabaseServices>()),
  );

  // Register Cubits as singletons
  getIt.registerLazySingleton<AddFavoriteCubit>(
    () => AddFavoriteCubit(getIt<FavouritesRepo>()),
  );
  getIt.registerLazySingleton<UserInfoCubit>(
    () => UserInfoCubit(getIt<UserInfoRepo>()),
  );
  // Register Cubits as singletons
  getIt.registerLazySingleton<CartCubit>(() => CartCubit());

  getIt.registerLazySingleton<CartItemCubit>(() => CartItemCubit());
}
