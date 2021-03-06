import 'package:flutter/material.dart';
import 'package:veacos/app/shared/utils/themes/constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryColorLight,
    primaryColorDark: kPrimaryColorDark,
    secondaryHeaderColor: kblue,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kblue, foregroundColor: kLight),
    indicatorColor: kPrimaryColor,
    chipTheme: ChipThemeData(backgroundColor: kLightGrey),
    scaffoldBackgroundColor: kLight,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: kPrimaryColor,
      elevation: kElevation,
    ),
    cardColor: kPrimaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: kWhite,
      foregroundColor: kDarkGrey,
      iconTheme: const IconThemeData(
        color: kblue,
      ),
    ),
    iconTheme: IconThemeData(color: klightGrey),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kLight,
      elevation: 24,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: darkPrimaryColor,
    primaryColorLight: darkPrimaryColorLight,
    primaryColorDark: darkPrimaryColorDark,
    secondaryHeaderColor: darkblue,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: darkblue, foregroundColor: darkLight),
    indicatorColor: darkPrimaryColor,
    chipTheme: ChipThemeData(backgroundColor: darkLightGrey),
    scaffoldBackgroundColor: darkLight,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: darkPrimaryColor,
      elevation: kElevation,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: kDardBlueGrey,
      iconTheme: const IconThemeData(
        color: kblue,
      ),
    ),
    iconTheme: const IconThemeData(color: kblue),
    colorScheme: ColorScheme.light(
      primary: darkPrimaryColor,
      secondary: klightGrey,
      error: darkErrorColor,
    ),
    dialogBackgroundColor: kligthBlueGrey,
    inputDecorationTheme: InputDecorationTheme(iconColor: klightGrey),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkDarkGrey,
      selectedItemColor: darkContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: darkContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: darkPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}
