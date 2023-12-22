import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_firebase_web/core/common/constants/app_routes.dart';
import 'package:teste_firebase_web/core/common/services/connection/connection_service.dart';
import 'package:teste_firebase_web/core/common/services/connection/internet_connection_checker_impl.dart';
import 'package:teste_firebase_web/core/common/services/connection/requests/dio_request_service.dart';
import 'package:teste_firebase_web/core/common/services/connection/requests/request_service.dart';
import 'package:teste_firebase_web/core/shared/features/characters/data/datasources/character_datasource_impl.dart';
import 'package:teste_firebase_web/core/shared/features/characters/data/repositories/character_repository_impl.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/repositories/character_repository.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/usecases/get_all_characters.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/usecases/get_character.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/usecases/is_character_today.dart';
import 'package:teste_firebase_web/modules/classic/presenter/classic_page.dart';
import 'package:teste_firebase_web/modules/home/presenter/home_page.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.child(
      AppRoutes.home,
      child: (context) => const HomePage(),
      transition: TransitionType.noTransition,
      duration: 500.ms,
    );
    r.child(
      AppRoutes.classic,
      child: (context) => const ClassicPage(),
      transition: TransitionType.noTransition,
      duration: 500.ms,
    );

    // r.module(
    //   AppRoutes.main,
    //   module: MainModule(),
    //   duration: 500.ms,
    // );
  }

  @override
  void binds(i) {
    i.addLazySingleton<ConnectionService>(InternetConnectionCheckerImpl.new);
    i.addLazySingleton<RequestService>(DioRequestService.new);
    i.addLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(
        datasource: CharacterDatasourceImpl(
          requestService: Modular.get(),
        ),
      ),
    );
    i.addLazySingleton<GetCharacter>(
      () => GetCharacter(
        repository: Modular.get(),
      ),
    );
    i.addLazySingleton<IsCharacterToday>(
      () => IsCharacterToday(
        repository: Modular.get(),
      ),
    );
    i.addLazySingleton<GetAllCharacters>(
      () => GetAllCharacters(
        repository: Modular.get(),
      ),
    );
  }
}
