import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/device/device_utility.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class fTabBar extends StatelessWidget implements PreferredSizeWidget {
  const fTabBar({super.key, required this.tabs});

  final List <Widget> tabs;


  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? fColors.black : fColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: fColors.primary,
        labelColor: dark ? fColors.white : fColors.primary,
        unselectedLabelColor: fColors.darkerGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(fDeviceUtilis.getAppBarHeight());

}
