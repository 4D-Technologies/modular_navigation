part of modular_navigation;

extension RouterDelegateExtensions on GlobalKey<NavigatorState> {
  ModularRouterDelegate get _delegate =>
      Router.of(this.currentContext!).routerDelegate as ModularRouterDelegate;

  void goBack({
    bool clearHistory = false,
    bool removeCurrent = false,
  }) =>
      _delegate.popRoute();

  void navigateTo(
    ModularPage page, {
    bool clearHistory = false,
    bool removeCurrent = false,
  }) =>
      _delegate.navigateTo(
        page: page,
        clearHistory: clearHistory,
        removeCurrent: removeCurrent,
      );

  ModularPage get currentRoute => _delegate.currentConfiguration!;

  List<ModularHistory> get navigationHistory => _delegate.history;
}
