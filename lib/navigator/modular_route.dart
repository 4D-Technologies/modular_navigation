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
  }) : _route = module.route + route {
    assert(TPageParameters != dynamic && TPageParameters != PageParameters);
    assert(TModularPage != dynamic &&
        !(TModularPage is ModularPage<PageParameters>));
  }

  String get route => _route;

  bool isPageRoute(Type pageType) => pageType == TModularPage;
}
