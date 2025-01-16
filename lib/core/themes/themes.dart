part of 'imports.dart';

class AppThemes {
  AppThemes();
  static final light = ThemeData(
    colorScheme:
        ColorScheme.fromSeed(seedColor: AssignmentAppColors.primaryColor),
    useMaterial3: true,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
}
