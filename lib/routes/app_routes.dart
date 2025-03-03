

import 'package:f/features/authentication/password_configuration/forget_password.dart';
import 'package:f/features/authentication/screens/home/widgets/home.dart';
import 'package:f/features/authentication/screens/login/login.dart';
import 'package:f/features/authentication/screens/onboarding/onboarding.dart';
import 'package:f/features/authentication/screens/signup/sign_widget/signup.dart';
import 'package:f/features/authentication/screens/signup/sign_widget/verify_email.dart';
import 'package:f/features/personalization/screens/address/address.dart';
import 'package:f/features/personalization/screens/product_reviews/product_reviews.dart';
import 'package:f/features/personalization/screens/profile/profile.dart';
import 'package:f/features/personalization/screens/settings/settings.dart';
import 'package:f/features/shops/screens/CheckOut/check_out_screen.dart';
import 'package:f/features/shops/screens/cart/cart.dart';
import 'package:f/features/shops/screens/order/order.dart';
import 'package:f/features/shops/screens/store.dart';
import 'package:f/features/shops/screens/wishlist/wish_list.dart';
import 'package:f/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: fRoutes.home, page: () => HomeScreen()),
    GetPage(name: fRoutes.store, page: () => fStoreScreen()),
    GetPage(name: fRoutes.favourites, page: () => FavouriteScreen()),
    GetPage(name: fRoutes.settings, page: () => SettingScreen()),
    GetPage(name: fRoutes.productReviews, page: () => ProductReviewScreen()),
    GetPage(name: fRoutes.order, page: () => OrderScreen()),
    GetPage(name: fRoutes.checkout, page: () => CheckOutScreen()),
    GetPage(name: fRoutes.cart, page: () => CartScreen()),
    GetPage(name: fRoutes.userProfile, page: () => ProfileScreen()),
    GetPage(name: fRoutes.userAddress, page: () => UserAddressScreen()),
    GetPage(name: fRoutes.signup, page: () => SignupScreen()),
    GetPage(name: fRoutes.verifyEmail, page: () => VerifyEmailScreen()),
    GetPage(name: fRoutes.signIn, page: () => LoginScreen()),
    GetPage(name: fRoutes.forgetPassword, page: () => forgetPassword()),
    GetPage(name: fRoutes.onBoarding, page: () => OnBoardingScreen()),

  ];
}