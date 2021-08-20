part of modular_navigation;

abstract class SubModule extends BaseModule {
  final BaseModule parentModule;
  final String _path;
  const SubModule({
    required this.parentModule,
    required String route,
    FutureOr<bool> Function(
            ModularHistory route, ModularRouterDelegate delegate)?
        guard,
  })  : _path = route,
        super(guard);

  @override
  Iterable<BaseModule> get subModules => [];

  @override
  String get route => combinePath(parentModule.route, _path);
}
