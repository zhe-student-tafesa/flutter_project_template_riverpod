import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_state.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController(
    ref,
  );
});

class HomeController extends StateNotifier<HomeState> {
  final Ref ref;

  HomeController(
    this.ref,
  ) : super(const HomeDefaultState());

  void refreshHomePage() {
    state = const RefreshHomeDataState();
  }
}
