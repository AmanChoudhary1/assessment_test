part of 'dashboard_bloc_bloc.dart';

sealed class DashboardBlocState extends Equatable {
  const DashboardBlocState();
}

final class DashboardBlocStateInitial extends DashboardBlocState {
  @override
  List<Object?> get props => [];
}

final class DashboardBlocStateInitialLoaing extends DashboardBlocState {
  @override
  List<Object?> get props => [];
}

final class DashboardBlocStateInitialLoaded extends DashboardBlocState {
  final List<ReportModal> reports;
  const DashboardBlocStateInitialLoaded({required this.reports});
  @override
  List<ReportModal> get props => reports;
}

final class DashboardBlocStateInitialError extends DashboardBlocState {
  @override
  List<Object?> get props => [];
}
