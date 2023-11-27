import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'support_state.dart';

final supportControllerProvider =
    StateNotifierProvider<SupportController, SupportState>((ref) {
  return SupportController(ref);
});

class SupportController extends StateNotifier<SupportState> {
  final Ref ref;

  SupportController(
    this.ref,
  ) : super(const SupportDefaultState());

  void refreshSupportPage() {
    state = const RefreshSupportDataState();
  }

  void setToDefaultState() {
    state = const SupportDefaultState();
  }
}
