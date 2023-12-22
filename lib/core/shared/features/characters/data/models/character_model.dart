// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:teste_firebase_web/core/shared/features/characters/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required super.name,
    required super.gender,
    required super.location,
  });

  CharacterModel copyWith({
    String? name,
    String? gender,
    String? location,
  }) {
    return CharacterModel(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': gender,
      'location': location,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      name: map['nome'] as String,
      gender: map['genero'] as String,
      location: map['localidade'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) => CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CharacterModel(name: $name, gender: $gender, location: $location)';

  @override
  bool operator ==(covariant CharacterModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.gender == gender && other.location == location;
  }

  @override
  int get hashCode => name.hashCode ^ gender.hashCode ^ location.hashCode;
}
