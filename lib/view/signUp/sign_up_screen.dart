import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentguide/constant.dart';

import 'package:studentguide/view/signUp/components/sign_up_form.dart';

// import '../../components/buttons/socal_button.dart';
import '../../components/welcome_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("SignUp "),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: [
                const WelcomeText(
                  title: "Create Account",
                  text:
                      "Enter your Name,College name, Class, Email and Password for sign up.",
                ),

                // Sign Up Form
                SignUpForm(),
                const SizedBox(height: 16),

                // Already have account
                Center(
                  child: Text.rich(
                    TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w500),
                      text: "Already have account? ",
                      children: <TextSpan>[
                        TextSpan(
                            text: " Sign In",
                            style: const TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed('/login');
                              }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    "By Signing up you agree to our Terms \nConditions & Privacy Policy.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
                // kOrText,
                // const SizedBox(height: 16),

                // // Facebook
                // SocalButton(
                //   press: () {},
                //   text: "Connect with Facebook",
                //   color: const Color(0xFF395998),
                //   icon: SvgPicture.asset(
                //     'assets/icons/facebook.svg',
                //     color: const Color(0xFF395998),
                //   ),
                // ),
                // const SizedBox(height: 16),

                // // Google
                // SocalButton(
                //   press: () {},
                //   text: "Connect with Google",
                //   color: const Color(0xFF4285F4),
                //   icon: SvgPicture.asset(
                //     'assets/icons/google.svg',
                //   ),
                // ),
                // const SizedBox(height: defaultPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
