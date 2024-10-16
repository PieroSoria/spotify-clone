import 'package:get_it/get_it.dart';
import 'package:my_app/core/api/api_client.dart';
import 'package:my_app/core/api/api_client_repository.dart';
import 'package:my_app/core/helper/app_constants.dart';
import 'package:my_app/core/routes/app_routes.dart';
import 'package:my_app/core/routes/bloc/route_bloc.dart';
import 'package:my_app/core/themes/bloc/themes_bloc.dart';
import 'package:my_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:my_app/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:my_app/features/auth/domain/usecases/get_save_user_usecase.dart';
import 'package:my_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> injectorDependency() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<ApiClientRepository>(
    () => ApiClient(
      sharedPreferences: sharedPreferences,
      baseUrl: AppConstants.baseUrl,
    ),
  );
  //repository
  sl.registerLazySingleton<AuthRepositoryInterface>(
    () => AuthRepositoryImpl(
      apiClient: sl(),
      preferences: sharedPreferences,
    ),
  );

  //usecase
  sl.registerLazySingleton<GetSaveUserUseCase>(
    () => GetSaveUserUseCase(
      authRepositoryInterface: sl(),
    ),
  );
  //bloc
  sl.registerFactory<RouteBloc>(
    () => RouteBloc(
      sharedPreferences,
      AppRoutes.routerConfig(AuthStatus.unauthenticated),
    ),
  );
  sl.registerFactory<ThemesBloc>(
    () => ThemesBloc(),
  );
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(),
  );
}
