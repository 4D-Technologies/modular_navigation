part of modular_navigation;

extension ContextNavigateTo on BuildContext {
  ModularRouterDelegate get _delegate =>
      Router.of(this).routerDelegate as ModularRouterDelegate;

  void goBack({
    bool clearHistory = false,
    bool removeCurrent = false,
  }) =>
      _delegate.popRoute();

  FutureOr<void> navigateToPage(
    ModularPage page, {
    bool clearHistory = false,
    bool removeCurrent = false,
  }) =>
      _delegate.navigateToPage(
        page,
        clearHistory: clearHistory,
        removeCurrent: removeCurrent,
      );

  FutureOr<void> navigateToLink(
    ModularLink link, {
    bool clearHistory = false,
    bool removeCurrent = false,
  }) =>
      _delegate.navigateToLink(link,
          clearHistory: clearHistory, removeCurrent: removeCurrent);

  FutureOr<void> navigateToUri(
    Uri uri, {
    bool clearHistory = false,
    bool removeCurrent = false,
  }) =>
      _delegate.navigateToUri(
        uri,
        clearHistory: clearHistory,
        removeCurrent: removeCurrent,
      );

  ModularPage get currentRoute => _delegate.currentConfiguration!;

  List<ModularHistory> get navigationHistory => _delegate.history;
}
