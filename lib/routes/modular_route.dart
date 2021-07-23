part of modular_navigation;

class ModularRoute<TParameters extends PageParameters> {
  final String route;
  final TParameters? parameters;
  final Widget Function(BuildContext context, TParameters? parameters)
      createPage;

  ModularRoute(PageRouteMap<TParameters> routeMap, {TParameters? parameters})
      : this.route = routeMap.route,
        this.createPage = routeMap.createPage,
        this.parameters = parameters;
}
