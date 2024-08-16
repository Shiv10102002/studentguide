// import 'package:flutter/material.dart';
// import 'constant.dart';

// ThemeData buildLightThemeData() {
//   return ThemeData(
//     primaryColor: primaryColor,
//     textTheme: TextTheme(
//         titleLarge: const TextStyle(color: Colors.black),
//         bodyMedium: const TextStyle(color: Colors.black87),
//         bodySmall: TextStyle(color: Colors.grey.shade800),
//         bodyLarge: TextStyle(color: Colors.grey.shade900)),
//     // accentColor: accentColor,
//     scaffoldBackgroundColor: const Color.fromARGB(220, 255, 255, 255),
//     fontFamily: "SF Pro Text",
//     appBarTheme: const AppBarTheme(
//       color: Color.fromRGBO(255, 255, 255, 0.95),
//       elevation: 0,
//       centerTitle: true,
//       iconTheme: IconThemeData(color: Colors.black),
//     ),
//     inputDecorationTheme: inputDecorationTheme.copyWith(
//         fillColor: const Color.fromARGB(255, 199, 198, 198)),
//     buttonTheme: buttonThemeData,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         selectedItemColor: primaryColor,
//         selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold)),
//   );
// }

// ThemeData buildDarkThemeData() {
//   return ThemeData(
//     primaryColor: primaryColor,
//     textTheme: const TextTheme(
//         titleLarge: TextStyle(color: Colors.white),
//         bodyMedium: TextStyle(color: Colors.white),
//         bodySmall: TextStyle(color: Colors.white),
//         bodyLarge: TextStyle(color: Colors.white)),
//     scaffoldBackgroundColor: const Color.fromARGB(235, 15, 47, 50),
//     fontFamily: "SF Pro Text",
//     appBarTheme: const AppBarTheme(
//       titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
//       // color: primaryColor,
//       color: Colors.transparent,
//       elevation: 0,
//       centerTitle: true,
//       iconTheme: IconThemeData(color: Colors.white),
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         selectedItemColor: primaryColor,
//         selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
//         unselectedItemColor: Colors.white),
//     iconTheme: const IconThemeData(color: primaryColor),
//     inputDecorationTheme: inputDecorationTheme.copyWith(
//       // fillColor: Colors.grey[800],
//       fillColor: const Color.fromARGB(58, 224, 223, 223),
//       focusedBorder: kDefaultOutlineInputBorder.copyWith(
//         borderSide: BorderSide(
//           width: 2,
//           color: primaryColor.withOpacity(0.9),
//         ),
//       ),
//       hintStyle: const TextStyle(color: Colors.white),
//       labelStyle: const TextStyle(color: Colors.white),
//     ),
//     buttonTheme: buttonThemeData,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//   );
// }

// final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
//   fillColor: inputColor,
//   filled: true,
//   contentPadding: const EdgeInsets.all(defaultPadding),
//   border: kDefaultOutlineInputBorder,
//   enabledBorder: kDefaultOutlineInputBorder,
//   focusedBorder: kDefaultOutlineInputBorder.copyWith(
//     borderSide: BorderSide(
//       color: primaryColor.withOpacity(0.5),
//     ),
//   ),
//   errorBorder: kDefaultOutlineInputBorder.copyWith(
//     borderSide: kErrorBorderSide,
//   ),
//   focusedErrorBorder: kDefaultOutlineInputBorder.copyWith(
//     borderSide: kErrorBorderSide,
//   ),
// );

// const ButtonThemeData buttonThemeData = ButtonThemeData(
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(8)),
//   ),
// );

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constant.dart';

ThemeData buildLightThemeData() {
  return ThemeData(
      primaryColor: primaryColor,
      // accentColor: accentColor,
      scaffoldBackgroundColor: const Color(0xFFF3F6FF),
      fontFamily: "SF Pro Text",
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(color: bodyTextColor, fontSize: 18)),
        // color: Colors.white,
        color: const Color(0xFFF3F6FF),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      inputDecorationTheme:
          inputDecorationTheme.copyWith(fillColor: Colors.white),
      buttonTheme: buttonThemeData,
      //text theme
      textTheme: TextTheme(
        bodyMedium: GoogleFonts.poppins(
            textStyle: const TextStyle(color: bodyTextColor, fontSize: 12)),
        bodySmall: GoogleFonts.poppins(
            textStyle: const TextStyle(color: bodyTextColor, fontSize: 10)),
        bodyLarge: GoogleFonts.poppins(
            textStyle: const TextStyle(color: bodyTextColor, fontSize: 16)),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedLabelStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontSize: 12,
                color: textaccentColor,
                fontWeight: FontWeight.w500)),
        selectedItemColor: primaryColor,
        selectedLabelStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(color: bodyTextColor, fontSize: 12)),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all<Color>(primaryColor),
        trackColor: MaterialStateProperty.all<Color>(primaryColor),
        trackBorderColor: MaterialStateProperty.all<Color>(primaryColor),
      ));
}

ThemeData buildDarkThemeData() {
  return ThemeData(
      primaryColor: primaryColor,
      // accentColor: accentColor,
      scaffoldBackgroundColor: const Color(0xFFF3F6FF),
      fontFamily: "SF Pro Text",
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(color: bodyTextColor, fontSize: 20)),
        color: const Color(0xFFF3F6FF),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      inputDecorationTheme:
          inputDecorationTheme.copyWith(fillColor: Colors.white),
      buttonTheme: buttonThemeData,
      //text theme
      textTheme: TextTheme(
        bodyMedium: GoogleFonts.poppins(
            textStyle: const TextStyle(color: bodyTextColor, fontSize: 12)),
        bodySmall: GoogleFonts.poppins(
            textStyle: const TextStyle(color: bodyTextColor, fontSize: 10)),
        bodyLarge: GoogleFonts.poppins(
            textStyle: const TextStyle(color: bodyTextColor, fontSize: 16)),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        selectedLabelStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(color: bodyTextColor, fontSize: 12)),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all<Color>(primaryColor),
        trackColor: MaterialStateProperty.all<Color>(primaryColor),
        trackBorderColor: MaterialStateProperty.all<Color>(primaryColor),
      ));
}

final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  fillColor: Colors.white,
  filled: true,
  contentPadding: const EdgeInsets.all(defaultPadding),
  border: kDefaultOutlineInputBorder.copyWith(
    borderRadius: BorderRadius.circular(12),
  ),
  enabledBorder: kDefaultOutlineInputBorder.copyWith(
    borderRadius: BorderRadius.circular(12),
  ),
  focusedBorder: kDefaultOutlineInputBorder.copyWith(
    borderSide: BorderSide(
      color: primaryColor.withOpacity(0.5),
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  errorBorder: kDefaultOutlineInputBorder.copyWith(
    borderSide: kErrorBorderSide,
    borderRadius: BorderRadius.circular(12),
  ),
  focusedErrorBorder: kDefaultOutlineInputBorder.copyWith(
    borderSide: kErrorBorderSide,
    borderRadius: BorderRadius.circular(12),
  ),
);
const ButtonThemeData buttonThemeData = ButtonThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
);
