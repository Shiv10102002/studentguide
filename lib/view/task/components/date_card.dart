import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:studentguide/constant.dart';

class DateCard extends StatelessWidget {
  DateCard({
    super.key,
    required this.date,
    required this.controller,
    required this.isBeforeToday,
    required this.weekdays,
    required this.isSelected,
  });

  final DateTime date;
  var controller;
  final bool isBeforeToday;
  final List<String> weekdays;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: 50,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: date.day == controller.selectedDate.value.day &&
                    date.month == controller.selectedDate.value.month &&
                    date.year == controller.selectedDate.value.year
                ? accentColor
                : isBeforeToday
                    ? secondaryColor
                    : Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => Text(
                  weekdays[date.weekday - 1],
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: date.day == controller.selectedDate.value.day &&
                              date.month ==
                                  controller.selectedDate.value.month &&
                              date.year == controller.selectedDate.value.year
                          ? Colors.white
                          : isBeforeToday
                              ? date.day == controller.selectedDate.value.day &&
                                      date.month ==
                                          controller.selectedDate.value.month &&
                                      date.year ==
                                          controller.selectedDate.value.year
                                  ? Colors.white
                                  : bodyTextColor
                              : bodyTextColor,
                      fontWeight: date.day ==
                                  controller.selectedDate.value.day &&
                              date.month ==
                                  controller.selectedDate.value.month &&
                              date.year == controller.selectedDate.value.year
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  textScaler: TextScaler.noScaling,
                ),
              ),
              Obx(
                () => Text(
                  date.day.toString(),
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: date.day == controller.selectedDate.value.day &&
                                date.month ==
                                    controller.selectedDate.value.month &&
                                date.year == controller.selectedDate.value.year
                            ? Colors.white
                            : isBeforeToday
                                ? date.day ==
                                            controller.selectedDate.value.day &&
                                        date.month ==
                                            controller
                                                .selectedDate.value.month &&
                                        date.year ==
                                            controller.selectedDate.value.year
                                    ? Colors.white
                                    : bodyTextColor
                                : bodyTextColor,
                        fontWeight: date.day ==
                                    controller.selectedDate.value.day &&
                                date.month ==
                                    controller.selectedDate.value.month &&
                                date.year == controller.selectedDate.value.year
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 14),
                  ),
                  textScaler: TextScaler.noScaling,
                ),
              ),
            ],
          ),
        ));
  }
}
