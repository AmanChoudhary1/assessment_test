part of 'app_bloc_bloc.dart';

sealed class AppBlocState extends Equatable {
  const AppBlocState();
}

final class AppBlocInitial extends AppBlocState {
  @override
  List<Object?> get props => [];
}

final class AppBlocInitialLoaded extends AppBlocState {
  @override
  List<Object?> get props => [];
}
