part of modular_navigation;

abstract class BaseModularRoute<TPageParameters extends PageParameters,
    TModularPage extends ModularPage<TPageParameters>> {
  final BaseModule module;
  final String _route;
  final TModularPage Function(Map<String, String?> parameters) createPage;
  final FutureOr<bool> Function(
      ModularHistory route, ModularRouterDelegate delegate)? guard;
  final bool overrideModuleGuard;

  BaseModularRoute({
    required this.module,
    required String route,
    required this.createPage,
    this.guard,
    this.overrideModuleGuard = false,
  }) : _route = combinePath(module.route, route) {
    assert(TPageParameters != dynamic && TPageParameters != PageParameters);
    assert(TModularPage != dynamic &&
        !(TModularPage is ModularPage<PageParameters>));
  }

  String get route => _route;

  bool isPageRoute(Type pageType) => pageType == TModularPage;

  @protected
  ModularPage<TPageParameters> _create({
    TPageParameters? parameters,
  }) =>
      createPage(parameters!.map);

  @protected
  ModularLink<TPageParameters> _createLink({
    TPageParameters? parameters,
  }) =>
      ModularLink<TPageParameters>(
        route: this,
        parameters: parameters!,
      );

  @protected
  void _navigate({
    required BuildContext context,
    TPageParameters? parameters,
    bool clearHistory = false,
    bool removeCurrent = false,
  }) =>
      context.routeDelegate.navigateToPage(
        _create(parameters: parameters!),
        clearHistory: clearHistory,
        removeCurrent: removeCurrent,
      );

  @override
  operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is BaseModularRoute &&
        o.route == route &&
        o.module == module &&
        o.guard == guard;
  }

  @override
  int get hashCode => route.hashCode & module.hashCode & guard.hashCode;
}
