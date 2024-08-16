import 'package:flutter/material.dart';

import 'package:studentguide/constant.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final List<Tab> tabs;

  const CustomTabBar({
    required this.controller,
    required this.tabs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        dividerHeight: 0,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        tabAlignment: TabAlignment.center,
        controller: controller,
        tabs: tabs,
        indicator: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        labelColor: Colors.white,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: -16),
      ),
    );
  }
}
