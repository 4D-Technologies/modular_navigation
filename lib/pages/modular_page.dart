part of modular_navigation;

abstract class ModularPage<TPageParameters extends PageParameters>
    extends Page<Widget> {
  final TPageParameters parameters;

  final Animation<dynamic>? animation;

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

  @override
  operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ModularPage &&
        o.parameters == parameters &&
        o.animation == animation &&
        o.runtimeType == o.runtimeType;
  }

  @override
  int get hashCode =>
      parameters.hashCode & animation.hashCode & runtimeType.hashCode;
}
