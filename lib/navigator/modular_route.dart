part of modular_navigation;

class ModularRoute<TPageParameters extends PageParameters,
    TModularPage extends ModularPage<TPageParameters>> {
  final String route;
  final TModularPage Function(Map<String, String?> parameters) createPage;

  ModularRoute({
    required this.route,
    required this.createPage,
  }) {
    assert(TPageParameters != dynamic && TPageParameters != PageParameters);
    assert(TModularPage != dynamic &&
        !(TModularPage is ModularPage<PageParameters>));
  }

  bool isPageRoute(Type pageType) => pageType == TModularPage;
}
