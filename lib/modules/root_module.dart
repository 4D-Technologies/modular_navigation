part of modular_navigation;

abstract class RootModule extends BaseModule {
  BaseModularRoute get initialRoute;
  BaseModularRoute get homeRoute;
  BaseModularRoute get notFoundRoute;

  const RootModule({
    FutureOr<bool> Function(
            ModularHistory route, ModularRouterDelegate delegate)?
        guard,
  }) : super(guard);

  @override
  String get route => "/";

  ModularLink<TPageParameters> createLink<
          TPageParameters extends PageParameters,
          TPageType extends ModularPage<TPageParameters>>({
    TPageParameters? parameters,
  }) =>
      ModularLink<TPageParameters>(
        route: findRouteByPageType(TPageType)!,
        parameters: parameters,
      );

  @override
  operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RootModule &&
        o.initialRoute == initialRoute &&
        o.homeRoute == homeRoute &&
        o.notFoundRoute == notFoundRoute &&
        o.route == route &&
        o.routes == routes &&
        o.subModules == subModules;
  }

  @override
  int get hashCode =>
      route.hashCode &
      initialRoute.hashCode &
      homeRoute.hashCode &
      notFoundRoute.hashCode &
      routes.hashCode &
      subModules.hashCode;
}
