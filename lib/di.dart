import 'package:get_it/get_it.dart';
import 'package:hoegen_fietsverhuur/data/network/backend.dart';
import 'package:hoegen_fietsverhuur/data/network/datasources/bikes_datasource.dart';
import 'package:hoegen_fietsverhuur/data/repositories/repository_impl.dart';
import 'package:hoegen_fietsverhuur/domain/repository.dart';
import 'package:hoegen_fietsverhuur/presentation/bikes/bikes_cubit.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerSingleton<BikesDataSource>(BikesDataSourceImpl());
  getIt.registerSingleton<Backend>(BackendImpl());
  getIt.registerSingleton<Repository>(RepositoryImpl(getIt()));
  getIt.registerLazySingleton<BikesCubit>(() => BikesCubit(getIt()));
}
