// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/dummy_data.dart';
import 'package:studentguide/view/home/components/feature_slider.dart';
import 'package:studentguide/view/home/components/task_slider.dart';
import 'package:studentguide/view/nottifications/nottifications.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('User Name'),
              Text(
                'User email',
                style: Theme.of(context).textTheme.bodySmall,
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
                    badgeContent: const Text("0"),
                    child: const Icon(Icons.notifications))),
            IconButton(
              onPressed: () {},
              icon: badges.Badge(
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: primaryColor,
                  ),
                  position: badges.BadgePosition.custom(top: -14, end: -8),
                  badgeContent: const Text("0"),
                  child: const Icon(Icons.chat_bubble)),
            ),
            const SizedBox(
              width: defaultPadding,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "Features",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const FeatureSlider(),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "Current Task",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                const TaskSLider(),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "Notes",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                ...notesl.map((e) => Container(
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: (ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/icons/summery2.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          e['name'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(overflow: TextOverflow.ellipsis),
                        ),
                        subtitle: Text(
                          e['discr'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(overflow: TextOverflow.ellipsis),
                        ),
                      )),
                    ))
              ],
            ),
          ),
        ));
  }
}
