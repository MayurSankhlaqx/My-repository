import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_media/modules/dashboard/dashboard_controller.dart';
import 'package:social_media/routes/app_routes.dart';
import 'package:social_media/theme/colors_theme.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
        if(_isSearching){
          setState(() {
            _isSearching = !_isSearching;
          });
          return Future.value(false);
        }
        else{
          return Future.value(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.blue,
          centerTitle: true,
          title: _isSearching ? TextField(
            decoration: const InputDecoration(
                border: InputBorder.none,hintText: "Search here...",hintStyle: TextStyle(color: ThemeColor.white)
            ),
            autofocus: true,
            style: const TextStyle(fontSize: 17,letterSpacing: 1,color: ThemeColor.white),
            onChanged: (value) {},
          ) :const Text("Social App"),
          actions: [
            IconButton(onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
            }, icon: Icon( _isSearching ? CupertinoIcons.clear_circled_solid : Icons.search )),
            IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.profile);
                },
                icon: const Icon(Icons.account_circle)),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: FloatingActionButton(
            onPressed: () async {
              Get.toNamed(AppRoutes.createPost);
            },
            child: const Icon(Icons.add_comment_rounded),
          ),
        ),
        body: GetBuilder<DashboardController>(
          init: DashboardController(),
          builder: (controller) {
            return controller.videoList != null
                ? Stack(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ThemeColor.blue,
                          ThemeColor.blue
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                ),
                ListView(
                  padding: const EdgeInsets.only(top: 0),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 17.0, top: 10, bottom: 0),
                          child: Text(
                            "Top Categories",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: ThemeColor.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 9, right: 9, bottom: 10),
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.topCategory.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0),
                                child: Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(12.0),
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15.0),
                                          ),
                                        ),
                                        child: Text(
                                          "${controller.topCategory[index]}",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: 'DMSans',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: ThemeColor.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: size.width,
                              decoration: const BoxDecoration(
                                  color: ThemeColor.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  )),
                              child: Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                    top: 20, left: 17, right: 17),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "LATEST VIDEO",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.copyWith(
                                              fontFamily: 'DMSans',
                                              fontSize: 20,
                                              color: ThemeColor.black),
                                        ),
                                        InkWell(
                                          onTap: () {
                                          },
                                          child: Container(
                                              alignment: Alignment.topRight,
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 12,
                                                  vertical: 8),
                                              decoration: BoxDecoration(
                                                  color: ThemeColor.blue,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      13)),
                                              child: Text(
                                                "See More",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.copyWith(
                                                    fontFamily:
                                                    'DMSans',
                                                    fontWeight:
                                                    FontWeight
                                                        .normal,
                                                    color: ThemeColor.white),
                                              )),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GridView.builder(
                                      itemCount: controller.videoList.length,
                                      shrinkWrap: true,
                                      physics:
                                      const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.1 / 1,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 15,
                                      ),
                                      itemBuilder: (context, index) {
                                        // print("IMAGEURL :::::");

                                        return InkWell(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    15),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        "${controller.videoList[index].image}"
                                                    ))),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                  'assets/img/play_arrow_icon.svg'), //packages\youtube_app\assets\img\play_arrow_icon.svg
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 20, bottom: 10),
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: controller.videoList.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            decoration:BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                      blurRadius: 10,
                                                      blurStyle: BlurStyle.outer,
                                                      color: ThemeColor.lightGreyray
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                            margin: const EdgeInsets.only(bottom: 10,top: 10),
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 10),
                                                  width: size.width,
                                                  height: size.width / 2.1,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            '${controller.videoList[index].image}')),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Theme(
                                                        data: ThemeData(
                                                            splashColor:
                                                            Colors.black12),
                                                        child: Material(
                                                          type:
                                                          MaterialType.transparency,
                                                          child: InkWell(
                                                            onTap: () {

                                                            },
                                                            child: Center(
                                                              child: SvgPicture.asset(
                                                                  'assets/img/play_arrow_icon.svg'),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () async {

                                                        },
                                                        child: Align(
                                                          alignment: Alignment.topRight,
                                                          child: Container(
                                                            padding:
                                                            const EdgeInsets.all(8),
                                                            margin:
                                                            const EdgeInsets.only(
                                                                top: 5, right: 5),
                                                            width: 33,
                                                            height: 33,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(12),
                                                                color: Colors.white),
                                                            child: controller.videoList[index].isFavorite == 0
                                                                ? Center(
                                                              child: SvgPicture.asset(
                                                                  'assets/img/tab_favourite_off.svg',
                                                                  color: const Color(
                                                                      0xFF000133)),
                                                            )
                                                                : Center(
                                                              child: SvgPicture.asset(
                                                                  'assets/img/favorite_fill_icon.svg',
                                                                  color: const Color(
                                                                      0xFF000133)),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 13.0,
                                                      left: 15,
                                                      right: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          maxLines: 2,
                                                          textAlign: TextAlign.start,
                                                          "${controller.videoList[index].title}",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyText2
                                                              ?.copyWith(
                                                              fontFamily: 'DMSans',
                                                              fontSize: 12,
                                                              color: ThemeColor.black,
                                                              fontWeight:
                                                              FontWeight.w700),
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon:
                                                        const Icon(Icons.more_vert),
                                                        color: const Color(0xFF000133),
                                                        padding:
                                                        const EdgeInsets.all(0.0),
                                                        // splashRadius: ,
                                                        constraints:
                                                        const BoxConstraints(),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 17),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        maxLines: 2,
                                                        textAlign: TextAlign.start,
                                                        'Published: ${'20-Fab-20'}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText2
                                                            ?.copyWith(
                                                            fontFamily: 'DMSans',
                                                            fontSize: 11,
                                                            color: ThemeColor.gray,
                                                            fontWeight:
                                                            FontWeight.w700),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            ///About to Complete
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ) : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/img/no_search_found_png.png',
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                ),
                Text(
                  "No Result Found",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DMSans',
                      fontSize: 17),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
