import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/entities/character_entity.dart';
import 'package:teste_firebase_web/main.dart';

part 'classic_state.dart';

class ClassicCubit extends Cubit<ClassicState> {
  ClassicCubit() : super(ClassicInitial());

  List<CharacterEntity> characters = [];
  List<CharacterEntity> charactersFiltered = [];

  CharacterEntity? characterToday;

  CharacterEntity? selected;

  void init() async {
    characterToday = await session.getCharacterToday();
    characters = await session.getAllCharacters() ?? [];
  }

  Future<void> isCharacterToday(CharacterEntity character) async {
    if (character.name == characterToday?.name) {
      emit(ClassicSuccess());
    } else {
      characters.add(character);
    }
  }

  void searchCharacter(String nome) {
  if (nome.isEmpty || nome == '') {
      charactersFiltered = characters;
      return;
    }
    charactersFiltered = characters.where((element) => (element.name.toLowerCase().contains(nome.toLowerCase()))).toList();
  }
}
