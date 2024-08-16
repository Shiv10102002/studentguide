import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
// // clolors that we use in our app
// const titleColor = Color(0xFF010F07);
// // const primaryColor = Color(0xFF22A45D);
// const primaryColor = Color(0xFF2C87FF);
// const accentColor = Color(0xFFFF872C);

// // const bodyTextColor = Color(0xFF868686);
// const bodyTextColor = Color(0xFF374957);
// const iconColor = Color(0xFFDFE2E4);

// const inputColor = Color(0xFFFBFBFB);
// const dbodyTextColor = Color.fromARGB(255, 248, 248, 248);
// const dinputColor = Color.fromARGB(181, 255, 255, 255);
// const daccentColor = Color.fromARGB(255, 230, 200, 159);
// const dprimaryColor = Color.fromARGB(255, 9, 162, 200);

// clolors that we use in our app
const titleColor = Color(0xFF010F07);
const primaryColor = Color(0xFF2C87FF);
const accentColor = Color(0xFFFF872C);
const textaccentColor = Color(0xFF7E869E);
const bodyTextColor = Color(0xFF374957);
const secondaryTextColor = Color(0xFF838A8F);
const dividecolor = Color(0xFFD9D9D9);
const inputColor = Color(0xFFFBFBFB);
const iconColor = Color(0xFFDFE2E4);
const strokeColor = Color(0xFFEAEAEA);
const secondaryColor = Color(0xFFD5DAE7);
const tirtiaryTextColor = Color(0xFFBFBFBF);
const inverseTextColor = Color(0xFFFFF8F8);
const lightPinkColor = Color(0xFFFA4D5E);

const primaryLowVersonColor = Color(0xFFA8CDFF);
const double defaultPadding = 16;
const questionColor = Color(0xFF1B1446);
const Duration kDefaultDuration = Duration(milliseconds: 250);

const TextStyle kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

const EdgeInsets kTextFieldPadding = EdgeInsets.symmetric(
  horizontal: defaultPadding,
  vertical: defaultPadding,
);

// Text Field Decoration
const OutlineInputBorder kDefaultOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(6)),
  borderSide: BorderSide(
    color: Color(0xFFF3F2F2),
  ),
);

const InputDecoration otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.zero,
  counterText: "",
  errorStyle: TextStyle(height: 0),
);

const kErrorBorderSide = BorderSide(color: Colors.red, width: 1);

// Validator

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: 'Enter a valid email address')
]);

final phoneNumberValidator = MinLengthValidator(10,
    errorText: 'Phone Number must be at least 10 digits long');

//textstyle type
//textstyle with fontsize 14

final TextStyle whitsemibold14 = GoogleFonts.poppins(
    textStyle: const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 14,
));

final TextStyle whitenormal14 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400));

final TextStyle darksemibold14 = GoogleFonts.poppins(
    textStyle: const TextStyle(
  color: bodyTextColor,
  fontWeight: FontWeight.w600,
  fontSize: 14,
));

final TextStyle darknormal14 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: bodyTextColor, fontSize: 14, fontWeight: FontWeight.w400));
final TextStyle lightsemibold14 = GoogleFonts.poppins(
    textStyle: const TextStyle(
  color: secondaryTextColor,
  fontWeight: FontWeight.w600,
  fontSize: 14,
));
final TextStyle lightnormal14 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: secondaryTextColor, fontSize: 14, fontWeight: FontWeight.w400));

//textstyle with fontsize 16

final TextStyle darknormal16 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: bodyTextColor, fontSize: 16, fontWeight: FontWeight.w400));
final TextStyle darksemibold16 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: bodyTextColor, fontSize: 16, fontWeight: FontWeight.w600));

final TextStyle whitenormal16 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400));
final TextStyle whitesemibolde16 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600));

final TextStyle lightsemibold16 = GoogleFonts.poppins(
    textStyle: const TextStyle(
  color: secondaryTextColor,
  fontWeight: FontWeight.w600,
  fontSize: 16,
));
final TextStyle lightnormal16 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: secondaryTextColor, fontSize: 16, fontWeight: FontWeight.w400));

//textstyle with fontsize 12

final TextStyle darknormal12 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: bodyTextColor, fontSize: 12, fontWeight: FontWeight.w400));

final TextStyle darksemibold12 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: bodyTextColor, fontSize: 12, fontWeight: FontWeight.w600));

final TextStyle whitenormal12 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400));
final TextStyle whitesemibolde12 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600));

final TextStyle lightsemibold12 = GoogleFonts.poppins(
    textStyle: const TextStyle(
  color: secondaryTextColor,
  fontWeight: FontWeight.w600,
  fontSize: 12,
));
final TextStyle lightnormal12 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: secondaryTextColor, fontSize: 12, fontWeight: FontWeight.w400));

//textstyle with fontsize 10

final TextStyle darknormal10 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: bodyTextColor, fontSize: 10, fontWeight: FontWeight.w400));

final TextStyle darksemibold10 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: bodyTextColor, fontSize: 10, fontWeight: FontWeight.w600));

final TextStyle whitenormal10 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400));
final TextStyle whitesemibolde10 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600));

final TextStyle lightsemibold10 = GoogleFonts.poppins(
    textStyle: const TextStyle(
  color: secondaryTextColor,
  fontWeight: FontWeight.w600,
  fontSize: 10,
));
final TextStyle lightnormal10 = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: secondaryTextColor, fontSize: 10, fontWeight: FontWeight.w400));

//

// Validator
final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-/])',
      errorText: 'Passwords must have at least one special character')
]);

final requiredValidator =
    RequiredValidator(errorText: 'This field is required');
final matchValidator = MatchValidator(errorText: 'passwords do not match');

// Common Text
final Center kOrText = Center(
    child: Text("Or", style: TextStyle(color: titleColor.withOpacity(0.7))));

final List<String> featureStr = [
  'Daily Task',
  'MCQ Gen',
  'Summerize story',
  'Set Remiender',
  'Find Teacher',
  'Find Friend',
  'Latest Update',
];
final List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];
final List<String> weekdays = [
  'mon',
  'tue',
  'wed',
  'thr',
  'fri',
  'sat',
  'sun',
];
final List<int> years = List<int>.generate(31, (i) => 2000 + i);
