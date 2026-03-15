import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ─────────────────────────────────────────────
//  App Strings
// ─────────────────────────────────────────────
class AppStrings {
  AppStrings._(); // prevent instantiation

  // App Info
  static const String appName = 'Collab';
  static const String appTagline = 'Connect. Create. Collab.';

  // Auth - Login
  static const String loginTitle = 'Login or Signup';
  static const String emailLabel = 'Email or phone number';
  static const String continueBtn = 'Continue';
  static const String orContinueWith = 'or continue with';

  // Auth - Social
  static const String googleLabel = 'Google';
  static const String appleLabel = 'Apple';
}

// ─────────────────────────────────────────────
//  App Assets
// ─────────────────────────────────────────────
class AppAssets {
  AppAssets._();

  // Images
  static const String logoBlackOnWhite =
      'assets/images/collabLOGOWhiteBlack.png';
}

// ─────────────────────────────────────────────
//  Genty Font Helper
// ─────────────────────────────────────────────
class GentyFont {
  GentyFont._();

  static const String _family = 'Genty';

  /// Returns a [TextStyle] using the Genty font.
  /// Override [fontSize], [color], [fontWeight], or [letterSpacing] as needed.
  static TextStyle style({
    double fontSize = 16,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: _family,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }
}

// ─────────────────────────────────────────────
//  App Text Styles  (using Inter from Google Fonts)
// ─────────────────────────────────────────────
class AppTextStyles {
  AppTextStyles._(); // prevent instantiation

  /// App name — rendered in Genty
  static TextStyle appName =
      GentyFont.style(fontSize: 40, fontWeight: FontWeight.normal);

  /// Small muted tagline
  static TextStyle tagline = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: const Color.fromARGB(255, 0, 0, 0),
  );

  /// Large section heading (e.g. "Login or Signup")
  static TextStyle heading = GoogleFonts.inter(
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  /// Body / default text
  static TextStyle body = GoogleFonts.inter(
    fontSize: 14,
  );

  /// Button label
  static TextStyle button = GoogleFonts.inter(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  /// Divider label  ("or continue with")
  static TextStyle dividerLabel = GoogleFonts.inter(
    fontSize: 13,
    color: Colors.grey,
  );

  /// Social button label
  static TextStyle socialLabel = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

// ─────────────────────────────────────────────
//  App Colors
// ─────────────────────────────────────────────
class AppColors {
  AppColors._();

  static const Color primary = Colors.black;
  static const Color scaffold = Colors.white;
  static const Color inputFill = Color(0xFFF5F5F5); // grey.shade100 equivalent
  static const Color border = Color(0xFFE0E0E0); // grey.shade300 equivalent
}
