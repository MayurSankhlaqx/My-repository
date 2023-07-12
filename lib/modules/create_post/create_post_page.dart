import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_media/constants/custom_form_button.dart';
import 'package:social_media/constants/custom_input_field.dart';
import 'package:social_media/modules/create_post/create_post_controller.dart';
import 'package:social_media/theme/colors_theme.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPage();
}
class _CreatePostPage extends State<CreatePostPage>{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor.blue,
        centerTitle: true,
        title: const Text("Upload Video"),
      ),
      body: GetBuilder<CreatePostController>(
        init: CreatePostController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(
                  vertical: 17, horizontal: 17,),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Text(
                    "UPLOAD VIDEO",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(
                        fontFamily: 'DMSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ThemeColor.black),
                  ),
                  SizedBox(height: 20,),
                  DottedBorder(
                    dashPattern: [6,0,3,6],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(15),
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                                'assets/img/main_logo.svg'), //packages\youtube_app\assets\img\play_arrow_icon.svg
                          ),
                        ),
                        Text(
                          "Tap to Choose a video file",
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(
                              fontFamily: 'DMSans',
                              fontSize: 15,
                              color: ThemeColor.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Center(
                    child: Text(
                      "Uploads are currently limited to 10 minutes",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(
                          fontFamily: 'DMSans',
                          fontSize: 13,
                          color: ThemeColor.grayText),
                    ),
                  ),
                  SizedBox(height: 20,),
                  CustomTextInputField(
                      labelText: 'Title',
                      hintText: 'Enter video title',
                      isDense: true,
                      validator: (textValue) {
                        if (textValue == null ||
                            textValue.isEmpty) {
                          return 'Please enter video title';
                        }
                        return null;
                      }
                    ),
                  SizedBox(height: 20,),
                  CustomDescriptionInputField(
                      labelText: 'Description',
                      hintText: 'Enter video description',
                      isDense: true,
                      validator: (textValue) {
                        if (textValue == null ||
                            textValue.isEmpty) {
                          return 'Please enter video description';
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 20,),
                  CustomFormButton(innerText: 'Upload',
                    onPressed: () {
                    // _handleLoginUser(controller.loginFormKey,context,controller);
                  },),
                ],
              ),
            ),
          );
        }
      ),
    );
  }


}