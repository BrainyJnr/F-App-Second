import 'package:f/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:f/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:f/common/widgets/texts/success_heading.dart';
import 'package:f/data/repoositories/authentication_repository.dart';
import 'package:f/dummydataRepository.dart';
import 'package:f/features/personalization/screens/address/address.dart';
import 'package:f/features/personalization/screens/dummy_data.dart';
import 'package:f/features/shops/screens/cart/cart.dart';
import 'package:f/features/shops/screens/order/order.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../profile/profile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());
   final controllerUpload = Get.put(dummyRepository());
  //  final controllerUpload = Get.put(FirebaseService());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          fPrimaryHeaderContainer(
              child: Column(children: [
            fAppBar(
                title: Text(
              "Account",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: fColors.white),
            )),

            /// User Profile Card
            fUserProfileTile(
                onPressed: () => Get.to(() => const ProfileScreen())),
            const SizedBox(
              height: fSizes.spaceBtwSections,
            )
          ])),

          /// -- Body
          Padding(
            padding: EdgeInsets.all(fSizes.defaultSpace),
            child: Column(
              children: [
                /// -- Account Settings
                fSectionHeading(
                  title: "Account Settings",
                  showActionButton: false,
                ),
                SizedBox(
                  height: fSizes.spaceBtwItems,
                ),

                fSettingsMenuTile(
                  icon: Iconsax.safe_home,
                  title: "My Addresses",
                  subtitle: "Set shopping delivery address",
                  onTap: () => Get.to(() => const UserAddressScreen()),
                ),
                fSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    onTap: () => Get.to(() => CartScreen()),
                    subtitle: "Add, remove products and move to checkout"),
                fSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subtitle: "In-progress and completed Orders",
                    onTap: () => Get.to(() => const OrderScreen())),
                fSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Account",
                    subtitle: "Withdraw balance to registered bank account"),
                fSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Categories",
                    subtitle: "List of all discounted coupons"),
                fSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Notification",
                    subtitle: "Set any kind of notification message"),
                fSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: "Account Privacy",
                    subtitle: "Manage data usage and connected accounts"),

                /// -- App Settings
                SizedBox(
                  height: fSizes.spaceBtwSections,
                ),
                fSectionHeading(
                  title: "App Settings",
                  showActionButton: false,
                ),
                SizedBox(
                  height: fSizes.spaceBtwItems,
                ),
                fSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subtitle: "Upload Data to your Cloud Firebase ",
                    onTap:() {
                    }  ),
                fSettingsMenuTile(
                  icon: Iconsax.location,
                  title: "Geolocation",
                  subtitle: "Set recommendation based on location",
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                fSettingsMenuTile(
                  icon: Iconsax.security_user,
                  title: "Safe Mode",
                  subtitle: "Search results is safe for all ages",
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                fSettingsMenuTile(
                  icon: Iconsax.image,
                  title: "HD Image Quality",
                  subtitle: "Set image quality to be seen",
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),

                /// -- Logout Button
                const SizedBox(
                  height: fSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                    controller.logout();
                    controllerUpload.uploadDummydata(fDummyData.products);
                    //controllerUpload.uploadDummydata(fDummyData.products);
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: fSizes.spaceBtwSections * 2.5,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
