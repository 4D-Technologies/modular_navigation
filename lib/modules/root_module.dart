part of modular_navigation;

abstract class RootModule extends BaseModule {
  ModularRoute get initialRoute;
  ModularRoute get homeRoute;
  ModularRoute get notFoundRoute;

  const RootModule({
    FutureOr<bool> Function(
            ModularHistory route, ModularRouterDelegate delegate)?
        guard,
  }) : super(guard);

  @override
  String get route => "/";

  ModularLink<TPageParameters>
      createLink<TPageParameters extends PageParameters>(Type pageType,
              {TPageParameters? parameters}) =>
          ModularLink<TPageParameters>(
            route: findRouteByPageType(pageType)!,
            parameters: parameters,
          );
}
