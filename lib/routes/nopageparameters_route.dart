part of modular_navigation;

class NoPageParametersRoute<TModularPage extends ModularPage<NoPageParameters>>
    extends ModularRoute<NoPageParameters, TModularPage> {
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

  @override
  ModularLink<PageParameters> createLink({
    NoPageParameters? parameters = const NoPageParameters(),
  }) {
    return super.createLink(parameters: parameters);
  }

  @override
  TModularPage create(
      {NoPageParameters? parameters = const NoPageParameters()}) {
    return super.create(parameters: parameters) as TModularPage;
  }

  @override
  void navigate({
    required BuildContext context,
    NoPageParameters? parameters = const NoPageParameters(),
    bool clearHistory = false,
    bool removeCurrent = false,
  }) {
    super.navigate(
      context: context,
      parameters: parameters,
      clearHistory: clearHistory,
      removeCurrent: removeCurrent,
    );
  }
}
