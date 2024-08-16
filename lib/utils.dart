import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL({required String url}) async {
  Uri uri = Uri.parse(url);
  try {
    await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
  } catch (e) {
    Get.snackbar(
      'ERROR!',
      'Error opening url! ${url}',
      backgroundColor: secondaryColor,
      colorText: Colors.red,
    );
  }
}
