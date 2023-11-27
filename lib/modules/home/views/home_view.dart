import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/home_controller.dart';
import '../controllers/home_state.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(homeControllerProvider, (_, state) async {
      debugPrint('home page $state');
      if (state is RefreshHomeDataState) {
        debugPrint('refresh data');
      }
    });

    return const Center(
      child: Text('Home'),
    );
  }
}
