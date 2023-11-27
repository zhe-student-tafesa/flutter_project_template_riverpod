import 'package:flutter/material.dart';
import 'package:flutter_project_template_riverpod/modules/support/controllers/support_controller.dart';
import 'package:flutter_project_template_riverpod/modules/support/controllers/support_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SupportPage extends ConsumerStatefulWidget {
  const SupportPage({super.key});

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends ConsumerState<SupportPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(supportControllerProvider, (_, state) async {
      debugPrint('support page $state');
      if (state is RefreshSupportDataState) {
        debugPrint('refresh data');
      }
    });

    return const Center(
      child: Text('Support'),
    );
  }
}
