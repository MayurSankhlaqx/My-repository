import 'package:get/get.dart';
import 'package:social_media/modules/create_post/create_post_binding.dart';
import 'package:social_media/modules/create_post/create_post_page.dart';
import 'package:social_media/modules/dashboard/dashboard_binding.dart';
import 'package:social_media/modules/dashboard/dashboard_page.dart';
import 'package:social_media/modules/login/login_binding.dart';
import 'package:social_media/modules/login/login_page.dart';
import 'package:social_media/modules/profile/profile_binding.dart';
import 'package:social_media/modules/profile/profile_page.dart';
import 'package:social_media/modules/signup/signup_binding.dart';
import 'package:social_media/modules/signup/signup_page.dart';
import 'package:social_media/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.createPost,
      page: () => CreatePostPage(),
      binding: CreatePostBinding(),
    ),
  ];
}