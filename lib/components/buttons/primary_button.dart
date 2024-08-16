import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentguide/constant.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final GestureTapCallback press;

  const PrimaryButton({super.key, required this.text, required this.press});
  @override
  Widget build(BuildContext context) {
    EdgeInsets verticalPadding =
        const EdgeInsets.symmetric(vertical: defaultPadding);
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: primaryColor),
        child: Center(
          child: buildText(context),
        ),
      ),
    );

    // SizedBox(
    //   width: double.infinity,
    //   child: Platform.isIOS
    //       ? CupertinoButton(
    //           padding: verticalPadding,
    //           // color: primaryColor,
    //           onPressed: press,
    //           child: buildText(context),
    //         )
    //       : ElevatedButton(

    //           style: TextButton.styleFrom(
    //             padding: verticalPadding,
    //             backgroundColor: primaryColor,

    //           ),
    //           onPressed: press,
    //           child: buildText(context),
    //         ),
    // );
  }

  Text buildText(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: kButtonTextStyle,
    );
  }
}
