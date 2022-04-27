import 'package:flutter/material.dart';
import 'package:progit_activity_booker/constants/app_colors.dart';
import 'package:progit_activity_booker/screens/tabs/tabs.dart';

class BottomMenu extends StatelessWidget {
  final int activeIndex;
  final void Function(TABS tab) onTabClicked;

  const BottomMenu({
    required this.activeIndex,
    required this.onTabClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
              offset: Offset(0.0, 1.00), //(x,y)
              blurRadius: 4.00,
              color: AppColors.secondary,
              spreadRadius: 1.00),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomAppBar(
          elevation: 20,
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Row(
              children: tabsMap.entries
                  .map(
                    (tab) => mobileMenuTab(
                      context,
                      tab.value.title,
                      () => onTabClicked(tab.key),
                      isActive: activeIndex == tab.value.index,
                    ),
                  )
                  .toList(),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ),
      ),
    );
  }
}

Widget mobileMenuTab(
    BuildContext context, String title, void Function() onClicked,
    {required bool isActive}) {
  final secondaryColor = Theme.of(context).primaryColorLight;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: InkWell(
      onTap: onClicked,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              style: isActive ? BorderStyle.solid : BorderStyle.none,
              color: secondaryColor,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: secondaryColor,
            fontSize: 18,
          ),
        ),
      ),
    ),
  );
}
