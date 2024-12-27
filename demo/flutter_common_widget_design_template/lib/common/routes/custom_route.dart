import 'package:flutter/material.dart';

enum RouteDefination {
  main,
}

extension Named on RouteDefination {
  String getName() {
    switch (this) {
      case RouteDefination.main:
        return '/';
      default:
    }
    return '/';
  }
}

class AppRoute {
  BuildContext? _applicationContext;
  Size getSize() {
    if (_applicationContext != null) {
      return MediaQuery.of(_applicationContext!).size;
    }
    return Size.zero;
  }

  Widget makeScreen(BuildContext context, Widget child) {
    _applicationContext = context;
    return child;
  }
}

final globalAppRoute = AppRoute();
