import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'account_state.dart';

final accountControllerProvider =
    StateNotifierProvider<AccountController, AccountState>((ref) {
  return AccountController(ref);
});

class AccountController extends StateNotifier<AccountState> {
  final Ref ref;

  AccountController(
    this.ref,
  ) : super(const AccountDefaultState());

  void refreshAccountPage() {
    state = const RefreshAccountDataState();
  }

  void setToDefaultState() {
    state = const AccountDefaultState();
  }
}
