import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/prefutils.dart';
import 'package:studentguide/view/auth/sign_in_screen.dart';

class ParentProfileScreen extends StatelessWidget {
  const ParentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Screen",
          style: darksemibold16.copyWith(fontSize: 18),
          textScaler: TextScaler.noScaling,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.find<PrefUtils>().setLoginStatus(false);
                Get.offAll(() => SignInScreen());
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: primaryColor,
              ))
        ],
      ),
    );
  }
}
