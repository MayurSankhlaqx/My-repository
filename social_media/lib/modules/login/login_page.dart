import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:social_media/constants/custom_form_button.dart';
import 'package:social_media/constants/custom_input_field.dart';
import 'package:social_media/constants/page_heading.dart';
import 'package:social_media/helper/functions.dart';
import 'package:social_media/modules/login/login_controller.dart';
import 'package:social_media/theme/colors_theme.dart';

import '../../routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}
class _LoginPage extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Stack(
            children: [
              Container(
                height: size.height / 2.6,
                width: size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ThemeColor.darkBlue,
                        ThemeColor.blue
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                ),
                child:
                SafeArea(
                  child: Stack(
                      children: [
                        ListView(
                          children: [
                          const SizedBox(height: 25,),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width / 3.8, vertical: size.width / 60),
                            height: size.width / 2.4,
                            child: SvgPicture.asset(
                              'assets/img/main_logo.svg',
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                        ),
                      ]
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height / 1.5,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )
                  ),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Form(
                        key: controller.loginFormKey,
                        child: Column(
                          children: [
                            const PageHeading(title: 'LOGIN',),
                            CustomEmailInputField(
                              controller: controller.emailController,
                              isDense: true,
                              labelText: 'Email',
                              hintText: 'Enter email address',
                              validator: (textValue) {
                                if(textValue != null) {
                                  textValue = textValue.trim();
                                  if (textValue == null || textValue.isEmpty) {
                                    return 'Please enter your email id';
                                  }
                                  if (!isValidEmail(textValue)) {
                                    return 'Please enter valid email id';
                                  }
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 16,),
                            CustomPasswordInputField(
                              controller: controller.passwordController,
                              labelText: 'Password',
                              isDense: true,
                              hintText: 'Enter your password',
                              obscureText: true,
                              suffixIcon: true,
                              validator: (textValue) {
                                if(textValue != null) {
                                  textValue = textValue.trim();
                                  if(textValue == null || textValue.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 16,),
                            CustomFormButton(innerText: 'Sign In', onPressed: () {
                              _handleLoginUser(controller.loginFormKey,context,controller);
                            },),
                            const SizedBox(height: 16,),
                            Container(
                              width: size.width * 0.80,
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () => {},
                                child: Text(
                                  'Forgot password?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                      fontFamily: 'DMSans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeColor.black),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16,),
                            SizedBox(
                              width: size.width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t have an account ? ', style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                      fontFamily: 'DMSans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: ThemeColor.black),
                                  ),
                                  GestureDetector(
                                    onTap: () => {
                                      Get.toNamed(AppRoutes.signup)
                                    },
                                    child: Text('SIGN UP', style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                        fontFamily: 'DMSans',
                                        fontSize: 15 ,
                                        fontWeight: FontWeight.bold,
                                        color: ThemeColor.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  void _handleLoginUser(GlobalKey<FormState> loginFormKey, BuildContext context, LoginController controller) {
    if (loginFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logging in..')),
      );
      Get.offAndToNamed(AppRoutes.dashboard);
    }
  }

}