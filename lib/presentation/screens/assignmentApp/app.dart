import 'package:assesments_app/bloc/app_bloc_bloc.dart';
import 'package:assesments_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/themes/imports.dart';
import '../../router/app_routing_imports.dart';
import '../dashboard/bloc/dashboard_bloc_bloc.dart';

class AssignmentApp extends StatelessWidget {
  const AssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBlocBloc(),
        ),
        BlocProvider(
          create: (context) =>
              DashboardBloc()..add(DashboardAppReportFetchEvents()),
        ),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return ResponsiveBreakpoints.builder(
            child: MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(0.8)),
              child: child!,
            ),
            breakpoints: [
              const Breakpoint(
                start: 0,
                end: 450,
                name: MOBILE,
              ),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          );
        },
        title: AssignmentAppStrings.appName,
        theme: AppThemes.light,
        initialRoute: AppRouting.initial,
        routes: AppRouting.appRouting,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
