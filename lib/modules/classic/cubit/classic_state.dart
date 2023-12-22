part of 'classic_cubit.dart';

sealed class ClassicState extends Equatable {
  const ClassicState();

  @override
  List<Object> get props => [];
}

final class ClassicInitial extends ClassicState {}

final class ClassicSuccess extends ClassicState {}

final class ClassicLoading extends ClassicState {}

final class ClassicError extends ClassicState {}
