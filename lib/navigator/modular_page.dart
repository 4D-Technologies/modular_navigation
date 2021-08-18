part of modular_navigation;

abstract class ModularPage<TPageParameters extends PageParameters>
    extends Page<Widget> {
  final TPageParameters parameters;

  final Animation? animation;

  ModularPage({
    required this.parameters,
    this.animation,
  });

  //String get route;

  Widget build(BuildContext context);

  @override
  Route<Widget> createRoute(BuildContext context) {
    final route = context.navigationHistory.last.route;

    final key = parameters is NoPageParameters
        ? ValueKey(route.route)
        : ValueKey(
            "${route.route}?${Uri(queryParameters: parameters.map).query}");

    return NoAnimationMaterialPageRoute(
      settings: this,
      maintainState: false,
      key: ValueKey<LocalKey>(key),
      builder: build,
    );
  }

  @override
  String? get restorationId => jsonEncode(parameters.map);
}
