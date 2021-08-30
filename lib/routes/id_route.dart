part of modular_navigation;

class IdPageRoute<TModularPage extends ModularPage<IdPageParameters>>
    extends ModularRoute<IdPageParameters, TModularPage> {
  IdPageRoute(
      {required BaseModule module,
      required String route,
      required TModularPage Function(IdPageParameters params) createPage,
      FutureOr<bool> Function(
              ModularHistory route, ModularRouterDelegate delegate)?
          guard})
      : super(
          module: module,
          route: route,
          createPage: (params) => createPage(IdPageParameters.fromMap(params)),
          guard: guard,
        );
}
