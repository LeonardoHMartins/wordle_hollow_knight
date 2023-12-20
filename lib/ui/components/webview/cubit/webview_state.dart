part of 'webview_cubit.dart';

sealed class WebviewState extends Equatable {
  const WebviewState();

  @override
  List<Object> get props => [];
}

final class WebviewInitial extends WebviewState {}

final class WebviewLoading extends WebviewState {}

final class WebviewLoaded extends WebviewState {}
