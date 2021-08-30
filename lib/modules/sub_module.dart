part of modular_navigation;

abstract class SubModule extends BaseModule {
  final BaseModule parentModule;
  final String _path;
  final bool overrideParentGuards;

  const SubModule({
    required this.parentModule,
    required String route,
    this.overrideParentGuards = false,
    FutureOr<bool> Function(
            ModularHistory route, ModularRouterDelegate delegate)?
        guard,
  })  : _path = route,
        super(guard);

  @override
  Iterable<BaseModule> get subModules => [];

  @override
  String get route => combinePath(parentModule.route, _path);

  @override
  operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SubModule &&
        o.route == route &&
        o.routes == routes &&
        o.subModules == subModules &&
        o.parentModule == parentModule;
  }

  @override
  int get hashCode =>
      route.hashCode &
      parentModule.hashCode &
      routes.hashCode &
      subModules.hashCode;
}
