import 'package:flutter/material.dart';
import 'package:studentguide/components/buttons/primary_button.dart';
import 'package:studentguide/constant.dart';

import '../../components/welcome_text.dart';

class ResetEmailSentScreen extends StatelessWidget {
  const ResetEmailSentScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeText(
                title: "Reset email sent",
                text: "We have sent a instructions email to \n the $email"),
            const SizedBox(height: defaultPadding),
            PrimaryButton(
              press: () {},
              text: "Send again",
            ),
          ],
        ),
      ),
    );
  }
}
