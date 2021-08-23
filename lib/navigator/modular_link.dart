part of modular_navigation;

class ModularLink<TPageParameters extends PageParameters> {
  final ModularRoute<TPageParameters, ModularPage<TPageParameters>> route;
  final TPageParameters? parameters;
  const ModularLink({
    required this.route,
    this.parameters,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModularLink<TPageParameters> &&
        other.route == route &&
        other.parameters == parameters;
  }

  @override
  int get hashCode => route.hashCode ^ parameters.hashCode;
}
