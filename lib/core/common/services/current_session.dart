import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_firebase_web/core/common/features/usecases/usecase.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/entities/character_entity.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/usecases/get_all_characters.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/usecases/get_character.dart';

class CurrentSession {
  CurrentSession._();
  static final CurrentSession _instance = CurrentSession._();
  factory CurrentSession() => CurrentSession._instance;
  final firestore = FirebaseFirestore.instance;

  CharacterEntity? _characterToday;
  CharacterEntity? get characterToday => _characterToday;

  List<CharacterEntity>? _listAllCharacters;
  List<CharacterEntity>? get listAllCharacters => _listAllCharacters;

  Future<CharacterEntity?> getCharacterToday() async {
    _characterToday = await Modular.get<GetCharacter>()(GetCharacterParams()).then((value) => value.fold((l) => null, (r) => r));
    return _characterToday;
  }

  Future<List<CharacterEntity>?> getAllCharacters() async {
    _listAllCharacters = await Modular.get<GetAllCharacters>()(NoParams()).then((value) => value.fold((l) => null, (r) => r));
    return _listAllCharacters;
  }
}
