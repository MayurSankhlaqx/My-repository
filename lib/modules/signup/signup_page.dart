import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:social_media/constants/custom_form_button.dart';
import 'package:social_media/constants/custom_input_field.dart';
import 'package:social_media/constants/page_heading.dart';
import 'package:social_media/helper/functions.dart';
import 'package:social_media/modules/signup/signup_controller.dart';
import 'package:social_media/theme/colors_theme.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPage();
}
class _SignupPage extends State<SignupPage>{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: GetBuilder<SignupController>(
        init: SignupController(),
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
                    )),
                child: ListView(children: [
                  const SizedBox(
                    height: 20,
                  ),
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
                ]),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height / 1.4,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                children: [
                                  const PageHeading(
                                    title: 'CREATE ACCOUNT',
                                  ),
                                  CustomInputField(
                                      controller: controller.firstNameController,
                                      labelText: 'First Name',
                                      hintText: 'Enter first name',
                                      isDense: true,
                                      validator: (textValue) {
                                        if (textValue == null ||
                                            textValue.isEmpty) {
                                          return 'Please enter your first name';
                                        }
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CustomInputField(
                                      controller: controller.lastNameController,
                                      labelText: 'Last Name',
                                      hintText: 'Enter last name',
                                      isDense: true,
                                      validator: (textValue) {
                                        if (textValue == null ||
                                            textValue.isEmpty) {
                                          return 'Please enter your last name';
                                        }
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CustomEmailInputField(
                                      controller: controller.emailController,
                                      labelText: 'Email Address',
                                      hintText: 'Enter email address',
                                      isDense: true,
                                      validator: (textValue) {
                                        if (textValue != null) {
                                          textValue = textValue.trim();
                                          if (textValue == null ||
                                              textValue.isEmpty) {
                                            return 'Please enter your email id';
                                          }
                                          if (!isValidEmail(textValue)) {
                                            return 'Please enter a valid email address';
                                          }
                                          return null;
                                        }
                                      }),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  customGenderField(controller.genderController),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  dobField(
                                      controller.formKey, controller.dobController),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CustomPasswordInputField(
                                    controller: controller.passwordController,
                                    labelText: 'Password',
                                    hintText: 'Enter your password',
                                    isDense: true,
                                    obscureText: true,
                                    validator: (textValue) {
                                      if (textValue != null) {
                                        textValue = textValue.trim();
                                        if (textValue == null ||
                                            textValue.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        if (textValue.length < 8) {
                                          return "Password must have 8 characters";
                                        }
                                        if ((!textValue
                                            .contains(RegExp(r'[A-Z]'))) &&
                                            (!textValue
                                                .contains(RegExp(r'[a-z]')))) {
                                          return "Password must have alphabets";
                                        }
                                        if (!textValue.contains(RegExp(r'[A-Z]'))) {
                                          return "Password must have uppercase";
                                        }
                                        if (!textValue.contains(RegExp(r'[0-9]'))) {
                                          return "Password must have digits";
                                        }
                                        if (!textValue.contains(RegExp(r'[a-z]'))) {
                                          return "Password must have lowercase";
                                        }
                                        if (!textValue
                                            .contains(RegExp(r'[#?!@$%^&*-]'))) {
                                          return "Password must have special characters";
                                        }
                                        return null;
                                      }
                                    },
                                    suffixIcon: true,
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  CustomFormButton(
                                    innerText: 'Sign Up',
                                    onPressed: () {
                                      _handleSignupUser(
                                          controller.formKey, controller, context);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Already have an account ? ',
                                          style: Theme.of(context)
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
                                            Get.back()
                                          },
                                          child: Text(
                                            'Sign In',
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
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
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

  void _handleSignupUser(GlobalKey<FormState> signupFormKey,
      SignupController controller, BuildContext context) {
    // signup user
    if (signupFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signing in..')),
      );
    }
  }

  Widget dobField(GlobalKey<FormState> signupFormKey, TextEditingController dateinput) {
    DateTime today = DateTime.now();
    DateTime eighteenY = DateTime(today.year - 13, today.month, today.day);
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'DOB',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontFamily: 'DMSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ThemeColor.black),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 0,bottom: 0),
              child: TextFormField(
                controller: dateinput,
                validator: (value) {
                  if (dateinput.text == null || dateinput.text.isEmpty) {
                    return 'Please select your DOB';
                  }
                  return null;
                },
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: eighteenY,
                      firstDate: DateTime(
                          1910), //DateTime.now() - not to allow to choose before today.
                      lastDate: eighteenY);

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                    DateFormat('dd/MM/yyyy').format(pickedDate);
                    print(formattedDate); //formatted date output using intl package =>  2021-03-16

                    setState(() {
                      dateinput.text =
                          formattedDate; //set output date to TextField value.
                      signupFormKey.currentState!.validate();
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: DecoratedInputBorder(
                    child: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadow: const [
                      BoxShadow(
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer,
                          color: ThemeColor.lightGreyray
                      ),
                    ],
                  ),
                  contentPadding:
                  const EdgeInsets.only(top: 12,left: 10), // add padding to adjust text
                  hintText: "DD/MM/YYYY",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(
                      fontFamily: 'DMSans',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: ThemeColor.grayText),
                  suffixIcon: const Padding(
                    padding:
                    EdgeInsets.only(top: 1), // add padding to adjust icon
                    child: Icon(Icons.calendar_today, size: 23),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget customGenderField(TextEditingController genderController) {
    Size size = MediaQuery.of(context).size;
    var items = [
      'Select',
      'Male',
      'Female',
      'Other',
    ];
    String dropdownValue = "Select";

    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.fromLTRB(15, 0, 17, 0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Gender',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontFamily: 'DMSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ThemeColor.black),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 0,bottom: 0),
            child: Center(
              child: DropdownButtonFormField<String>(

                iconSize: 28,
                decoration: InputDecoration(
                  border: DecoratedInputBorder(
                    child: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadow: [
                      BoxShadow(
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer,
                          color: ThemeColor.lightGreyray
                      ),
                    ],
                  ),
                  isDense: true,
                  hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontFamily: 'DMSans',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: ThemeColor.grayText),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty || value == 'Select') {
                    return 'Please select your gender';
                  }
                  return null;
                },
                value: dropdownValue,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                    genderController.text = dropdownValue;

                    print("gender $value");
                    print("gender 2 $dropdownValue");
                  });
                },
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

}