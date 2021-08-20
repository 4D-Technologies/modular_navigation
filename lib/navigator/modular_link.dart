part of modular_navigation;

class ModularLink<TPageParameters extends PageParameters> {
  final ModularRoute<TPageParameters, ModularPage<TPageParameters>> route;
  final TPageParameters? parameters;
  const ModularLink({
    required this.route,
    this.parameters,
  });
}
