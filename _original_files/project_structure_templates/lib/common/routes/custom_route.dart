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
