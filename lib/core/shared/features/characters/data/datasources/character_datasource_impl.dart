import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teste_firebase_web/core/common/errors/exceptions.dart';
import 'package:teste_firebase_web/core/common/services/connection/requests/request_service.dart';
import 'package:teste_firebase_web/core/shared/features/characters/data/datasources/character_datasource.dart';
import 'package:teste_firebase_web/core/shared/features/characters/data/models/character_model.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/entities/character_entity.dart';

class CharacterDatasourceImpl extends CharacterDatasource {
  final RequestService requestService;
  final firestore = FirebaseFirestore.instance;

  CharacterDatasourceImpl({
    required this.requestService,
  });

  @override
  Future<CharacterEntity> getCharacter(int? id) async {
    try {
      CharacterEntity? characters;
      // await firestore.collection('users').add({'teste': 'alou'}).then((document) {
      await firestore.collection('personagem').where('nome', isEqualTo: 'Iselda').get().then((document) {
        // print('Registro criado com sucesso: ${document.docs.first.data()}');
        characters = CharacterModel.fromMap(document.docs.first.data());
        // characters = document.docs.map((doc) => CharacterModel.fromMap(doc.data())).toList();
      }).catchError((error) {
        print('Erro ao criar registro: ${error.message}');
      });
      if (characters != null) {
        return characters!;
      } else {
        throw ServerException(message: 'Endpoint de buscar personagem não encontrou o personagem');
      }
    } catch (e) {
      throw ServerException(message: 'Endpoint de cancelar OS não retornou sucesso');
    }
  }

  @override
  Future<CharacterEntity> isCharacterToday(String name) async {
    try {
      CharacterModel? character;
      await firestore.collection('personagem').where('nome', isEqualTo: name).get().then((document) {
        character = CharacterModel.fromMap(document.docs.first.data());
      }).catchError((error) {
        print('Erro ao criar registro: ${error.message}');
      });
      if (character != null) {
        return character!;
      } else {
        throw ServerException(message: 'Endpoint de buscar personagem não encontrou o personagem');
      }
    } catch (e) {
      throw ServerException(message: 'Endpoint de cancelar OS não retornou sucesso');
    }
  }

  @override
  Future<List<CharacterEntity>> getAllCharacters() async {
    try {
      List<CharacterModel> charactersList = [];
      await firestore.collection('personagem').get().then((document) {
        charactersList = document.docs.map((e) => CharacterModel.fromMap(e.data())).toList();
      }).catchError((error) {
        print('Erro ao criar registro: ${error.message}');
      });
      return charactersList;
    } catch (e) {
      throw ServerException(message: 'Endpoint de cancelar OS não retornou sucesso');
    }
  }
}
