import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_media/demo_data/demo_data.dart';
import 'package:social_media/models/video_list.dart';

class DashboardController extends GetxController {

  List<Data> videoList = [];
  List topCategory = [
    "Social",
    "Action",
    "News",
    "Movie",
    "Thriller",
    "Food",
    "Dance",
  ];

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