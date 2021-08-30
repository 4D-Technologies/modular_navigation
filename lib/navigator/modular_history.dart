part of modular_navigation;

class ModularHistory<TPageParameters extends PageParameters,
    TModularPage extends ModularPage<TPageParameters>> {
  final BaseModularRoute route;
  final TModularPage page;
  const ModularHistory(this.route, this.page);

  Uri get uri =>
      Uri.parse(route.route).replace(queryParameters: page.parameters.map);

  @override
  operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ModularHistory && o.route == route && o.page == page;
  }

  @override
  int get hashCode => route.hashCode & page.hashCode;
}
