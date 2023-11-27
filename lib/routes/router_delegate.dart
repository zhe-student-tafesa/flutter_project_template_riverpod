import 'dart:async';
import 'package:flutter/material.dart';
import '../modules/login_signup/splash_page.dart';
import 'app_routes.dart';

class FZRouterDelegate extends RouterDelegate<FZRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<FZRoutePath> {
  static FZRouterDelegate instance = FZRouterDelegate();
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  FZRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();
  static FZRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is FZRouterDelegate, 'Delegate type must match');
    return delegate as FZRouterDelegate;
  }

  final List<Page> _pages = <Page>[
    const MaterialPage(
      child: SplashPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        pop();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(FZRoutePath path) async {}

  push(FZRoutePath router) {
    _pages.add(MaterialPage(name: router.name, child: router.widget));
    notifyListeners();
  }

  pop() {
    if (_pages.length > 1) {
      _pages.remove(_pages.last);
      notifyListeners();
    }
  }

  popAll() {
    while (_pages.length > 1) {
      _pages.remove(_pages.last);
    }
    notifyListeners();
  }
}
