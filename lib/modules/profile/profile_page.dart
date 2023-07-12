import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_media/modules/profile/profile_controller.dart';
import 'package:social_media/routes/app_routes.dart';
import 'package:social_media/theme/colors_theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
                onPressed: () {},
                icon: const Icon(Icons.account_circle)),
          ],
        ),
        body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return Scaffold(
              backgroundColor: ThemeColor.white,
              body: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF01123E),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer,
                            color: ThemeColor.lightGreyray
                        ),
                      ],
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(style: BorderStyle.solid,width: 0,color: Colors.black38),
                                    borderRadius: BorderRadius.circular(15),
                                    image: const DecorationImage(image: AssetImage('assets/img/img.png'),),
                                  ),
                                ),
                                Text(
                                  capitalizeAllWord('username'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                      fontFamily: 'DMSans',
                                      fontSize: 15,
                                      color: ThemeColor.black,
                                      fontWeight:
                                      FontWeight.w700),
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  children: [ ElevatedButton(
                                    onPressed: () async {

                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15))),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          gradient:
                                          const LinearGradient(colors: [Color(0xFF000133), Color(0xFF002147)],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter),
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        width: 120,
                                        height: 40,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Update Profile',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              ?.copyWith(
                                              fontFamily: 'DMSans',
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: ThemeColor.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                    const SizedBox(width: 20,),
                                    ElevatedButton(
                                      onPressed: () async {

                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15))),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            gradient:
                                            const LinearGradient(colors: [Color(0xFF000133), Color(0xFF002147)],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter),
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Update Password',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                ?.copyWith(
                                                fontFamily: 'DMSans',
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: ThemeColor.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin:
                    const EdgeInsets.only(
                        top: 25,
                        bottom: 10,
                    left: 20),
                    child: Text(
                      "MY VIDEOS",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(
                          fontFamily:
                          'DMSans',
                          color: ThemeColor.black,fontSize: 30),
                      textAlign:
                      TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                                // margin: EdgeInsets.symmetric(),
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
                                        // color: Colors.black,
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
                                      // "${controller.videoList!.data![index].createdAt}",
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
            );
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: FloatingActionButton.extended(
            backgroundColor: ThemeColor.blue,
            onPressed: () async {
              Get.offAllNamed(AppRoutes.login);
            },
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),

          ),
        ),
      ),
    );
  }
  String capitalizeAllWord(String value) {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      result = result + value[i];
    }
    return result;
  }
}
