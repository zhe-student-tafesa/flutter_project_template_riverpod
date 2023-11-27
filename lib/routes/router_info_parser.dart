import 'package:flutter/material.dart';
import 'app_routes.dart';

class PXFRouteInformationParser extends RouteInformationParser<FZRoutePath> {
  @override
  Future<FZRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');

    /// Handle unknown routes
    return FZRoutePath.splash();
  }

  @override
  RouteInformation restoreRouteInformation(FZRoutePath path) {
    switch (path.name) {
      case "splash":
        return const RouteInformation(location: '/');
    }
    return const RouteInformation(location: '/');
  }
}
