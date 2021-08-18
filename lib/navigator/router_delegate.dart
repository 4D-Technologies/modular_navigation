part of modular_navigation;

class ModularRouterDelegate extends RouterDelegate<ModularPage>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ModularPage> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final RootModule rootModule;
  final Future<void> Function(ModularPage<PageParameters> configuration)?
      setInitialRoutePathOverride;

  final _history = List<ModularHistory>.empty(growable: true);

  ModularRouterDelegate({
    required this.navigatorKey,
    required this.rootModule,
    this.setInitialRoutePathOverride,
  }) : super();

  List<ModularHistory> get history => _history;

  void navigateTo({
    required ModularPage page,
    bool clearHistory = false,
    bool removeCurrent = false,
  }) {
    if (clearHistory) {
      _history.clear();
    } else if (removeCurrent) {
      _history.removeLast();
    }

    final route = rootModule.findRouteByPageType(page.runtimeType);

    if (route == null) throw RouteNotFoundException();

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
    if (setInitialRoutePathOverride != null)
      return setInitialRoutePath(configuration);

    return super.setInitialRoutePath(
        rootModule.initialRoute.createPage(NoPageParameters().map));
  }
}
