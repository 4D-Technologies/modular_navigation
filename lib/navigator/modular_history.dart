part of modular_navigation;

class ModularHistory<TPageParameters extends PageParameters,
    TModularPage extends ModularPage<TPageParameters>> {
  final ModularRoute route;
  final TModularPage page;
  const ModularHistory(this.route, this.page);
}
