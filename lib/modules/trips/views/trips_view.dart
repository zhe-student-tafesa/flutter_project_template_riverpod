import 'package:flutter/material.dart';
import 'package:flutter_project_template_riverpod/modules/trips/controllers/trips_controller.dart';
import 'package:flutter_project_template_riverpod/modules/trips/controllers/trips_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TripsPage extends ConsumerStatefulWidget {
  const TripsPage({super.key});

  @override
  _TripsPageState createState() => _TripsPageState();
}

class _TripsPageState extends ConsumerState<TripsPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(tripsControllerProvider, (_, state) async {
      debugPrint('trips page $state');
      if (state is RefreshTripsDataState) {
        debugPrint('refresh data');
      }
    });

    return const Center(
      child: Text('Trips'),
    );
  }
}
