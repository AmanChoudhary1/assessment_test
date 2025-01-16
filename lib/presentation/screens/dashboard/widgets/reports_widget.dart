part of 'widgets_imports.dart';

Widget getReportWidget() {
  return BlocBuilder<DashboardBloc, DashboardBlocState>(
    builder: (context, state) {
      var currentState = state;
      if (currentState is DashboardBlocStateInitialLoaing) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (currentState is DashboardBlocStateInitialLoaded) {
        return (currentState.reports.isEmpty)
            ? Center(
                child: CustomText(
                        text: AssignmentAppStrings.noReports,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center)
                    .setText())
            : ListView.builder(
                itemCount: currentState.reports.length,
                itemBuilder: (cnt, index) {
                  ReportModal reportModal = currentState.reports[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 5),
                    color: AssignmentAppColors.whiteColor,
                    elevation: 5.0,
                    child: ListTile(
                      title: CustomText(
                        text: reportModal.description.toString(),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ).setText(),
                      trailing: CustomText(
                              text:
                                  "${AssignmentAppStrings.pulseLable_.toUpperCase()} : ${reportModal.pulseBpm.toString()}",
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center)
                          .setText(),
                    ),
                  );
                });
      } else {
        Center(
            child: CustomText(
                    text: AssignmentAppStrings.noReports,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center)
                .setText());
      }
      return const SizedBox();
    },
  );
}
