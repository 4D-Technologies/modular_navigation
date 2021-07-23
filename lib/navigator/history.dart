part of modular_navigation;

class NavigationHistory extends Page<Widget> {
  final String route;
  final Map<String, String?>? parameters;
  final Widget page;

  NavigationHistory({
    required this.route,
    required this.parameters,
    required this.page,
  });

  @override
  Route<Widget> createRoute(BuildContext context) {
    return NoAnimationMaterialPageRoute(
      settings: this,
      maintainState: false,
      key: ValueKey<LocalKey>(key!),
      builder: (context) => page,
    );
  }
}
