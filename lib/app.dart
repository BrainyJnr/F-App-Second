import 'package:f/features/authentication/screens/onboarding/onboarding.dart';
import 'package:f/routes/app_routes.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/general_binding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: fAppTheme.lightTheme,
     darkTheme: fAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
       backgroundColor: fColors.primary,body: Center(child:CircularProgressIndicator(color: Colors.white,),

   )
    )
    );
  }
}
