import 'package:f/Navigation_menu.dart';
import 'package:f/common/widgets/success_screen/success_screen.dart';
import 'package:f/data/repoositories/authentication_repository.dart';
import 'package:f/features/personalization/controllers/cart_controller.dart';
import 'package:f/features/personalization/controllers/checkout_controller.dart';
import 'package:f/utilis/constants/enums.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/popUps/full_screen_loader.dart';
import 'package:f/utilis/popUps/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../data/repoositories/order_repositories.dart';
import '../../../personalization/controllers/address_controller.dart';
import '../../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      fLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // Start Loader
      fFullScreenLoader.openLoadingDialog("Processing", fImages.animalIcon);

      // Get user Authentication Id
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      final order = OrderModel(
         id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // Set Date as needed
        deliveryDate: DateTime.now(),
       items: cartController.cartItems.toList(),
      );

      // Save the order to FireStore
      await orderRepository.saveOrder(order, userId);

      // Update the cart status
      cartController.clearCart();

      // Show Success Screen
      Get.off(() =>
          SuccessScreen(image: fImages.Successful2,
              title: "Payment Success",
              subTitle: "Your item will be shipped soon my able customer!",
              onPressed: () => Get.offAll(() => NavigationMenu())));
    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
  }
}}
