import 'package:dartz/dartz.dart';
import 'package:teste_firebase_web/core/common/errors/failures.dart';
import 'package:teste_firebase_web/core/common/features/usecases/usecase.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/entities/character_entity.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/repositories/character_repository.dart';

class GetAllCharacters extends Usecase<List<CharacterEntity>, NoParams> {
  final CharacterRepository repository;

  GetAllCharacters({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(
    NoParams params,
  ) async {
    return await repository.getAllCharacters();
  }
}
