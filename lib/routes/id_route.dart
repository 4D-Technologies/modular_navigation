part of modular_navigation;

class IdPageRoute<TModularPage extends ModularPage<IdPageParameters>>
    extends ModularRoute<IdPageParameters, TModularPage> {
  IdPageRoute({
    required BaseModule module,
    required String route,
    required TModularPage Function(IdPageParameters params) createPage,
    FutureOr<bool> Function(
            ModularHistory route, ModularRouterDelegate delegate)?
        guard,
    bool overrideModuleGuard = false,
  }) : super(
          module: module,
          route: route,
          createPage: (params) => createPage(IdPageParameters.fromMap(params)),
          guard: guard,
          overrideModuleGuard: overrideModuleGuard,
        );

  IdPageRoute.getIt({
    required BaseModule module,
    required String route,
    FutureOr<bool> Function(
      ModularHistory route,
      ModularRouterDelegate delegate,
    )?
        guard,
    bool overrideModuleGuard = false,
  }) : super(
          module: module,
          route: route,
          createPage: (params) => GetIt.instance
              .get<TModularPage>(param1: IdPageParameters.fromMap(params)),
          guard: guard,
          overrideModuleGuard: overrideModuleGuard,
        );
}
