part of modular_navigation;

class NoPageParametersRoute<TModularPage extends ModularPage<NoPageParameters>>
    extends BaseModularRoute<NoPageParameters, TModularPage> {
  NoPageParametersRoute(
      {required BaseModule module,
      required String route,
      required TModularPage Function() createPage,
      FutureOr<bool> Function(
              ModularHistory route, ModularRouterDelegate delegate)?
          guard})
      : super(
          module: module,
          route: route,
          createPage: (params) => createPage(),
          guard: guard,
        );

  ModularLink<PageParameters> createLink() {
    return super._createLink(parameters: NoPageParameters());
  }

  TModularPage create() {
    return super._create(parameters: NoPageParameters()) as TModularPage;
  }

  void navigate({
    required BuildContext context,
    bool clearHistory = false,
    bool removeCurrent = false,
  }) {
    super._navigate(
      context: context,
      parameters: NoPageParameters(),
      clearHistory: clearHistory,
      removeCurrent: removeCurrent,
    );
  }
}
