import 'package:cloud_firestore/cloud_firestore.dart';

class CurrentSession {
  CurrentSession._();
  static final CurrentSession _instance = CurrentSession._();
  factory CurrentSession() => CurrentSession._instance;

  List<Map<String, dynamic>>? _personagens;
  List<Map<String, dynamic>>? get personagens => _personagens;
  final firestore = FirebaseFirestore.instance;

  Future<void> getPersonagens() async {
    // await firestore.collection('users').add({'teste': 'alou'}).then((document) {
    await firestore.collection('personagem').get().then((document) {
      // print('Registro criado com sucesso: ${document.docs.first.data()}');
      _personagens = document.docs.map((doc) => doc.data()).toList();
      for (var doc in document.docs) {
        print(doc.data());
      }
    }).catchError((error) {
      print('Erro ao criar registro: ${error.message}');
    });
  }
}
