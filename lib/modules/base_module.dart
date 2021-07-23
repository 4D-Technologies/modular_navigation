part of modular_navigation;

abstract class BaseModule {
  String get route;
  Iterable<PageRouteMap> get routeMap;
  Iterable<BaseModule> get subModules;

  bool hasRoute(String route) => routeMap.any((m) => m.route == route);
}
