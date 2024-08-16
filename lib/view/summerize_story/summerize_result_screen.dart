import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/summerize_controller.dart';

class SummerizeResultScreen extends StatelessWidget {
  SummerizeResultScreen(
      {super.key, required this.summery, required this.assests});

  final String summery;

  final File assests;

  final SummerizeController controller = Get.find<SummerizeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Summery Result",
          style: darknormal16.copyWith(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
            child: Image.file(controller.selectedImage!),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(
              child: Text(
            summery,
            style: darknormal14,
          )),
        ],
      ),
    );
  }
}
