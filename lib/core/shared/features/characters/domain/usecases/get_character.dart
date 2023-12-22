import 'package:dartz/dartz.dart';
import 'package:teste_firebase_web/core/common/errors/failures.dart';
import 'package:teste_firebase_web/core/common/features/usecases/usecase.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/entities/character_entity.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/repositories/character_repository.dart';

class GetCharacter extends Usecase<CharacterEntity, GetCharacterParams> {
  final CharacterRepository repository;

  GetCharacter({
    required this.repository,
  });

  @override
  Future<Either<Failure, CharacterEntity>> call(
    GetCharacterParams params,
  ) async {
    return await repository.getCharacter(params.id);
  }
}

class GetCharacterParams {
  final int? id;
  GetCharacterParams({
    this.id,
  });
}
