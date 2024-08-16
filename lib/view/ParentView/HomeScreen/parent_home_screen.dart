import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/prefutils.dart';
import 'package:studentguide/view/nottifications/nottifications.dart';
import 'package:badges/badges.dart' as badges;
import 'package:studentguide/view/signUp/sign_up_screen.dart';

class ParenHomeScreen extends StatelessWidget {
  const ParenHomeScreen({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: defaultPadding, right: defaultPadding, top: defaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: FeatureContainer(
                          textcolor: Colors.white,
                          height: 150,
                          press: () {
                            Get.to(() => SignUpScreen());
                          },
                          text: "Add Student",
                          bgcolor: primaryColor)),
                  const SizedBox(
                    width: defaultPadding,
                  ),
                  Expanded(
                    child: FeatureContainer(
                      height: 150,
                      textcolor: bodyTextColor,
                      press: () {},
                      text: "Student Details",
                      bgcolor: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: primaryColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Tasks",
                          style: whitesemibolde16,
                          textScaler: TextScaler.noScaling,
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: defaultPadding, color: Colors.white)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureContainer extends StatelessWidget {
  const FeatureContainer(
      {super.key,
      required this.press,
      required this.text,
      required this.bgcolor,
      required this.height,
      required this.textcolor});
  final GestureTapCallback press;
  final String text;
  final Color bgcolor;
  final double height;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: bgcolor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: whitesemibolde16.copyWith(color: textcolor),
                    textScaler: TextScaler.noScaling,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: defaultPadding,
                  color: textcolor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
