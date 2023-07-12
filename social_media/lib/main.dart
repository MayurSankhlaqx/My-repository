import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/constants/dismiss_keyboard.dart';
import 'package:social_media/modules/login/login_binding.dart';
import 'package:social_media/modules/login/login_page.dart';
import 'package:social_media/routes/app_pages.dart';
import 'package:social_media/theme/colors_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeColor().themeData,
        home: LoginPage(),
        initialBinding: LoginBinding(),
        getPages: AppPages.pages,
      ),
    );
  }
}
