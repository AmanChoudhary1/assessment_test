part of 'dashboard_imports.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AssignmentAppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AssignmentAppColors.whiteColor,
        centerTitle: true,
        title: CustomText(
                text: AssignmentAppStrings.reports.toUpperCase(),
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center)
            .setText(),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: getReportWidget()),
    );
  }
}
