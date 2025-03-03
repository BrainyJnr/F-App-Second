import 'package:f/common/widgets/appbar/appbar.dart';
import 'package:f/features/shops/screens/order/widget/order_list.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: fAppBar(
        title: Text(
          "My Orders",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(fSizes.defaultSpace),

        /// -- Orders
        child: fOrderListItems(),
      ),
    );
  }
}
