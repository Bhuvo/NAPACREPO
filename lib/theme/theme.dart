import 'package:flutter/material.dart';

class MTheme {
  static BorderRadius cardRadius = BorderRadius.circular(12);
  static OutlinedBorder buttonShape =
  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
  static const TextStyle buttonTextStyle =
  TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const EdgeInsets buttonPadding =
  EdgeInsets.symmetric(horizontal: 24, vertical: 16);

  static const BorderRadius bottomRadius = BorderRadius.only(
    bottomLeft: Radius.circular(24),
    bottomRight: Radius.circular(24),
  );
  static const BorderRadius topRadius = BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );
  static const RoundedRectangleBorder bottomCurve = RoundedRectangleBorder(
      borderRadius: bottomRadius);
  static RoundedRectangleBorder cardShape = RoundedRectangleBorder(
      borderRadius: cardRadius);

  static MaterialColor get themeColor => Colors.orange;
  // static Color get primary => Colors.yellow;
  static Color get primary => Color(0xffffa032);
  // static const Color  primary = Color(0xffffa032);
  static  ThemeData get lightTheme => ThemeData(
      progressIndicatorTheme: ProgressIndicatorThemeData(
        linearTrackColor: Colors.grey.shade200,
        circularTrackColor: Colors.grey.shade200,
        linearMinHeight: 8,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.selected)){
            return primary;
          }
          return Colors.grey;
        }),
        visualDensity: VisualDensity.compact,
      ),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states){
            if(states.contains(MaterialState.selected)){
              return primary;
            }
            return Colors.grey;
          }),
          visualDensity: VisualDensity.compact,
          checkColor: MaterialStateProperty.all(Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)
          )
      ),
      dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          surfaceTintColor: Colors.transparent,
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black87
          )
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      ),
      primarySwatch: themeColor,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: themeColor,
        brightness: Brightness.light,

      ).copyWith(
          primary: primary
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.grey.shade50,
      dividerColor: Colors.grey.shade300,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: Colors.black87
          )
      ),
      dividerTheme: DividerThemeData(color: Colors.grey.shade300, space: 0),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: buttonShape, side: BorderSide(color: themeColor))),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              shape: buttonShape,
              textStyle: buttonTextStyle,
              padding: buttonPadding,
              foregroundColor: Colors.white)),
      dialogBackgroundColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              shape: buttonShape,
              textStyle: buttonTextStyle,
              padding: buttonPadding,
              backgroundColor: primary.withOpacity(0.1))),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        labelStyle: const TextStyle(fontSize: 14),
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300)),
      ));

  static  ThemeData get darkTheme => ThemeData(
      primarySwatch: themeColor,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: themeColor,
        brightness: Brightness.dark,
      ).copyWith(
          primary: primary,
          secondary: themeColor
      ),
      cardColor: Colors.black,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
          )
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.grey.shade900,
      dividerColor: Colors.grey.shade700,
      dividerTheme: const DividerThemeData(color: Colors.grey, space: 0),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: buttonShape, side: BorderSide(color: themeColor))),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              shape: buttonShape,
              textStyle: buttonTextStyle,
              padding: buttonPadding,
              foregroundColor: Colors.white)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              shape: buttonShape,
              textStyle: buttonTextStyle,
              padding: buttonPadding,
              backgroundColor: primary.withOpacity(0.1))),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        labelStyle: const TextStyle(fontSize: 14),
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
        filled: true,
        fillColor: Colors.grey.shade900,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey)),
      ));
}
