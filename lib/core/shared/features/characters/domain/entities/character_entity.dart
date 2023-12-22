import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CharacterEntity extends Equatable {
  final String name;
  final String gender;
  final String location;
  const CharacterEntity({
    required this.name,
    required this.gender,
    required this.location,
  });

  @override
  List<Object> get props => [name, gender, location];
}
