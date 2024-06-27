import 'package:get_it/get_it.dart';
import 'package:my_practice_project/features/language/presentation/bloc/language/language_cubit.dart';
import 'package:my_practice_project/features/nav/presentation/bloc/navigation_cubit.dart';
import 'package:my_practice_project/services/storage.dart';
import 'package:my_practice_project/utility/navigation.dart';
import 'package:my_practice_project/utility/utility.dart';
import 'package:my_practice_project/widgets/theme.dart';

var getIt = GetIt.instance;

void locator() {
  //services
  getIt.registerLazySingleton(() => Storage());
  getIt.registerLazySingleton(() => Utility());
  getIt.registerLazySingleton(() => Navigation());
  getIt.registerLazySingleton(() => AppTheme());

  //language
  getIt.registerLazySingleton(() => LanguageCubit(getIt.call()));

  //Navigation
  getIt.registerLazySingleton(() => NavigationCubit());
}
