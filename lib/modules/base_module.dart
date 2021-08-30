part of modular_navigation;

abstract class BaseModule {
  String get route;

  Iterable<BaseModularRoute> get routes;
  Iterable<BaseModule> get subModules;

  final FutureOr<bool> Function(
      ModularHistory route, ModularRouterDelegate delegate)? guard;

  const BaseModule(this.guard);

  bool hasRoute(String route) => routes.any((m) => m.route == route);

  BaseModularRoute? findRoute(String route) {
    if (!route.toLowerCase().startsWith(this.route.toLowerCase())) return null;

    var result = routes
        .cast<BaseModularRoute?>()
        .firstWhere((e) => e != null && e.route == route, orElse: () => null);

    if (result != null) return result;

    result = subModules
        .map((e) => e.findRoute(route))
        .firstWhere((element) => element != null, orElse: () => null);

    return result;
  }

  BaseModularRoute<TPageParameters, ModularPage<TPageParameters>>?
      findRouteByPageType<TPageParameters extends PageParameters>(
          Type pageType) {
    var result = routes.cast<BaseModularRoute?>().firstWhere(
        (e) => e != null && e.isPageRoute(pageType),
        orElse: () => null);

    if (result != null)
      return result
          as BaseModularRoute<TPageParameters, ModularPage<TPageParameters>>;

    result = subModules
        .map((e) => e.findRouteByPageType(pageType))
        .firstWhere((element) => element != null, orElse: () => null);

    return result
        as BaseModularRoute<TPageParameters, ModularPage<TPageParameters>>?;
  }
}
