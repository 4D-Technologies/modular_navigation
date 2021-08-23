part of modular_navigation;

class ModularRoute<TPageParameters extends PageParameters,
    TModularPage extends ModularPage<TPageParameters>> {
  final BaseModule module;
  final String _route;
  final TModularPage Function(Map<String, String?> parameters) createPage;
  final FutureOr<bool> Function(
      ModularHistory route, ModularRouterDelegate delegate)? guard;

  ModularRoute({
    required this.module,
    required String route,
    required this.createPage,
    this.guard,
  }) : _route = combinePath(module.route, route) {
    assert(TPageParameters != dynamic && TPageParameters != PageParameters);
    assert(TModularPage != dynamic &&
        !(TModularPage is ModularPage<PageParameters>));
  }

  String get route => _route;

  bool isPageRoute(Type pageType) => pageType == TModularPage;

  ModularPage<TPageParameters> create({
    TPageParameters? parameters,
  }) =>
      createPage(parameters!.map);

  ModularLink createLink({
    TPageParameters? parameters,
  }) =>
      ModularLink(
        route: this,
        parameters: parameters!,
      );

  void navigate({
    required BuildContext context,
    TPageParameters? parameters,
    bool clearHistory = false,
    bool removeCurrent = false,
  }) =>
      context.routeDelegate.navigateToPage(
        create(parameters: parameters!),
        clearHistory: clearHistory,
        removeCurrent: removeCurrent,
      );

  @override
  operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ModularRoute &&
        o.route == route &&
        o.module == module &&
        o.guard == guard;
  }

  @override
  int get hashCode => route.hashCode & module.hashCode & guard.hashCode;
}
