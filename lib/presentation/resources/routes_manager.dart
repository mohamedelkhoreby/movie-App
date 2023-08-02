import 'package:flutter/material.dart';
import 'package:movie/presentation/resources/strings_manager.dart';

import '../../app/dependency_injection.dart';
import '../main/main_view.dart';

class Routes {
  static const String mainRoute = '/';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.noRouteFound),
            ),
            body: const Center(child: Text(AppStrings.noRouteFound))));
  }
}
