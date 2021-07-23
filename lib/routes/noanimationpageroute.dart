part of modular_navigation;

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  final ValueKey<dynamic> key;

  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    required this.key,
    bool maintainState = false,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            maintainState: maintainState,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  int get hashCode => super.hashCode ^ this.key.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is NoAnimationMaterialPageRoute && other.key == key;
  }
}
