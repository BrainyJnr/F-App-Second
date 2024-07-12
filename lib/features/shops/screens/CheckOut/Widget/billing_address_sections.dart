import 'package:f/common/widgets/texts/success_heading.dart';
import 'package:f/features/personalization/controllers/address_controller.dart';
import 'package:f/features/personalization/screens/address/add_new_address.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../authentication/models/address_model.dart';
import '../../../../personalization/controllers/checkout_controller.dart';
import '../../../../personalization/screens/address/address.dart';

class fBillingAddressSection extends StatelessWidget {
  const fBillingAddressSection({super.key,
    //required this.addressModel,


});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    final controller = Get.put(AddressController());



    return Obx(
      () => Column(
        children: [
          fSectionHeading(
               buttonTitle: "Change",onPressed: ()=> Get.to(() => UserAddressScreen()),
              title: "Shipping Address", onTap: () => addressController.AddNewAddressScreen()),

            addressController.selectedAddress.value.id.isNotEmpty
         ?      Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(controller.selectedAddress.value.name,
                    style: Theme.of(context).textTheme.bodyLarge,),
                SizedBox(height: fSizes.spaceBtwItems/2,),
               Row(
                children: [
                  const Icon(Icons.phone,color: Colors.grey,size: 16,),
                  const SizedBox(width: fSizes.spaceBtwItems,),
                  Column(
                 children: [   Text(controller.selectedAddress.value.phoneNumber,style: Theme.of(context).textTheme.bodyMedium,)]),
                ],
              ),

            const SizedBox(height: fSizes.spaceBtwItems/2,),
            Row(
              children: [
                const Icon(Icons.location_history,color: Colors.grey,size: 16,),
                const SizedBox(width: fSizes.spaceBtwItems,),
                Expanded(child: Text(controller.selectedAddress.value.postalCode,style: Theme.of(context).textTheme.bodyMedium,softWrap: true,))
              ],
            ) ])

        : Text("Select Address",style: Theme.of(context).textTheme.bodyMedium,),Padding(padding: EdgeInsets.only(left: 10))


        ],
      ),
    );
  }
}
