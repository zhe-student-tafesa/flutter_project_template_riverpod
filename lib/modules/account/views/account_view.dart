import 'package:flutter/material.dart';
import 'package:flutter_project_template_riverpod/modules/account/controllers/account_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/account_state.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(accountControllerProvider, (_, state) async {
      debugPrint('account page $state');
      if (state is RefreshAccountDataState) {
        debugPrint('refresh data');
      }
    });

    return const Scaffold(
      body: Center(
        child: Text('Account'),
      ),
    );
  }
}
