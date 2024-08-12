import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/message_action_controller.dart';
import 'package:studentguide/dummy_data.dart';
import 'package:studentguide/view/chat/components/my_message_card.dart';
import 'package:studentguide/view/chat/components/send_message_card.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});

  final MessageActionsController controller =
      Get.find<MessageActionsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  ...messages.map((message) => (message['isMe'] == true
                      ? MyMessageCard(
                          message: message['text'], date: message['time'])
                      : SenderMessageCard(
                          message: message['text'], date: message['time'])))
                ]),
              ),
            ),
            FittedBox(
              child: SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          controller: controller.messageController,
                          onChanged: (val) {},
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Type a message',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(10),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send,
                            color: primaryColor,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
