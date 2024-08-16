import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/bottom_nav_controller.dart';
import 'package:studentguide/view/ParentView/ChatScreen/parent_chat_screen.dart';
import 'package:studentguide/view/ParentView/HomeScreen/parent_home_screen.dart';
import 'package:studentguide/view/ParentView/ParentProfile/profile_screen.dart';

class ParentMainScreen extends StatelessWidget {
  ParentMainScreen({super.key});
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: bottomNavController.selectedIndex.value,
          children: [
            const ParenHomeScreen(),
            ParentChatScreen(),
            ParentProfileScreen()
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
                    color: primaryColor,
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
                      color: primaryColor,
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
                      color: primaryColor,
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
