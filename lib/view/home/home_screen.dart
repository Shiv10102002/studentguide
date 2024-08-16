// home_screen.dart
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/news_controller.dart';
import 'package:studentguide/prefutils.dart';
// import 'package:studentguide/dummy_data.dart';
import 'package:studentguide/view/ParentView/HomeScreen/parent_home_screen.dart';
// import 'package:studentguide/view/home/components/feature_slider.dart';
// import 'package:studentguide/view/home/components/task_slider.dart';
import 'package:studentguide/view/nottifications/nottifications.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final NewsController newscontroller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                Get.find<PrefUtils>().getUsername(),
                style: darksemibold16.copyWith(fontSize: 18),
                textScaler: TextScaler.noScaling,
              ),
              Text(
                Get.find<PrefUtils>().getEmailId(),
                style: darknormal14,
                textScaler: TextScaler.noScaling,
              )
            ],
          ),
          leading: const Padding(
            padding: EdgeInsets.only(left: defaultPadding * 0.5),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const NottificationsScreen());
                },
                icon: badges.Badge(
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: primaryColor,
                    ),
                    position: badges.BadgePosition.custom(top: -14, end: -8),
                    badgeContent: Text(
                      "0",
                      style: whitenormal10,
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: bodyTextColor,
                    ))),
            IconButton(
              onPressed: () {},
              icon: badges.Badge(
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: primaryColor,
                  ),
                  position: badges.BadgePosition.custom(top: -14, end: -8),
                  badgeContent: Text(
                    "0",
                    style: whitenormal10,
                  ),
                  child: const Icon(
                    Icons.chat_bubble_outline,
                    color: bodyTextColor,
                  )),
            ),
            const SizedBox(
              width: defaultPadding,
            )
          ],
        ),
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: 200,
            elevation: 6.0,
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Tap back again to exit'.tr,
              style: lightnormal14,
              textAlign: TextAlign.center,
            ),
            backgroundColor: primaryColor,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  // Text(
                  //   "Features",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .bodyLarge!
                  //       .copyWith(fontWeight: FontWeight.bold),
                  // ),
                  // const FeatureSlider(),

                  Row(
                    children: [
                      Expanded(
                          child: FeatureContainer(
                              textcolor: Colors.white,
                              height: 180,
                              press: () {
                                Get.nestedKey(1)
                                    ?.currentState
                                    ?.pushNamed('/mcq');
                              },
                              text: "Generate MCQ",
                              bgcolor: primaryColor)),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Expanded(
                        child: FeatureContainer(
                          height: 180,
                          textcolor: bodyTextColor,
                          press: () {
                            Get.nestedKey(1)
                                ?.currentState
                                ?.pushNamed('/summerize');
                          },
                          text: "Summarize Story",
                          bgcolor: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: defaultPadding,
                  ),

                  // const TaskSLider(),

                  SizedBox(
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FeatureContainer(
                              press: () {
                                Get.nestedKey(1)
                                    ?.currentState
                                    ?.pushNamed('/chat');
                              },
                              textcolor: bodyTextColor,
                              text: "Chat",
                              bgcolor: Colors.white,
                              height: 170),
                        ),
                        const SizedBox(
                          width: defaultPadding,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FeatureContainer(
                                  press: () {
                                    Get.nestedKey(1)
                                        ?.currentState
                                        ?.pushNamed('/findTeacher');
                                  },
                                  textcolor: Colors.white,
                                  text: "Find Teacher",
                                  bgcolor: primaryColor,
                                  height: 77),
                              const SizedBox(
                                height: defaultPadding,
                              ),
                              FeatureContainer(
                                  press: () {
                                    Get.nestedKey(1)
                                        ?.currentState
                                        ?.pushNamed('/findFriend');
                                  },
                                  textcolor: bodyTextColor,
                                  text: "Find Friend",
                                  bgcolor: Colors.white,
                                  height: 77),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),

                  Text(
                    "Todays Task",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),

                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              padding: const EdgeInsets.all(defaultPadding),
                              height: 97,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: index % 2 == 1
                                      ? const LinearGradient(colors: [
                                          textaccentColor,
                                          Color(0xFF7E869E)
                                        ])
                                      : const LinearGradient(colors: [
                                          Color(0xFFFFA15A),
                                          Color(0xFFFFA15A),
                                          accentColor
                                        ])),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Sheshya',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Ai Material',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: FeatureContainer(
                            height: 120,
                            press: () {
                              Get.nestedKey(1)
                                  ?.currentState
                                  ?.pushNamed('/task');
                            },
                            textcolor: Colors.white,
                            text: "Daily Task",
                            bgcolor: accentColor),
                      ),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Expanded(
                        child: FeatureContainer(
                            height: 120,
                            press: () {
                              Get.nestedKey(1)
                                  ?.currentState
                                  ?.pushNamed('/latestUpdate');
                            },
                            textcolor: Colors.white,
                            text: "Latest Update",
                            bgcolor: secondaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  // Text(
                  //   "Notes",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .bodyLarge!
                  //       .copyWith(fontWeight: FontWeight.bold),
                  // ),
                  // ...notesl.map((e) => Container(
                  //       decoration: const BoxDecoration(
                  //           border:
                  //               Border(bottom: BorderSide(color: Colors.grey))),
                  //       child: (ListTile(
                  //         leading: CircleAvatar(
                  //           radius: 30,
                  //           backgroundColor: Colors.grey,
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: SvgPicture.asset(
                  //               'assets/icons/summery2.svg',
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //         ),
                  //         title: Text(
                  //           e['name'],
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .bodyLarge!
                  //               .copyWith(overflow: TextOverflow.ellipsis),
                  //         ),
                  //         subtitle: Text(
                  //           e['discr'],
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .bodyMedium!
                  //               .copyWith(overflow: TextOverflow.ellipsis),
                  //         ),
                  //       )),
                  //     ))
                ],
              ),
            ),
          ),
        ));
  }
}
