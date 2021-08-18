part of modular_navigation;

abstract class SubModule extends BaseModule {
  final String parentRoute;
  const SubModule(this.parentRoute);

  @override
  Iterable<BaseModule> get subModules => [];
}
