import 'package:ai_device_app/routes/pages.dart';
import 'package:flutter/material.dart';

class RouteObservers<R extends Route<dynamic>> extends RouteObserver<R> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    var name = route.settings.name ?? '';
    if (name.isNotEmpty) RoutePages.history.add(name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    RoutePages.history.remove(route.settings.name);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      var index = RoutePages.history.indexWhere((element) {
        return element == oldRoute?.settings.name;
      });
      var name = newRoute.settings.name ?? '';
      if (name.isNotEmpty) {
        if (index > 0) {
          RoutePages.history[index] = name;
        } else {
          RoutePages.history.add(name);
        }
      }
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    RoutePages.history.remove(route.settings.name);
  }
}
