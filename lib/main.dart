import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/auth_controller.dart';
import 'package:studentguide/controller/theme_controller.dart';
import 'package:studentguide/view/auth/sign_in_screen.dart';
import 'package:studentguide/view/chat/chat_screen.dart';
import 'package:studentguide/view/chat/message_screen.dart';
import 'package:studentguide/view/find_friend/find_friends_screen.dart';
import 'package:studentguide/view/find_teacher/find_teacher_screen.dart';
import 'package:studentguide/view/latest_update/latest_update_screen.dart';

import 'package:studentguide/view/main_screen/main_screen.dart';
import 'package:studentguide/view/mcqgen/mcq_gen_screen.dart';
import 'package:studentguide/view/set_remiender/set_remiender_screen.dart';
import 'package:studentguide/view/summerize_story/summerize_story_screen.dart';
import 'package:studentguide/view/task/task_screen.dart';

import 'theme.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  final AuthController authController = Get.put(AuthController());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Guide',
        theme: buildLightThemeData(),
        darkTheme: buildDarkThemeData(),
        themeMode: themeController.theme,
        initialRoute: authController.isAuthenticated.value ? '/' : '/login',
        getPages: [
          GetPage(
              name: '/',
              page: () => MainScreen(),
              middlewares: [AuthMiddleware()]),
          GetPage(name: '/login', page: () => const SignInScreen()),
          GetPage(name: '/dailyTask', page: () => const TaskScreen()),
          GetPage(name: '/mcqGen', page: () => const McqGenScreen()),
          GetPage(
              name: '/summarizeStory',
              page: () => const SummarizeStroyScreen()),
          GetPage(name: '/setReminder', page: () => const SetReminderScreen()),
          GetPage(name: '/findTeacher', page: () => FindTeacherSCreen()),
          GetPage(name: '/findFriend', page: () => FindFriendScreen()),
          GetPage(name: '/latestUpdate', page: () => LatestUpdateScreen()),
          GetPage(name: '/chat', page: () => ChatScreen(), children: [
            GetPage(name: '/massageScreen', page: () => const MessageScreen()),
          ])
        ],
      );
    });
  }
}

class AuthMiddleware extends GetMiddleware {
  final AuthController authController = Get.find<AuthController>();

  @override
  RouteSettings? redirect(String? route) {
    return authController.isAuthenticated.value
        ? null
        : const RouteSettings(name: '/login');
  }
}
