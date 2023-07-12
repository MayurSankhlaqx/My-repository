import 'package:get/get.dart';
import 'package:social_media/demo_data/demo_data.dart';
import 'package:social_media/models/video_list.dart';

class ProfileController extends GetxController {

  List<Data> videoList = [];

  @override
  void onInit() {
    super.onInit();
    fetchVideoDetails();
  }

  void fetchVideoDetails() async {
    var response =  DemoData.list;
    videoList = response.data!;
    update();
  }
}