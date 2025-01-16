part of "app_routing_imports.dart";

class AppRouting {
  AppRouting._();
  static String initial = '/';
  static String auth = "${initial}auth";
  static String homepage = "${initial}homepage";
  static String reports = "${initial}reports";

  static final appRouting = {
    initial: (cnt) => const Splash(),
    auth: (cnt) => const AuthScreen(),
    homepage: (cnt) => Dashboard(),
    reports: (cnt) => const ReportsScreen(),
  };
}
