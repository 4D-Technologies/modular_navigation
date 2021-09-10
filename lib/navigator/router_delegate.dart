part of modular_navigation;

class ModularRouterDelegate extends RouterDelegate<ModularPage>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ModularPage> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final RootModule rootModule;
  final ModularPage<PageParameters> Function(
      ModularPage<PageParameters> configuration)? setInitialRoutePathOverride;

  final _history = List<ModularHistory>.empty(growable: true);

  ModularRouterDelegate({
    required this.navigatorKey,
    required this.rootModule,
    this.setInitialRoutePathOverride,
  }) : super();

  List<ModularHistory> get history => _history;

  FutureOr<void> navigateToLink(
    ModularLink link, {
    bool clearHistory = false,
    bool removeCurrent = false,
  }) {
    final page =
        link.route.createPage(link.parameters?.map ?? NoPageParameters().map);

    _completeNavigation(
      route: link.route,
      page: page,
      clearHistory: clearHistory,
      removeCurrent: removeCurrent,
    );
  }

  FutureOr<void> navigateToUri(
    Uri uri, {
    bool clearHistory = false,
    bool removeCurrent = false,
  }) {
    final route = rootModule.findRoute(uri.path);

    if (route == null) throw RouteNotFoundException();

    final page = route.createPage(uri.queryParameters);

    _completeNavigation(
      route: route,
      page: page,
      clearHistory: clearHistory,
      removeCurrent: removeCurrent,
    );
  }

  FutureOr<void> navigateToPage(
    ModularPage page, {
    bool clearHistory = false,
    bool removeCurrent = false,
  }) {
    final route = rootModule.findRouteByPageType(page.runtimeType);

    if (route == null) throw RouteNotFoundException();

    _completeNavigation(
      route: route,
      page: page,
      clearHistory: clearHistory,
      removeCurrent: removeCurrent,
    );
  }

  FutureOr<bool> testGuards<TPageParameters extends PageParameters,
          TModularPage extends ModularPage<TPageParameters>>(
      BaseModularRoute route,
      ModularHistory<TPageParameters, TModularPage> history) async {
    final guards = List<
        FutureOr<bool> Function(ModularHistory route,
            ModularRouterDelegate delegate)>.empty(growable: true);

    if (route.guard != null) guards.add(route.guard!);

    if (!route.overrideModuleGuard) addModuleGuards(route.module, guards);

    for (var j = 0; j < guards.length; j++) {
      if (!await guards[j](
        history,
        this,
      )) return false;
    }

    return true;
  }

  void addModuleGuards(
      BaseModule module,
      List<
              FutureOr<bool> Function(
                  ModularHistory route, ModularRouterDelegate delegate)>
          guards) {
    if (module.guard != null) guards.insert(0, module.guard!);

    if (module is SubModule) {
      if (module.overrideParentGuards) return;

      addModuleGuards(module.parentModule, guards);
    }
  }

  FutureOr<void> _completeNavigation({
    required BaseModularRoute route,
    required ModularPage page,
    required bool clearHistory,
    required bool removeCurrent,
  }) async {
    final fullRoute = ModularHistory(route, page);

    if (!await testGuards(route, fullRoute)) return;

    if (clearHistory) {
      _history.clear();
    } else if (removeCurrent) {
      _history.removeLast();
    }

    _history.add(ModularHistory(route, page));

    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: this
          ._history
          .map((e) => e.page)
          .toList(), //Unless you want to have a really bad day debugging, don't take the .toList() off of this.
      onPopPage: (Route<dynamic> route, dynamic result) {
        if (!route.didPop(result)) return false;

        return pop();
      },
    );
  }

  bool get canPop => _history.isNotEmpty;

  bool pop() {
    if (canPop) {
      _history.removeLast();
      return true;
    }
    return false;
  }

  @override
  Future<bool> popRoute() {
    if (canPop) {
      _history.removeLast();
      return Future.value(true);
    }

    return Future.value(false);
  }

  @override
  Future<void> setNewRoutePath(ModularPage configuration) {
    final route = rootModule.findRouteByPageType(configuration.runtimeType);

    if (route == null) throw RouteNotFoundException();

    _history.add(ModularHistory(route, configuration));
    notifyListeners();

    return SynchronousFuture(null);
  }

  @override
  ModularPage? get currentConfiguration =>
      _history.isEmpty ? null : _history.last.page;

  @override
  Future<void> setInitialRoutePath(ModularPage<PageParameters> configuration) {
    if (setInitialRoutePathOverride != null) {
      configuration = setInitialRoutePathOverride!(configuration);
    }
    return super.setInitialRoutePath(configuration);
  }
}
