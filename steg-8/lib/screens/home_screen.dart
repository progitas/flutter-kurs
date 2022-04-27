import 'package:flutter/material.dart';
import 'package:progit_activity_booker/services/size_service.dart';
import 'package:progit_activity_booker/widgets/home_screen/large_home_screen.dart';
import 'package:progit_activity_booker/widgets/home_screen/small_home_screen.dart';
import 'package:progit_activity_booker/widgets/layout/screen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenWidget(
        scrollable: true,
        addPadding: false,
        child: SizeService.instance.isLargeScreen
            ? LargeHomeScreen()
            : SmallHomeScreen(),
      ),
    );
  }
}
