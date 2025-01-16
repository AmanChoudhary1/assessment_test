import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/data_sources/local/database_helper.dart';
import '../../../../data/data_sources/local/models/reportmodal.dart';
part 'dashboard_bloc_event.dart';
part 'dashboard_bloc_state.dart';

class DashboardBloc extends Bloc<DashboardAppBlocEvent, DashboardBlocState> {
  final TextEditingController sysTextController = TextEditingController();
  final TextEditingController diaTextController = TextEditingController();
  final TextEditingController pulseTextController = TextEditingController();

  DashboardBloc() : super(DashboardBlocStateInitial()) {
    on<DashboardAppClearEvents>(onClear);
    on<DashboardAppAddReportEvents>(onaddInfo);
    on<DashboardAppReportFetchEvents>(onfetchReports);
  }

  onfetchReports(DashboardAppReportFetchEvents event, Emitter emit) async {
    List<ReportModal> reports = await DatabaseHelper.instance.getReports();
    emit(DashboardBlocStateInitialLoaded(reports: reports));
  }

  onaddInfo(DashboardAppAddReportEvents events, Emitter emit) async {
    emit(DashboardBlocStateInitialLoaing());
    await DatabaseHelper.instance.insertReport(events.reportModal.toJson());
    List<ReportModal> reports = await DatabaseHelper.instance.getReports();
    emit(DashboardBlocStateInitialLoaded(reports: reports));
    add(DashboardAppClearEvents());
  }

  onClear(DashboardAppClearEvents events, Emitter emit) async {
    sysTextController.clear();
    diaTextController.clear();
    pulseTextController.clear();
  }
}
