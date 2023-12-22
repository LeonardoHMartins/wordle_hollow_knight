import 'package:dartz/dartz.dart';
import 'package:teste_firebase_web/core/common/errors/failures.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Future<Either<Failure, CharacterEntity>> getCharacter(int? id);
  Future<Either<Failure, CharacterEntity>> isCharacterToday(String name);
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters();
}
