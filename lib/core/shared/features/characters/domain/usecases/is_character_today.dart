import 'package:dartz/dartz.dart';
import 'package:teste_firebase_web/core/common/errors/failures.dart';
import 'package:teste_firebase_web/core/common/features/usecases/usecase.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/entities/character_entity.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/repositories/character_repository.dart';

class IsCharacterToday extends Usecase<CharacterEntity, IsCharacterTodayParams> {
  final CharacterRepository repository;

  IsCharacterToday({
    required this.repository,
  });

  @override
  Future<Either<Failure, CharacterEntity>> call(
    IsCharacterTodayParams params,
  ) async {
    return await repository.isCharacterToday(params.name);
  }
}

class IsCharacterTodayParams {
  final String name;
  IsCharacterTodayParams({
    required this.name,
  });
}
