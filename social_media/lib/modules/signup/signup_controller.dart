import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // fetchMovieDetails();
  }
}