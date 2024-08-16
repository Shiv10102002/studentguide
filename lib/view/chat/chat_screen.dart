import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/chat_menu_controller.dart';
import 'package:studentguide/controller/chat_tab_controller.dart';
import 'package:studentguide/dummy_data.dart';
import 'package:studentguide/view/chat/message_screen.dart'; // Ensure this import statement is correct

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatMenuController _menuController = Get.put(ChatMenuController());
  final ChatTabController _tabController = Get.put(ChatTabController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Chat Screen",
            style: darksemibold16.copyWith(fontSize: 18),
          ),
          actions: [
            PopupMenuButton<String>(
              color: primaryColor,
              icon: const Icon(Icons.more_vert),
              onSelected: (value) => _menuController.onMenuSelected(value),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Create Group',
                  child: Text(
                    'Create Group',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Find Teacher',
                  child: Text(
                    'Find Teacher',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Find Friend',
                  child: Text(
                    'Find Friend',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Settings',
                  child: Text(
                    'Settings',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.17),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      // suffixIcon: Icon(
                      //   Icons.search,
                      //   color: Theme.of(context).iconTheme.color,
                      // ),

                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      prefixIconConstraints: const BoxConstraints(
                          minHeight: 25,
                          maxHeight: 25,
                          minWidth: 25,
                          maxWidth: 65),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SvgPicture.asset(
                          'assets/icons/searchnormal.svg',
                          height: 20,
                          width: 20,
                          colorFilter: const ColorFilter.mode(
                              primaryColor, BlendMode.srcIn),
                        ),
                      ),
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TabBar(
                    dividerHeight: 0,
                    isScrollable: true,
                    tabAlignment: TabAlignment.center,
                    splashBorderRadius: BorderRadius.circular(20),
                    labelColor: primaryColor,
                    indicatorColor: primaryColor,
                    unselectedLabelStyle:
                        Theme.of(context).textTheme.bodyMedium,
                    controller: _tabController.tabController,
                    onTap: (index) => _tabController.changeIndex(index),
                    tabs: const [
                      Tab(
                        text: 'All',
                      ),
                      Tab(text: 'Group'),
                      Tab(text: 'Friend'),
                      Tab(text: 'Teacher'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController.tabController,
          children: [
            // Center(child: Text('All')),
            SingleChildScrollView(
              child: Column(
                children: [
                  ...friendsl.map((e) => (ListTile(
                        onTap: () {
                          Get.to(() => MessageScreen());
                        },
                        leading: const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          e['name'],
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        subtitle: Text(
                          e['lastchat'],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: Text(
                          e['onlinetime'],
                          style: const TextStyle(color: primaryColor),
                        ),
                      ))),
                ],
              ),
            ),
            const Center(child: Text('Group')),
            const Center(child: Text('Friend')),
            const Center(child: Text('Teacher')),
          ],
        ),
      ),
    );
  }
}
