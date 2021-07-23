part of modular_navigation;

extension ContextNavigateTo on BuildContext {
  void goBack({bool clearHistory = false, bool removeCurrent = false}) {
    final delegate =
        Router.maybeOf(this)?.routerDelegate as ModularRouterDelegate?;

    if (delegate == null) throw NullThrownError();

    delegate.popRoute();
  }

  void navigateTo(ModularRoute route,
      {bool clearHistory = false, bool removeCurrent = false}) {
    final delegate =
        Router.maybeOf(this)?.routerDelegate as ModularRouterDelegate?;

    if (delegate == null) throw NullThrownError();

    delegate.navigateTo(
      this,
      route,
      clearHistory: clearHistory,
      removeCurrent: removeCurrent,
    );
  }

  NavigationHistory? get maybeCurrentRoute {
    final delegate =
        Router.maybeOf(this)?.routerDelegate as ModularRouterDelegate?;

    if (delegate == null) return null;

    return delegate.currentConfiguration;
  }

  NavigationHistory get currentRoute {
    final delegate =
        Router.maybeOf(this)?.routerDelegate as ModularRouterDelegate?;

    if (delegate == null || delegate.currentConfiguration == null)
      throw NullThrownError();

    return delegate.currentConfiguration!;
  }

  List<NavigationHistory> get navigationHistory {
    final delegate = Router.of(this).routerDelegate as ModularRouterDelegate;
    return delegate.history;
  }
}
