import 'package:flutter/material.dart';
import 'package:progit_activity_booker/router/route_generator.dart';
import 'package:progit_activity_booker/screens/tabs/tabs.dart';
import 'package:progit_activity_booker/services/size_service.dart';
import 'package:progit_activity_booker/widgets/layout/desktop_menu.dart';
import 'package:progit_activity_booker/widgets/layout/mobile_menu.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var _tab = tabsMap[TABS.HOME];

  final activityNavigatorKey = GlobalKey<NavigatorState>();

  void onTabClicked(TABS selectedTab) {
    final selectedTabItem = tabsMap[selectedTab];
    if (selectedTabItem == _tab) {
      activityNavigatorKey.currentState?.popUntil((route) => route.isFirst);
    }

    setState(() {
      _tab = selectedTabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(true);
      },
      child: Scaffold(
        extendBody: true,
        drawerScrimColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1150),
              child: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (SizeService.instance.isLargeScreen)
                      DesktopMenu(
                        activeIndex: _tab?.index ?? 0,
                        onTabClicked: (tab) => onTabClicked(tab),
                      ),
                    Expanded(
                      child: IndexedStack(
                        children: [
                          Navigator(
                            key: activityNavigatorKey,
                            onGenerateRoute: (settings) => RouteGenerator()
                                .generateActivityRoute(settings),
                          ),
                          const Center(
                            child: Text('Create activity'),
                          ),
                          const Center(
                            child: Text('Profile'),
                          )
                        ],
                        index: _tab?.index,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: !SizeService.instance.isLargeScreen
            ? BottomMenu(
                activeIndex: _tab?.index ?? 0,
                onTabClicked: (tab) => onTabClicked(tab),
              )
            : null,
      ),
    );
  }
}
