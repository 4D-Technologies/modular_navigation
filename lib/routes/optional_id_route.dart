part of modular_navigation;

class OptionalIdPageRoute<
        TModularPage extends ModularPage<OptionalIdPageParameters>>
    extends ModularRoute<OptionalIdPageParameters, TModularPage> {
  OptionalIdPageRoute(
      {required BaseModule module,
      required String route,
      required TModularPage Function(OptionalIdPageParameters params)
          createPage,
      FutureOr<bool> Function(
              ModularHistory route, ModularRouterDelegate delegate)?
          guard})
      : super(
          module: module,
          route: route,
          createPage: (params) =>
              createPage(OptionalIdPageParameters.fromMap(params)),
          guard: guard,
        );

  OptionalIdPageRoute.getIt(
      {required BaseModule module,
      required String route,
      FutureOr<bool> Function(
              ModularHistory route, ModularRouterDelegate delegate)?
          guard})
      : super(
          module: module,
          route: route,
          createPage: (params) => GetIt.instance.get<TModularPage>(
            param1: OptionalIdPageParameters.fromMap(params),
          ),
          guard: guard,
        );
}
