import 'package:auto_route/auto_route.dart';
// import 'package:exchange/pages/navigation/home_page.dart';
// import 'package:exchange/pages/navigation/market_page.dart';
import 'package:exchange/routes/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  // int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        MarketRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'home'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
            onDestinationSelected: (int index) {
              tabsRouter.setActiveIndex(index);
            },
            selectedIndex: tabsRouter.activeIndex,
          ),
        );
      },
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Root'),
    //   ),
    //   body: pages[currentPage],
    //   bottomNavigationBar: NavigationBar(
    //     destinations: const [
    //       NavigationDestination(icon: Icon(Icons.home), label: 'home'),
    //       NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
    //     ],
    //     onDestinationSelected: (int index) {
    //       setState(() {
    //         currentPage = index;
    //       });
    //     },
    //     selectedIndex: currentPage,
    //   ),
    // );
  }
}
