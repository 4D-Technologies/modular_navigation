part of modular_navigation;

abstract class BaseModule {
  String get route;
  Iterable<ModularRoute> get routes;
  Iterable<BaseModule> get subModules;

  final FutureOr<bool> Function(
      ModularHistory route, ModularRouterDelegate delegate)? guard;

  const BaseModule(this.guard);

  bool hasRoute(String route) => routes.any((m) => m.route == route);

  ModularRoute? findRoute(String route) {
    if (!route.toLowerCase().startsWith(this.route.toLowerCase())) return null;

    var result = routes
        .cast<ModularRoute?>()
        .firstWhere((e) => e != null && e.route == route, orElse: () => null);

    if (result != null) return result;

    result = subModules
        .map((e) => e.findRoute(route))
        .firstWhere((element) => element != null, orElse: () => null);

    return result;
  }

  ModularRoute? findRouteByPageType(Type pageType) {
    var result = routes.cast<ModularRoute?>().firstWhere(
        (e) => e != null && e.isPageRoute(pageType),
        orElse: () => null);

    if (result != null) return result;

    result = subModules
        .map((e) => e.findRouteByPageType(pageType))
        .firstWhere((element) => element != null, orElse: () => null);

    return result;
  }
}
