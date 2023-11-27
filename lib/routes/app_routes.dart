import 'package:flutter/material.dart';
import '../common/values/string_manager.dart';
import '../modules/login_signup/splash_page.dart';
import '../modules/root/views/main_tab_page.dart';

class FZRoutePath {
  final String name;
  final Map<String, dynamic>? parameters;
  final Widget widget;

  FZRoutePath.splash({this.parameters})
      : name = FZStrings.launchScreen,
        widget = const SplashPage();

  FZRoutePath.mainTab({this.parameters})
      //main tab page
      : name = FZStrings.mainTab,
        widget = const MainTabPage();

  // FZRoutePath.home({this.parameters})
  //     : name = 'home',
  //       widget = const HomePage();
}
