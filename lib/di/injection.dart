import 'package:dio/dio.dart';
import 'package:domain/gateways/character/character_gateway.dart';
import 'package:domain/usecases/character_usecase.dart';
import 'package:gateway/character/api_character_gateway.dart';
import 'package:gateway/constants/api_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/constants/app_constants.dart';
import 'package:usecase/character/character_usecase_impl.dart';

GetIt injection = GetIt.I;

Future setInjections() async {
  /// dio
  Dio dio = Dio();
  dio.options
    ..baseUrl = ApiConstants.baseUrl
    ..connectTimeout = ApiConstants.timeoutDurationInMilliseconds
    ..receiveTimeout = ApiConstants.timeoutDurationInMilliseconds;

  dio.interceptors.add(AppConstants.alice.getDioInterceptor());

  injection.registerLazySingleton<Dio>(() => dio);

  /// gateways

  injection.registerLazySingleton<CharacterGateway>(() => ApiCharacterGateway(dio: injection()));

  /// use cases

  injection.registerLazySingleton<CharacterUseCase>(() => CharacterUseCaseImpl(characterGateway: injection()));
}
