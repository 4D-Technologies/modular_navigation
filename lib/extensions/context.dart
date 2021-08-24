part of modular_navigation;

extension ContextNavigateTo on BuildContext {
  ModularRouterDelegate get routeDelegate =>
      Router.of(this).routerDelegate as ModularRouterDelegate;

  void goBack({
    bool clearHistory = false,
    bool removeCurrent = false,
  }) =>
      routeDelegate.popRoute();

  FutureOr<void> navigateToUri(
    Uri uri, {
    bool clearHistory = false,
    bool removeCurrent = false,
  }) =>
      routeDelegate.navigateToUri(
        uri,
        clearHistory: clearHistory,
        removeCurrent: removeCurrent,
      );

  ModularPage get currentRoute => routeDelegate.currentConfiguration!;

  List<ModularHistory> get navigationHistory => routeDelegate.history;
}
