import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/components/buttons/primary_button.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/view/signUp/parent_signup_screen.dart';
import 'package:studentguide/view/signUp/sign_up_screen.dart';
import 'package:studentguide/view/signUp/teacher_signup_screen.dart';

// import '../../components/buttons/socal_button.dart';
import '../../components/welcome_text.dart';
import 'components/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Sign In"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const WelcomeText(
                title: "Welcome to",
                text: "Enter your Email address for sign in.",
              ),
              SignInForm(),
              const SizedBox(height: defaultPadding),
              // kOrText,
              const SizedBox(height: defaultPadding * 1.5),

              Center(
                child: Text.rich(
                  TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w600),
                    text: "Don’t have account? ",
                    children: <TextSpan>[
                      TextSpan(
                          text: "Create new account.",
                          style: const TextStyle(
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.bottomSheet(Container(
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(defaultPadding),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          PrimaryButton(
                                              text: "Parent Registration",
                                              press: () {
                                                Get.to(
                                                    () => ParentSignupScreen());
                                              }),
                                          const SizedBox(
                                            height: defaultPadding,
                                          ),
                                          PrimaryButton(
                                              text: "Teacher Registration",
                                              press: () {
                                                Get.to(() =>
                                                    TeacherSignupScreen());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                          //  Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => const SignUpScreen(),
                          //       ),
                          //     ),
                          )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
