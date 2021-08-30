part of modular_navigation;

class ModularLink<TPageParameters extends PageParameters> {
  final BaseModularRoute<TPageParameters, ModularPage<TPageParameters>> route;
  final TPageParameters? parameters;
  const ModularLink({
    required this.route,
    this.parameters,
  });

  void navigate(
    BuildContext context, {
    bool clearHistory = false,
    bool removeCurrent = false,
  }) {
    context.routeDelegate.navigateToLink(
      this,
      clearHistory: clearHistory,
      removeCurrent: removeCurrent,
    );
  }

  Uri get uri => Uri.parse(route.route).replace(
        queryParameters: (parameters ?? NoPageParameters()).map,
      );

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
