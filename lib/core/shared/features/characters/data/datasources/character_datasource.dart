import 'package:teste_firebase_web/core/shared/features/characters/domain/entities/character_entity.dart';

abstract class CharacterDatasource {
  Future<CharacterEntity> getCharacter(int? id);
  Future<CharacterEntity> isCharacterToday(String name);
  Future<List<CharacterEntity>> getAllCharacters();
}
