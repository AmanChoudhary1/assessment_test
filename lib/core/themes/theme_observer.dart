part of 'imports.dart';

class ThemeObserver extends WidgetsBindingObserver {
  @override
  void didChangePlatformBrightness() {
    final Brightness brightness =
        // ignore: deprecated_member_use
        WidgetsBinding.instance.window.platformBrightness;
    final isDarkTheme = brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: isDarkTheme
            ? Colors.black12.withOpacity(0.0)
            : Colors.black12.withOpacity(0.0),
      ),
    );
  }
}
