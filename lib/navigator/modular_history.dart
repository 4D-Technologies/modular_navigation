part of modular_navigation;

class ModularHistory<TPageParameters extends PageParameters,
    TModularPage extends ModularPage<TPageParameters>> {
  final ModularRoute route;
  final TModularPage page;
  const ModularHistory(this.route, this.page);

  Uri get uri =>
      Uri.parse(route.route).replace(queryParameters: page.parameters.map);
}
