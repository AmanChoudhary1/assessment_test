part of 'dashboard_imports.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final GlobalKey<FormState> addInfoKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<DashboardBloc>(context);
    Size deviceSize = Utils.getScreenSize(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AssignmentAppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AssignmentAppColors.whiteColor,
        ),
        drawer: _buildDrawerWidget(context),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _buildFormWidget(deviceSize, provider),
              const Divider(
                height: 40,
                color: AssignmentAppColors.greyColor,
                thickness: 2,
              ),
              Expanded(child: getReportWidget())
            ],
          ),
        ),
      ),
    );
  }

  _buildDrawerWidget(context) {
    return Drawer(
      backgroundColor: AssignmentAppColors.whiteColor,
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: CustomText(
                      text: AssignmentAppStrings.reports,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center)
                  .setText(),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AppRouting.reports);
              },
              tileColor: AssignmentAppColors.greyColor,
              title: CustomText(
                text: AssignmentAppStrings.reports,
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
              ).setText(),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildFormWidget(deviceSize, provider) {
    return Form(
      key: addInfoKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                          text: AssignmentAppStrings.sysLable,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500)
                      .setText(),
                  const YMargin(5),
                  CustomTextFieldWidget(
                    isVisible: true,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'cannot be empty';
                      }
                      return null;
                    },
                    controller: provider.sysTextController,
                    maxLength: 5,
                    hintText: AssignmentAppStrings.sysLable,
                    textInputFormatter: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: const TextInputType.numberWithOptions(),
                  )
                ],
              )),
              const XMargin(8.0),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                          text: AssignmentAppStrings.diaLable,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500)
                      .setText(),
                  const YMargin(5),
                  CustomTextFieldWidget(
                    isVisible: true,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'cannot be empty';
                      }
                      return null;
                    },
                    controller: provider.diaTextController,
                    maxLength: 5,
                    hintText: AssignmentAppStrings.diaLable,
                    keyboardType: const TextInputType.numberWithOptions(),
                    textInputFormatter: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  )
                ],
              ))
            ],
          ),
          const YMargin(20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                          text: AssignmentAppStrings.pulseLable,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500)
                      .setText(),
                  const YMargin(5),
                  CustomTextFieldWidget(
                    isVisible: true,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'cannot be empty';
                      }
                      return null;
                    },
                    controller: provider.pulseTextController,
                    maxLength: 5,
                    hintText: AssignmentAppStrings.pulseLable,
                    keyboardType: const TextInputType.numberWithOptions(),
                    textInputFormatter: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  )
                ],
              )),
              const XMargin(8.0),
              Expanded(
                  child: Column(
                children: [
                  const YMargin(25),
                  PrimaryButton.primarybutton(
                      isEnable: true,
                      isPrimary: true,
                      width: deviceSize.width,
                      onpressed: () async {
                        if (addInfoKey.currentState?.validate() == true) {
                          ReportModal reportModal = ReportModal(
                              sysMmHg: int.parse(
                                  provider.sysTextController.text.trim()),
                              diaMmHg: int.parse(
                                  provider.diaTextController.text.trim()),
                              pulseBpm: int.parse(
                                  provider.pulseTextController.text.trim()),
                              description:
                                  "${int.parse(provider.diaTextController.text.trim())}/${int.parse(provider.pulseTextController.text.trim())} sys/hg",
                              createdat: DateTime.now().toIso8601String(),
                              updatedat: DateTime.now().toIso8601String());
                          provider.add(DashboardAppAddReportEvents(
                              reportModal: reportModal));
                        }
                      },
                      text: AssignmentAppStrings.addLable),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}
