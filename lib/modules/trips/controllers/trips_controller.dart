import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'trips_state.dart';

final tripsControllerProvider =
    StateNotifierProvider<TripsController, TripsState>((ref) {
  return TripsController(ref);
});

class TripsController extends StateNotifier<TripsState> {
  final Ref ref;

  TripsController(
    this.ref,
  ) : super(const TripsDefaultState());

  void refreshTripsPage() {
    state = const RefreshTripsDataState();
  }

  void setToDefaultState() {
    state = const TripsDefaultState();
  }
}
