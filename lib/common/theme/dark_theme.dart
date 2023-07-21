
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/common/utils/coloors.dart';

import '../extension/custom_theme_extension.dart';

ThemeData darkTheme(){
  final ThemeData base = ThemeData.dark();
  const ColorScheme originalScheme = ColorScheme.light();
  return base.copyWith(
    scaffoldBackgroundColor: Coloors.backgroundDark,
      extensions: [
        CustomThemeExtension.darkMode
      ],
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 18),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Coloors.greenDark,
          foregroundColor: Coloors.backgroundDark,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent,
      )
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Coloors.greyBackground,
      modalBackgroundColor: Coloors.greyBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20)
        )
      )
    ),
    dialogBackgroundColor: Coloors.greyBackground,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      )
    ),
    colorScheme: originalScheme.copyWith(
      background: Coloors.backgroundDark
    )
  );
}