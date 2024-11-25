import 'package:dashboard/core/repo/image_repo/image_repo.dart';
import 'package:dashboard/core/repo/image_repo/image_repo_impl.dart';
import 'package:dashboard/core/repo/product_repo/add_product_repo.dart';
import 'package:dashboard/core/repo/product_repo/add_product_repo_impl.dart';
import 'package:dashboard/core/services/database_service.dart';
import 'package:dashboard/core/services/firebase_storage_services.dart';
import 'package:dashboard/core/services/firestore_service.dart';
import 'package:dashboard/core/services/storage_service.dart';
import 'package:dashboard/features/add_product/presentation/controller/cubit/add_product_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Auth
  sl.registerLazySingleton<AddProductCubit>(() => AddProductCubit(sl(), sl()));

  sl.registerLazySingleton<DatabaseService>(() => FirestoreService());

  sl.registerLazySingleton<StorageService>(() => sl());
  sl.registerLazySingleton<SupabaseStorageServices>(
      () => SupabaseStorageServices());
  sl.registerLazySingleton<AddProductRepo>(
      () => AddProductRepoImpl(databaseService: sl()));
  sl.registerLazySingleton<ImageRepo>(
      () => ImageRepoImpl(storageService: sl()));
}
