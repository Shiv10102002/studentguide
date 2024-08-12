
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/controller/message_action_controller.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;

  final MessageActionsController controller =
      Get.put(MessageActionsController());
  MyMessageCard({
    super.key,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        controller.toggleActions(true);
      },
      onTap: () {
        controller.toggleActions(false);
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.grey,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 30,
                    top: 5,
                    bottom: 20,
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      date,
                      style:
                          const TextStyle(fontSize: 13, color: Colors.white60),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.done_all,
                      size: 20,
                      color: Colors.white60,
                    )
                  ],
                ),
                Obx(() {
                  if (controller.showActions.value) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => controller.copyMessage(),
                          icon: const Icon(Icons.copy),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () => controller.deleteMessage(),
                          icon: const Icon(Icons.delete),
                          color: Colors.white,
                        ),
                      ],
                    );
                  } else {
                    return Container(); // Empty container when actions are not shown
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
