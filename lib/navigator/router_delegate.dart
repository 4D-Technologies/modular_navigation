part of modular_navigation;

class ModularRouterDelegate extends RouterDelegate<NavigationHistory>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationHistory> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final _history = List<NavigationHistory>.empty(growable: true);

  ModularRouterDelegate({required this.navigatorKey});

  List<NavigationHistory> get history => _history;

  void navigateTo(
    BuildContext context,
    ModularRoute route, {
    bool clearHistory = false,
    bool removeCurrent = false,
  }) {
    if (clearHistory) {
      _history.clear();
    } else if (removeCurrent) {
      _history.removeLast();
    }

    _history.add(
      NavigationHistory(
        route: route.route,
        parameters: route.parameters?.map,
        page: route.createPage(
          context,
          route.parameters,
        ),
      ),
    );

    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: this
          ._history, //Unless you want to have a really bad day debugging, don't take the .toList() off of this.
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
  Future<void> setNewRoutePath(NavigationHistory configuration) async {
    _history.add(configuration);
    notifyListeners();
  }

  @override
  NavigationHistory? get currentConfiguration =>
      _history.isEmpty ? null : _history.last;
}
