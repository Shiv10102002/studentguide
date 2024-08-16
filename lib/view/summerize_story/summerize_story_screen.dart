import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:studentguide/components/buttons/primary_button.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/summerize_controller.dart';
import 'package:studentguide/dummy_data.dart';
import 'package:studentguide/prefutils.dart';
import 'package:studentguide/view/summerize_story/summerize_result_screen.dart';

class SummarizeStroyScreen extends StatelessWidget {
  SummarizeStroyScreen({super.key});

  final SummerizeController controller = Get.put(SummerizeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Summerize Notes"),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.bottomSheet(SingleChildScrollView(
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Obx(() => controller.selectedImage != null
                  ? Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Image.file(controller.selectedImage!),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryButton(
                                  text: "ReUpload",
                                  press: () {
                                    controller.pickImage();
                                  }),
                              const SizedBox(
                                width: defaultPadding,
                              ),
                              PrimaryButton(
                                  text: "Get Summery",
                                  press: () {
                                    controller.getSummery();
                                  }),
                            ],
                          )
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: accentColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        Text(
                          "Upload image",
                          style: darknormal14,
                          textScaler: TextScaler.noScaling,
                        )
                      ],
                    )),
            ),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(30)),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Summerize Notes",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //     child: Text(
              //   'Recent Summarize story',
              //   style: Theme.of(context)
              //       .textTheme
              //       .bodyLarge!
              //       .copyWith(fontWeight: FontWeight.bold),
              // )),
              // const SizedBox(
              //   height: defaultPadding,
              // ),
              // Column(
              //   children: controller.allsummary.map((e) {
              //     return GestureDetector(
              //       onTap: () {
              //         Get.to(() => SummerizeResultScreen(
              //             summery: e['summary'], assests: e['imagePath']));
              //       },
              //       child: Container(
              //         decoration: const BoxDecoration(
              //             border:
              //                 Border(bottom: BorderSide(color: Colors.grey))),
              //         child: ListTile(
              //           leading: CircleAvatar(
              //             radius: 30,
              //             backgroundColor: Colors.grey,
              //             child: Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: SvgPicture.asset(
              //                 'assets/icons/summery2.svg',
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //           title: Text(
              //             e['summary'] ?? '',
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .bodyLarge!
              //                 .copyWith(overflow: TextOverflow.ellipsis),
              //           ),
              //           subtitle: Text(
              //             e['imagePath'] ?? '',
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .bodyMedium!
              //                 .copyWith(overflow: TextOverflow.ellipsis),
              //           ),
              //         ),
              //       ),
              //     );
              //   }).toList(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:studentguide/components/buttons/primary_button.dart';
// import 'package:studentguide/constant.dart';
// import 'package:studentguide/controller/summerize_controller.dart';

// class SummarizeStoryScreen extends StatelessWidget {
//   SummarizeStoryScreen({super.key});

//   final SummerizeController controller = Get.put(SummerizeController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Summarize Notes"),
//       ),
//       floatingActionButton: InkWell(
//         onTap: () {
//           Get.bottomSheet(SingleChildScrollView(
//             child: Container(
//               height: 400,
//               width: MediaQuery.of(context).size.width,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(5), topRight: Radius.circular(5)),
//               ),
//               child: Obx(() => controller.selectedImage != null
//                   ? Padding(
//                       padding: const EdgeInsets.all(defaultPadding),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Container(
//                             height: 200,
//                             width: MediaQuery.of(context).size.width,
//                             child: Image.file(controller.selectedImage!),
//                           ),
//                           PrimaryButton(
//                               text: "Get Summary",
//                               press: () {
//                                 controller.getSummery();
//                               })
//                         ],
//                       ),
//                     )
//                   : Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             controller.pickImage();
//                           },
//                           child: Container(
//                             height: 100,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               color: accentColor,
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: const Center(
//                               child: Icon(
//                                 Icons.add,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: defaultPadding,
//                         ),
//                         Text(
//                           "Upload image",
//                           style: darknormal14,
//                           textScaler: TextScaler.noScaling,
//                         )
//                       ],
//                     )),
//             ),
//           ));
//         },
//         child: Container(
//           decoration: BoxDecoration(
//               color: primaryColor, borderRadius: BorderRadius.circular(30)),
//           child: const Padding(
//             padding: EdgeInsets.all(12),
//             child: Text(
//               "Summarize Notes",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                   child: Text(
//                 'Recent Summarize Story',
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyLarge!
//                     .copyWith(fontWeight: FontWeight.bold),
//               )),
//               const SizedBox(
//                 height: defaultPadding,
//               ),
//               // Use .toList() to convert the map to a List of Widgets
//               Column(
//                 children: controller.allsummary.map((e) {
//                   return Container(
//                     decoration: const BoxDecoration(
//                         border: Border(bottom: BorderSide(color: Colors.grey))),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         radius: 30,
//                         backgroundColor: Colors.grey,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: SvgPicture.asset(
//                             'assets/icons/summery2.svg',
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       title: Text(
//                         e['summary'] ?? '',
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyLarge!
//                             .copyWith(overflow: TextOverflow.ellipsis),
//                       ),
//                       subtitle: Text(
//                         e['imagePath'] ?? '',
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyMedium!
//                             .copyWith(overflow: TextOverflow.ellipsis),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
