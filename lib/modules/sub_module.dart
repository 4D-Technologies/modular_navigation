part of modular_navigation;

abstract class SubModule extends BaseModule {
  final BaseModule parentModule;
  const SubModule({
    required this.parentModule,
    FutureOr<bool> Function(
            ModularHistory route, ModularRouterDelegate delegate)?
        guard,
  }) : super(guard);

  @override
  Iterable<BaseModule> get subModules => [];
}
