import 'package:f/features/authentication/screens/home/widgets/home.dart';
import 'package:f/features/shops/screens/store.dart';
import 'package:f/features/shops/screens/wishlist/wish_list.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'data/search3.dart';
import 'features/personalization/screens/settings/settings.dart';
import 'features/shops/models/product_model.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key, });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = fHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? fColors.black : Colors.white,
          indicatorColor: darkMode ? fColors.white.withOpacity(0.1) : fColors.black.withOpacity(0.1),

          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.search_off_outlined), label: "Search"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value])
    );
  }
}


class NavigationController extends GetxController{

  final Rx<int> selectedIndex = 0.obs;


  final screens = [const HomeScreen(), Search(), const fStoreScreen(),const FavouriteScreen(),const SettingScreen()];
}
