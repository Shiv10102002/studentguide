// profile_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/auth_controller.dart';
import 'package:studentguide/prefutils.dart';
import 'package:studentguide/view/auth/sign_in_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  // final AuthController controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        actions: [
          IconButton(
              onPressed: () {
                // controller.logout();
                Get.find<PrefUtils>().setLoginStatus(false);
                Get.offAll(() => SignInScreen());
              },
              icon: const Icon(
                Icons.logout,
                color: primaryColor,
              )),
        ],
      ),
      body: Center(
          child: Card(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Get.find<PrefUtils>().getUsername(),
                style: darksemibold16,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Text(
                Get.find<PrefUtils>().getEmailId(),
                style: darksemibold16,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
