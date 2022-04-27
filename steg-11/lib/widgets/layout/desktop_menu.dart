import 'package:flutter/material.dart';
import 'package:progit_activity_booker/screens/tabs/tabs.dart';

class DesktopMenu extends StatelessWidget implements PreferredSizeWidget {
  final int activeIndex;
  final void Function(TABS tab) onTabClicked;

  const DesktopMenu({
    required this.activeIndex,
    required this.onTabClicked,
    Key? key,
  }) : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      title: InkWell(
        onTap: () => onTabClicked(TABS.HOME),
        child: Text(
          'Progit',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      actions: tabsMap.entries
          .map(
            (tab) => desktopMenuTab(
              context,
              tab.value.title,
              () => onTabClicked(tab.key),
              isActive: activeIndex == tab.value.index,
            ),
          )
          .toList(),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50);
}

Widget desktopMenuTab(
  BuildContext context,
  String title,
  void Function() onClicked, {
  required bool isActive,
}) {
  final primaryColor = Theme.of(context).primaryColor;

  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        enableFeedback: false,
        onTap: onClicked,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontSize: 20,
            ),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                style: isActive ? BorderStyle.solid : BorderStyle.none,
                color: primaryColor,
              ),
            ),
          ),
        ),
      ));
}
