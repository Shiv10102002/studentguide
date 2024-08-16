// main_screen.dart
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:studentguide/constant.dart';

import 'package:studentguide/controller/bottom_nav_controller.dart';
import 'package:studentguide/controller/message_action_controller.dart';
import 'package:studentguide/controller/task_controller.dart';
// import 'package:studentguide/view/ParentView/HomeScreen/parent_home_screen.dart';
import 'package:studentguide/view/chat/chat_screen.dart';
import 'package:studentguide/view/find_friend/find_friends_screen.dart';
import 'package:studentguide/view/find_teacher/find_teacher_screen.dart';
import 'package:studentguide/view/home/home_screen.dart';
import 'package:studentguide/view/latest_update/latest_update_screen.dart';
import 'package:studentguide/view/mcqgen/mcq_gen_screen.dart';
import 'package:studentguide/view/profile/profile_screen.dart';
import 'package:studentguide/view/summerize_story/summerize_story_screen.dart';
import 'package:studentguide/view/task/task_screen.dart';

class MainScreen extends StatelessWidget {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  final TaskController controller = Get.put(TaskController());
  final MessageActionsController messageController =
      Get.put(MessageActionsController());
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: bottomNavController.selectedIndex.value,
          children: [
            Navigator(
              key: Get.nestedKey(1),
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(builder: (context) {
                  switch (routeSettings.name) {
                    case '/':
                      return HomeScreen();
                    case '/mcq':
                      return McqGenScreen();
                    case '/summerize':
                      return SummarizeStroyScreen();
                    case '/findTeacher':
                      return FindTeacherSCreen();
                    case '/findFriend':
                      return FindFriendScreen();
                    case '/chat':
                      return ChatScreen();
                    case '/task':
                      return TaskScreen();
                    case '/latestUpdate':
                      return LatestUpdateScreen();
                    default:
                      return HomeScreen();
                  }
                });
              },
            ),

            // ParenHomeScreen(),
            ChatScreen(),
            TaskScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: (index) {
            if (index == 1) {
              Get.to(() => ChatScreen());
            } else {
              bottomNavController.changeIndex(index);
            }
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              icon: const Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                activeIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(Icons.chat),
                label: 'Chat'),
            BottomNavigationBarItem(
                activeIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Icon(
                    Icons.task,
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(Icons.task),
                label: 'Task'),
            BottomNavigationBarItem(
                activeIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(Icons.person),
                label: 'Profile'),
          ],
        ),
      );
    });
  }
}
