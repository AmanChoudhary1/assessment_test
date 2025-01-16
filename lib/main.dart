import 'package:assesments_app/presentation/screens/assignmentApp/app.dart';
import 'package:flutter/material.dart';
import 'core/themes/imports.dart';
import 'utils/systemorientationUtils/system_orientation_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeObserver().didChangePlatformBrightness();
  SystemOrientation.setSystemOrientation();
  runApp(const AssignmentApp());
}
