import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../features/create_decoment/presentation/screens/create_documents_screen.dart';
import '../../features/create_decoment/presentation/screens/documents_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String createDocumentRoute = '/createDocument';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return  DocumentsScreen();
        });

      case Routes.createDocumentRoute:
        return MaterialPageRoute(builder: ((context) {
          return  CreateDocumentScreen();
        }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        )));
  }
}