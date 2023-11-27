import 'package:flutter/material.dart';
import 'package:flutter_project_template_riverpod/common/values/string_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../routes/app_routes.dart';
import '../../routes/router_delegate.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ElevatedButton(
            key: const Key(FZStrings.goToMainTab),
            onPressed: () {
              FZRouterDelegate.instance.push(FZRoutePath.mainTab());
            },
            child: const Text(FZStrings.goToMainTab),
          ),
        ),
      ),
    );
  }
}
