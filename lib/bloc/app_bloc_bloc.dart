import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'app_bloc_event.dart';
part 'app_bloc_state.dart';

class AppBlocBloc extends Bloc<AppBlocEvent, AppBlocState> {
  AppBlocBloc() : super(AppBlocInitial()) {
    on<AppEvents>(onAppInit);
  }

  onAppInit(AppEvents events, Emitter emit) async {
    emit(AppBlocInitialLoaded());
  }
}
