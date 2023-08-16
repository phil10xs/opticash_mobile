import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opticash_mobile/core/utils/colors.dart';

var theme = VulteTheme().light;

class VulteTheme {
  static VulteTheme? _instance;

  factory VulteTheme() {
    return _instance ??= VulteTheme._internal();
  }

  VulteTheme._internal();

  var light = ThemeData(
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Rogerex",
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: appColor.primary,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: appColor.subTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Rogerex",
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: appColor.white,
      ),
      bodySmall: const TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: appColor.white,
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: appColor.white,
        systemStatusBarContrastEnforced: false,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    iconTheme: IconThemeData(color: appColor.primary),
    primaryColor: appColor.primary,
    scaffoldBackgroundColor: appColor.white,
    drawerTheme: DrawerThemeData(
      backgroundColor: appColor.white,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: appColor.white,
      secondary: appColor.white,
    ),
    disabledColor: const Color.fromRGBO(74, 85, 104, 1),
    cardTheme: CardTheme(
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 5,
      color: const Color.fromRGBO(242, 242, 247, 1),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        iconColor: appColor.primary,
        backgroundColor: appColor.black,
        textStyle: TextStyle(
          fontFamily: "Rogerex",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: appColor.subTextColor,
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateColor.resolveWith((states) => appColor.primary),
      thumbColor: MaterialStateColor.resolveWith((states) => appColor.white),
      //
      // splashRadius: 20
    ),
    tabBarTheme: TabBarTheme(
      labelColor: appColor.white,
      unselectedLabelColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(color: appColor.primary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: appColor.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    ),
    radioTheme: RadioThemeData(
        fillColor:
            MaterialStateColor.resolveWith((states) => appColor.primary)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isCollapsed: true,
      isDense: true,
      fillColor: appColor.white,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: appColor.white,
        ),
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: appColor.white,
        ),
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: appColor.white,
        ),
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
      hintStyle: TextStyle(
        color: appColor.black.withOpacity(0.6),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelStyle: TextStyle(
        color: appColor.black.withOpacity(0.6),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: appColor.white,
        ),
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
    ),
  );
}
