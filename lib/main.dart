// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// // import 'package:studentguide/constant.dart';
// import 'package:studentguide/controller/auth_controller.dart';
// import 'package:studentguide/controller/theme_controller.dart';
// import 'package:studentguide/prefutils.dart';
// import 'package:studentguide/view/ParentView/parent_main_screen.dart';
// import 'package:studentguide/view/auth/sign_in_screen.dart';
// import 'package:studentguide/view/chat/chat_screen.dart';
// import 'package:studentguide/view/chat/message_screen.dart';
// import 'package:studentguide/view/find_friend/find_friends_screen.dart';
// import 'package:studentguide/view/find_teacher/find_teacher_screen.dart';
// import 'package:studentguide/view/latest_update/latest_update_screen.dart';

// import 'package:studentguide/view/main_screen/main_screen.dart';
// import 'package:studentguide/view/mcqgen/mcq_gen_screen.dart';
// import 'package:studentguide/view/set_remiender/set_remiender_screen.dart';
// import 'package:studentguide/view/summerize_story/summerize_story_screen.dart';
// import 'package:studentguide/view/task/task_screen.dart';

// import 'theme.dart';

// void main() async {
//   // await GetStorage.init();
//   await initServices();
//   runApp(MyApp());
// }

// Future<void> initServices() async {
//   Get.log('starting services ...');
//   await Get.putAsync(() => PrefUtils().init());
//   // await Get.putAsync(() => ApiProvider().init());
//   // await Get.putAsync(() => AuthService().init());
//   Get.log('All services started...');
// }

// class MyApp extends StatelessWidget {
//   final ThemeController themeController = Get.put(ThemeController());
//   // final AuthController authController = Get.put(AuthController());
//   MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Student Guide',
//         theme: buildLightThemeData(),
//         darkTheme: buildDarkThemeData(),
//         themeMode: themeController.theme,
//         initialRoute: _determineInitialRoute(),
//         getPages: [
//           GetPage(name: '/', page: () => MainScreen()),
//           GetPage(name: '/login', page: () => const SignInScreen()),
//           GetPage(name: '/dailyTask', page: () => TaskScreen()),
//           GetPage(name: '/mcqGen', page: () => const McqGenScreen()),
//           GetPage(
//               name: '/summarizeStory',
//               page: () => const SummarizeStroyScreen()),
//           GetPage(name: '/setReminder', page: () => const SetReminderScreen()),
//           GetPage(name: '/findTeacher', page: () => FindTeacherSCreen()),
//           GetPage(name: '/findFriend', page: () => FindFriendScreen()),
//           GetPage(name: '/latestUpdate', page: () => LatestUpdateScreen()),
//           GetPage(name: '/chat', page: () => ChatScreen(), children: [
//             GetPage(name: '/massageScreen', page: () => MessageScreen()),
//             GetPage(name: '/parentMain', page: () => ParentMainScreen()),
//           ])
//         ],
//       );
//     });
//   }

//   String _determineInitialRoute() {
//     bool isLoggedIn = Get.find<PrefUtils>().getLoginStatus();
//     String role = Get.find<PrefUtils>().getRole();

//     if (isLoggedIn) {
//       if (role == 'parent') {
//         return '/parentMain';
//       } else if (role == 'student') {
//         return '/';
//       } else if (role == '') {
//         return '/login';
//       }
//     }
//     return '/login';
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/controller/theme_controller.dart';
import 'package:studentguide/prefutils.dart';
import 'package:studentguide/provider/api_provider.dart';
import 'package:studentguide/view/ParentView/parent_main_screen.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  Get.log('starting services ...');
  await Get.putAsync(() => PrefUtils().init());
  await Get.putAsync(() => ApiProvider().init());
  Get.log('All services started...');
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
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
        initialRoute: _determineInitialRoute(),
        getPages: [
          GetPage(name: '/', page: () => MainScreen()),
          GetPage(name: '/login', page: () => const SignInScreen()),
          GetPage(name: '/dailyTask', page: () => TaskScreen()),
          GetPage(name: '/mcqGen', page: () => const McqGenScreen()),
          GetPage(name: '/summarizeStory', page: () => SummarizeStroyScreen()),
          GetPage(name: '/setReminder', page: () => const SetReminderScreen()),
          GetPage(name: '/findTeacher', page: () => FindTeacherSCreen()),
          GetPage(name: '/findFriend', page: () => FindFriendScreen()),
          GetPage(name: '/latestUpdate', page: () => LatestUpdateScreen()),
          GetPage(name: '/chat', page: () => ChatScreen(), children: [
            GetPage(name: '/massageScreen', page: () => MessageScreen()),
            GetPage(name: '/parentMain', page: () => ParentMainScreen()),
          ])
        ],
      );
    });
  }

  String _determineInitialRoute() {
    final prefUtils = Get.find<PrefUtils>();
    bool isLoggedIn = prefUtils.getLoginStatus();
    String role = prefUtils.getRole();
    debugPrint("role is $role");

    if (isLoggedIn) {
      if (role == 'parent') {
        return '/parentMain';
      } else if (role == 'student') {
        return '/';
      } else {
        return '/login';
      }
    }
    return '/login';
  }
}
