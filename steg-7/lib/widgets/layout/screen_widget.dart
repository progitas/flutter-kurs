import 'package:flutter/material.dart';
import 'package:progit_activity_booker/services/size_service.dart';
import 'package:progit_activity_booker/widgets/event/events_list.dart';

class ScreenWidget extends StatelessWidget {
  final Widget child;
  final bool scrollable;
  final bool addPadding;

  const ScreenWidget({
    required this.child,
    this.scrollable = false,
    this.addPadding = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: scrollable
            ? SingleChildScrollView(
                child: getLayout(context, child, addPadding: addPadding),
              )
            : getLayout(context, child, addPadding: addPadding),
      ),
    );
  }
}

Widget getChild(
  Widget child, {
  required bool addPadding,
}) {
  if (addPadding) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: child,
    );
  }
  return child;
}

Widget getLayout(
  BuildContext context,
  Widget child, {
  required bool addPadding,
}) {
  if (!SizeService.instance.isLargeScreen) {
    return getChild(child, addPadding: addPadding);
  }
  return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: constraints.maxWidth * 0.67,
          child: getChild(child, addPadding: addPadding),
        ),
        Expanded(
          child: EventsList(),
        )
      ],
    );
  });
}
