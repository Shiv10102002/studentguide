// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:studentguide/constant.dart';

// class FeatureSlider extends StatelessWidget {
//   const FeatureSlider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<String> featureStr = [
//       'Daily Task',
//       'MCQ Gen',
//       'Summarize Story',
//       'Set Reminder',
//       'Find Teacher',
//       'Find Friend',
//       'Latest Update',
//     ];
//     final List<String> asseticon = [
//       'assets/icons/calander2.svg',
//       'assets/icons/mcq2.svg',
//       'assets/icons/summery2.svg',
//       'assets/icons/remiender2.svg',
//       'assets/icons/teacher2.svg',
//       'assets/icons/friend2.svg',
//       'assets/icons/news.svg',
//     ];

//     final List<String> routes = [
//       '/dailyTask',
//       '/mcqGen',
//       '/summarizeStory',
//       '/setReminder',
//       '/findTeacher',
//       '/findFriend',
//       '/latestUpdate',
//     ];

//     return ConstrainedBox(
//       constraints: const BoxConstraints(
//         minHeight: 100,
//         minWidth: 150,
//         maxHeight: 130,
//       ),
//       // adjust the height as needed
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: featureStr.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               Get.toNamed(routes[index]);
//             },
//             child: Container(
//               width: 150,
//               // adjust the width as needed
//               margin: const EdgeInsets.symmetric(horizontal: 8.0),
//               padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//               decoration: BoxDecoration(
//                 // color: primaryColor,
//                 border: Border.all(width: 1, color: primaryColor),
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundColor: Colors.grey,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: SvgPicture.asset(
//                         asseticon[index],
//                         height: MediaQuery.of(context).size.height,
//                         width: 150,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     textAlign: TextAlign.center,
//                     featureStr[index],
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';

class FeatureSlider extends StatefulWidget {
  const FeatureSlider({super.key});

  @override
  _FeatureSliderState createState() => _FeatureSliderState();
}

class _FeatureSliderState extends State<FeatureSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.4);
  late Timer _timer;

  final List<String> featureStr = [
    'Daily Task',
    'MCQ Gen',
    'Summarize Story',
    'Set Reminder',
    'Find Teacher',
    'Find Friend',
    'Latest Update',
  ];

  final List<String> asseticon = [
    'assets/icons/calander2.svg',
    'assets/icons/mcq2.svg',
    'assets/icons/summery2.svg',
    'assets/icons/remiender2.svg',
    'assets/icons/teacher2.svg',
    'assets/icons/friend2.svg',
    'assets/icons/news.svg',
  ];

  final List<String> routes = [
    '/dailyTask',
    '/mcqGen',
    '/summarizeStory',
    '/setReminder',
    '/findTeacher',
    '/findFriend',
    '/latestUpdate',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.page!.round() < featureStr.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 100,
        minWidth: 150,
        maxHeight: 130,
      ),
      child: PageView.builder(
        controller: _pageController,
        itemCount: featureStr.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(routes[index]);
            },
            child: Container(
              width: 150,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: primaryColor),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        asseticon[index],
                        height: MediaQuery.of(context).size.height,
                        width: 150,
                      ),
                    ),
                  ),
                  Text(
                    featureStr[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
