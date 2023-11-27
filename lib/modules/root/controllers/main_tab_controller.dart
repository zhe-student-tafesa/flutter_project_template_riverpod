import 'package:flutter/material.dart';
import 'package:flutter_project_template_riverpod/modules/account/controllers/account_controller.dart';
import 'package:flutter_project_template_riverpod/modules/account/views/account_view.dart';
import 'package:flutter_project_template_riverpod/modules/support/controllers/support_controller.dart';
import 'package:flutter_project_template_riverpod/modules/support/views/support_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../book/controllers/book_controller.dart';
import '../../book/views/book_view.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';
import '../../trips/controllers/trips_controller.dart';
import '../../trips/views/trips_view.dart';

final pageIndexChangeNotifierProvider =
    ChangeNotifierProvider<RootController>((ref) {
  return RootController(ref);
});

class RootController extends ChangeNotifier {
  Ref ref;
  var currentIndex = 0;
  var notificationsCount = 0;

  RootController(this.ref);

  final List<Widget> _pages = [
    const HomePage(),
    const BookPage(),
    const TripsPage(),
    const SupportPage(),
    const AccountPage(),
  ];

  Widget get currentPage => _pages[currentIndex];

  List<Widget> get getPages => _pages;

  Future<void> changePageInRoot(int index) async {
    currentIndex = index;
    await refreshPage(index);
    notifyListeners();
  }

  Future<void> changePage(int index) async {
    await changePageInRoot(index);
  }

  Future<void> refreshPage(int index) async {
    switch (index) {
      case 0:
        {
          ref.read(homeControllerProvider.notifier).refreshHomePage();
          break;
        }
      case 1:
        {
          ref.read(bookControllerProvider.notifier).refreshBookPage();
          break;
        }
      case 2:
        {
          ref.read(tripsControllerProvider.notifier).refreshTripsPage();
          break;
        }
      case 3:
        {
          ref.read(supportControllerProvider.notifier).refreshSupportPage();
          break;
        }
      case 4:
        {
          ref.read(accountControllerProvider.notifier).refreshAccountPage();
          break;
        }
    }
  }
}
