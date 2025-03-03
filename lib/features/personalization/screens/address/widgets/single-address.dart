import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/features/authentication/models/address_model.dart';
import 'package:f/features/personalization/controllers/address_controller.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class fSingleAddress extends StatelessWidget {
  const fSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final addressController = Get.put(AddressController());
    final dark = fHelperFunctions.isDarkMode(context);
    return Padding(padding: EdgeInsets.all(2),
      child: Obx(() {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return InkWell(
                  onTap: onTap,
                  child: fRoundedContainer(
                    width: double.infinity,
                    showBorder: true,
                    padding: const EdgeInsets.all(fSizes.md),
                    backgroundColor: selectedAddress
                        ? fColors.primary.withOpacity(0.5)
                        : selectedAddress
                            ? Colors.transparent
                            : Colors.transparent,
                    borderColor: selectedAddress
                        ? fColors.grey
                        : selectedAddress
                            ? Colors.transparent
                            : dark
                                ? fColors.darkerGrey
                                : fColors.grey,
                    margin: const EdgeInsets.only(bottom: fSizes.spaceBtwItems),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 5,
                          top: 0,
                          child: Icon(
                            selectedAddress ? Iconsax.tick_circle5 : null,
                            color: selectedAddress
                                ? dark
                                    ? fColors.light
                                    : fColors.dark.withOpacity(0.6)
                                : null,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              address.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: fSizes.sm / 2,
                            ),
                            Text(
                              address.formattedPhoneNo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: fSizes.sm / 2,
                            ),
                            Text(
                              address.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(
                              height: fSizes.sm / 2,
                            )
                          ],
                        )
                      ],
                    ),
                  )
            );
      }),
    );
  }
}
