import 'package:f/features/personalization/controllers/address_controller.dart';
import 'package:f/features/personalization/controllers/cart_controller.dart';
import 'package:f/features/personalization/controllers/checkout_controller.dart';
import 'package:f/features/shops/controllers/products/variation_controller.dart';
import 'package:get/get.dart';
import '../common/widgets/Managers/network_manager.dart';
import '../features/authentication/screens/login/login.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
     Get.put(NetworkManager());
     Get.put(VariationController());
     Get.put(AddressController());
     Get.put(CheckoutController());
     Get.put(LoginScreen());


   // Get.put(CartController());
  }
}
