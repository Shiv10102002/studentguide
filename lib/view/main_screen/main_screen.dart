// main_screen.dart
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:studentguide/controller/bottom_nav_controller.dart';
import 'package:studentguide/controller/task_controller.dart';
import 'package:studentguide/view/chat/chat_screen.dart';
import 'package:studentguide/view/home/home_screen.dart';
import 'package:studentguide/view/profile/profile_screen.dart';
import 'package:studentguide/view/task/task_screen.dart';

class MainScreen extends StatelessWidget {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  final TaskController controller = Get.put(TaskController());

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: bottomNavController.selectedIndex.value,
          children: [
            const HomeScreen(),
            ChatScreen(),
            const TaskScreen(),
            const ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: (index) {
            bottomNavController.changeIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                decoration: BoxDecoration(
                    color: Colors.green.shade500,
                    borderRadius: BorderRadius.circular(12)),
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
                      color: Colors.green.shade500,
                      borderRadius: BorderRadius.circular(12)),
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
                      color: Colors.green.shade500,
                      borderRadius: BorderRadius.circular(12)),
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
                      color: Colors.green.shade500,
                      borderRadius: BorderRadius.circular(12)),
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
