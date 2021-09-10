part of modular_navigation;

class ModularRoute<TPageParameters extends PageParameters,
        TModularPage extends ModularPage<TPageParameters>>
    extends BaseModularRoute<TPageParameters, TModularPage> {
  ModularRoute({
    required BaseModule module,
    required String route,
    required TModularPage Function(Map<String, String?> params) createPage,
    FutureOr<bool> Function(
      ModularHistory route,
      ModularRouterDelegate delegate,
    )?
        guard,
    bool overrideModuleGuard = false,
  }) : super(
          module: module,
          route: route,
          createPage: createPage,
          guard: guard,
          overrideModuleGuard: overrideModuleGuard,
        );

  ModularRoute.getIt({
    required BaseModule module,
    required String route,
    required TPageParameters Function(Map<String, String?> params) createParams,
    FutureOr<bool> Function(
      ModularHistory route,
      ModularRouterDelegate delegate,
    )?
        guard,
    bool overrideModuleGuard = false,
  }) : super(
          module: module,
          route: route,
          createPage: (params) => GetIt.instance.get<TModularPage>(
            param1: createParams(params),
          ),
          guard: guard,
          overrideModuleGuard: overrideModuleGuard,
        );

  ModularLink<TPageParameters> createLink(TPageParameters parameters) {
    return super._createLink(parameters: parameters);
  }

  TModularPage create(TPageParameters parameters) {
    return super._create(parameters: parameters) as TModularPage;
  }

  void navigate({
    required BuildContext context,
    required TPageParameters parameters,
    bool clearHistory = false,
    bool removeCurrent = false,
  }) {
    super._navigate(
      context: context,
      parameters: parameters,
      clearHistory: clearHistory,
      removeCurrent: removeCurrent,
    );
  }
}
