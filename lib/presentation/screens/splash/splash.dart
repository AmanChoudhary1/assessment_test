part of 'splash_imports.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AssignmentAppColors.whiteColor,
      body: BlocBuilder<AppBlocBloc, AppBlocState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                (state is AppBlocInitialLoaded)
                    ? Center(
                        child: CustomText(
                                text: AssignmentAppStrings.logoText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)
                            .setText(),
                      )
                        .animate()
                        .fadeIn(duration: 1000.ms)
                        .then(delay: 600.ms)
                        .slideX(begin: -0.07, end: 0.2)
                        .then(delay: 1000.ms)
                        .slideX(end: -0.3, duration: 1200.ms)
                        .then(delay: 200.ms)
                        .fadeOut(duration: 1000.ms)
                    : Container(),
                Center(child: Images.splashImage(Assets.applogo))
                    .animate()
                    .fadeIn(duration: 3000.ms)
                    .then(delay: 1200.ms)
                    .slideX(end: -0.2, duration: 2000.ms)
                    .callback(
                        duration: 600.ms,
                        callback: (_) {
                          context.read<AppBlocBloc>().add(AppEvents());
                        })
                    .then(delay: 6500.ms)
                    .slideX(end: 0.2)
                    .then(delay: 1000.ms)
                    .scaleXY(end: 10, duration: 1000.ms)
                    .then(delay: 1000.ms)
                    .callback(callback: (_) {
                  Navigator.pushNamed(context, AppRouting.auth);
                }),
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
        },
      ),
    );
  }
}
