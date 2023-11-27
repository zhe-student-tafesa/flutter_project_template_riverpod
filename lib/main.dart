import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_project_template_riverpod/routes/router_delegate.dart';
import 'package:flutter_project_template_riverpod/routes/router_info_parser.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.
  final FZRouterDelegate _routerDelegate = FZRouterDelegate.instance;
  final PXFRouteInformationParser _parser = PXFRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      shouldFooterFollowWhenNotFull: (state) {
        return true;
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'flutter project template-riverpod',
        color: Colors.black,
        routeInformationParser: _parser,
        routerDelegate: _routerDelegate,

        /// use EasyLoad when waiting api data
        builder: EasyLoading.init(),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 20.0
    ..radius = 10.0
    ..dismissOnTap = false
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.black.withOpacity(0.1);
}
