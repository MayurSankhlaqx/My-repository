import 'package:get/get.dart';
import 'package:social_media/modules/create_post/create_post_controller.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePostController());
  }
}