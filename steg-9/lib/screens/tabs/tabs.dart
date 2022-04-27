import 'package:progit_activity_booker/router/route_generator.dart';

enum TABS { HOME, CREATE_ACTIVITY, PROFILE }

class TabWidget {
  final String path;
  final String title;
  final int index;

  TabWidget({required this.path, required this.title, required this.index});
}

Map<TABS, TabWidget> tabsMap = {
  TABS.HOME: TabWidget(
    path: TabsRoute.path,
    title: 'Aktiviter',
    index: 0,
  ),
  TABS.CREATE_ACTIVITY: TabWidget(
    path: 'create-activity',
    title: 'Lag aktivitet',
    index: 1,
  ),
  TABS.PROFILE: TabWidget(
    path: 'profile',
    title: 'Profil',
    index: 2,
  )
};
