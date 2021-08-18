part of modular_navigation;

class ModularRouteInformationParser
    extends RouteInformationParser<ModularPage> {
  final RootModule rootModule;
  final ModularRouterDelegate routerDelegate;

  ModularRouteInformationParser({
    required this.rootModule,
    required this.routerDelegate,
  });

  @override
  Future<ModularPage> parseRouteInformation(RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '/');

    final parameters =
        routeInformation.state as Map<String, String?>? ?? uri.queryParameters;

    final history = routerDelegate.history.cast<ModularHistory?>().firstWhere(
        (e) =>
            e != null &&
            e.route.route == uri.path &&
            e.page.parameters.map == parameters,
        orElse: () => null);

    if (history != null) return SynchronousFuture(history.page);

    final page = (rootModule.findRoute(uri.path) ?? rootModule.notFoundRoute)
        .createPage(parameters);

    return SynchronousFuture(page);
  }

  @override
  RouteInformation? restoreRouteInformation(ModularPage configuration) {
    final route = rootModule.findRouteByPageType(configuration.runtimeType);

    if (route == null) throw RouteNotFoundException();

    return RouteInformation(
      location: route.route,
      state: configuration.parameters.map,
    );
  }
}
