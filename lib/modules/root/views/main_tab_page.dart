import 'package:flutter/material.dart';
import 'package:flutter_project_template_riverpod/common/values/string_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/main_tab_controller.dart';

class MainTabPage extends ConsumerStatefulWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  _MainTabPageState createState() => _MainTabPageState();
}

class _MainTabPageState extends ConsumerState<MainTabPage> {
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
    final currentIndexNotifier =
        ref.watch(pageIndexChangeNotifierProvider.notifier);

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: IndexedStack(
          /// 2 use currentIndex： set Page
          index: currentIndexNotifier.currentIndex,
          children: currentIndexNotifier.getPages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,

        /// 2 use currentIndex
        currentIndex: currentIndexNotifier.currentIndex,
        onTap: (index) {
          setState(() {
            ///1 set index to currentIndex in pageIndexChangeNotifierProvider
            currentIndexNotifier.changePage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              key: Key(FZStrings.homeBottomNavigationBarItem),
            ),
            label: FZStrings.home.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.airplanemode_active,
              key: Key(
                FZStrings.bookBottomNavigationBarItem,
              ),
            ),
            label: FZStrings.book.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.airport_shuttle,
              key: Key(FZStrings.tripsBottomNavigationBarItem),
            ),
            label: FZStrings.trips.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.support,
              key: Key(FZStrings.supportBottomNavigationBarItem),
            ),
            label: FZStrings.support.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.account_circle,
              key: Key(FZStrings.accountBottomNavigationBarItem),
            ),
            label: FZStrings.account.toUpperCase(),
          ),
        ],
      ),
    );
  }
}
