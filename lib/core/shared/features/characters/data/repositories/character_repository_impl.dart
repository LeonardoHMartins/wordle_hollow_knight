import 'package:dartz/dartz.dart';
import 'package:teste_firebase_web/core/common/errors/failures.dart';
import 'package:teste_firebase_web/core/common/services/treater/treater_service.dart';
import 'package:teste_firebase_web/core/shared/features/characters/data/datasources/character_datasource.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/entities/character_entity.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterDatasource datasource;

  CharacterRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, CharacterEntity>> getCharacter(int? id) async {
    return TreaterService()<CharacterEntity>(
      () async {
        return await datasource.getCharacter(id);
      },
      errorIdentification: 'Erro ao receber personagem de hoje',
    );
  }

  @override
  Future<Either<Failure, CharacterEntity>> isCharacterToday(String name) async {
    return TreaterService()<CharacterEntity>(
      () async {
        return await datasource.isCharacterToday(name);
      },
      errorIdentification: 'Erro ao tentar personagem de hoje',
    );
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters() async {
    return TreaterService()<List<CharacterEntity>>(
      () async {
        return await datasource.getAllCharacters();
      },
      errorIdentification: 'Erro ao tentar pegar todos os personagens',
    );
  }
}
