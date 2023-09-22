import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_color.dart';

ThemeData myLightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  textTheme: textTheme,

  /// following https://oflutter.com/flutter-material-3-how-to-use-custom-colors/
  extensions: [lightCustomColors],
);
ThemeData myDarkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  textTheme: textTheme,

  /// following https://oflutter.com/flutter-material-3-how-to-use-custom-colors/
  extensions: [darkCustomColors],
);
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006A63),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF51FAEC),
  onPrimaryContainer: Color(0xFF00201D),
  secondary: Color(0xFF0060AA),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD3E4FF),
  onSecondaryContainer: Color(0xFF001C38),
  tertiary: Color(0xFF006B55),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF7FF8D3),
  onTertiaryContainer: Color(0xFF002118),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF030865),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF030865),
  surfaceVariant: Color(0xFFDAE5E2),
  onSurfaceVariant: Color(0xFF3F4947),
  outline: Color(0xFF6F7977),
  onInverseSurface: Color(0xFFF1EFFF),
  inverseSurface: Color(0xFF1E2578),
  inversePrimary: Color(0xFF1DDDD0),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006A63),
  outlineVariant: Color(0xFFBEC9C6),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF1DDDD0),
  onPrimary: Color(0xFF003733),
  primaryContainer: Color(0xFF00504B),
  onPrimaryContainer: Color(0xFF51FAEC),
  secondary: Color(0xFFA3C9FF),
  onSecondary: Color(0xFF282A42),
  secondaryContainer: Color(0xFF004882),
  onSecondaryContainer: Color(0xFFD3E4FF),
  tertiary: Color(0xFF61DBB7),
  onTertiary: Color(0xFF00382B),
  tertiaryContainer: Color(0xFF00513F),
  onTertiaryContainer: Color(0xFF7FF8D3),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF282A42),
  onBackground: Color(0xFFE0E0FF),
  surface: Color(0xFF232668),
  onSurface: Color(0xFFE0E0FF),
  surfaceVariant: Color(0xFF3F4947),
  onSurfaceVariant: Color(0xFFBEC9C6),
  outline: Color(0xFF899391),
  onInverseSurface: Color(0xFF282A42),
  inverseSurface: Color(0xFFE0E0FF),
  inversePrimary: Color(0xFF006A63),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF1DDDD0),
  outlineVariant: Color(0xFF3F4947),
  scrim: Color(0xFF000000),
);

var textTheme = TextTheme(
  //Display 57 45 36
  displayLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w200),

  displayMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w200),
  displaySmall: GoogleFonts.montserrat(fontWeight: FontWeight.w200),
  // displayLarge: const TextStyle(
  //   fontSize: 72,
  //   fontWeight: FontWeight.bold,
  // ),
  // Headline 32 28 24
  headlineLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w200),
  headlineMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
  headlineSmall: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
  // Title 22 16 14
  titleLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
  titleMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
  titleSmall: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
  // body 16 14 12
  bodyLarge: GoogleFonts.notoSans(),
  bodyMedium: GoogleFonts.notoSans(),
  bodySmall: GoogleFonts.notoSans(),
);
// ColorScheme.fromSeed(
//     seedColor: Color(0xFF00D7CA),
//     background: Color(0xDDE1F0F7),
//     primary: Color(0xFF3DEEB7),
//     onPrimary: const Color(0x730A0DBA),
//     secondary: Color(0xFF135DFE),
//     onSecondary: const Color(0x730A0DBA),
//     tertiary: Colors.yellow,

//     // natural: Colors.brown,
//     // custom1: Colors.black,
//     // custom2: Colors.white,
//     brightness: Brightness.light,
//   ),