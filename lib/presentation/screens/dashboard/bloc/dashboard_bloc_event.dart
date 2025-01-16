part of 'dashboard_bloc_bloc.dart';

abstract class DashboardAppBlocEvent extends Equatable {}

class DashboardAppEvents extends DashboardAppBlocEvent {
  @override
  List<Object?> get props => [];
}

class DashboardAppClearEvents extends DashboardAppBlocEvent {
  @override
  List<Object?> get props => [];
}

class DashboardAppReportFetchEvents extends DashboardAppBlocEvent {
  @override
  List<Object?> get props => [];
}

class DashboardAppAddReportEvents extends DashboardAppBlocEvent {
  final ReportModal reportModal;
  DashboardAppAddReportEvents({required this.reportModal});

  @override
  List<Object?> get props => [reportModal];
}
