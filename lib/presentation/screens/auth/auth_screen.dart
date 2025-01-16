part of 'auth_imports.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = Utils.getScreenSize(context);
    return Scaffold(
        backgroundColor: AssignmentAppColors.whiteColor,
        body: _buildWidget(deviceSize, context));
  }

  _buildWidget(deviceSize, context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(child: Images.splashImage(Assets.applogo))
              .animate()
              .fadeIn(duration: 500.ms)
              .then(delay: 800.ms)
              .slideY(end: -0.2, duration: 2000.ms),
          Center(
            child: CustomText(
                    text: AssignmentAppStrings.welcomeText,
                    fontSize: 30.0,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold)
                .setText(),
          )
              .animate()
              .fade(duration: 1200.ms)
              .then(delay: 1500.ms)
              .fadeIn(duration: 1000.ms),
          Positioned(
            bottom: deviceSize.height * 0.1,
            child: PrimaryButton.primarybutton(
                    isEnable: true,
                    isPrimary: true,
                    onpressed: () {
                      Navigator.pushNamed(context, AppRouting.homepage);
                    },
                    text: AssignmentAppStrings.nextbuttontext,
                    width: deviceSize.width * 0.8)
                .animate()
                .fade(duration: 1200.ms)
                .then(delay: 1500.ms)
                .fadeIn(duration: 1000.ms),
          ),
          Positioned(
            bottom: 10,
            child: CustomText(
                    text: AssignmentAppStrings.branding,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)
                .setText(),
          )
        ],
      ),
    );
  }
}
