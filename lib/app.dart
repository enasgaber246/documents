import 'package:flutter/material.dart';
import 'package:sanad_creation/config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/create_decoment/presentation/screens/documents_screen.dart';

class DocumentApp extends StatelessWidget {
  const DocumentApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      home: DocumentsScreen(),
    );
  }
}
