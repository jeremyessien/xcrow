import 'package:flutter/material.dart';

import '../util/utils/brand_colors.dart';

TextTheme darkTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1!.copyWith(
      fontSize: 50,
      letterSpacing: 3,
      color: BrandColors.colorBackground,
      fontWeight: FontWeight.bold,
    ),
    headline2: base.headline2!.copyWith(
      fontSize: 23,
    ),
    headline3: base.headline3!.copyWith(
      fontSize: 33,
      letterSpacing: 5,
    ),
     headline4: base.headline4!.copyWith(
      fontSize: 15,
      color: BrandColors.colorBackground,

    ),

    headline5: base.headline5!.copyWith(
      fontSize: 35,
      // color: Colors.pink,
    ),
    headline6: base.headline6!.copyWith(
      fontSize: 30,
      letterSpacing: 5,
      // color: Colors.amber,
    ),
  );
}

//LIGHT MODE
TextTheme _lightTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1!.copyWith(
      fontSize: 50,
      letterSpacing: 3,
      color: BrandColors.colorBackground,
      fontWeight: FontWeight.bold,
    ),

    headline2: base.headline2!.copyWith(
      fontSize: 23,
      color: BrandColors.colorBackground,
    ),

    //?  3
    headline3: base.headline3!.copyWith(
      fontSize: 33,
      letterSpacing: 5,
    ),

    //? 4
    headline4: base.headline4!.copyWith(
      fontSize: 15,
      color: BrandColors.colorBackground,

    ),

    //? 5
    headline5: base.headline5!.copyWith(
      fontSize: 35,
      letterSpacing: 5,
    ),

    //? 6
    headline6: base.headline6!.copyWith(
      fontSize: 30,
      letterSpacing: 5,
    ),
  );
}

//! TEXTSTYLES
class AppTextStyle {
  // AppTextStyle._();
  final TextStyle appBarTextStyle = const TextStyle(
    fontSize: 16.0,
  );
  final TextStyle navBarTextStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );
}

class MyTheme {
  //! DARK THEME
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: BrandColors.colorTextDark,
    appBarTheme: AppBarTheme(
      backgroundColor: BrandColors.colorPrimaryDark,
      titleTextStyle: AppTextStyle().appBarTextStyle,
    ),
    primaryColor: const Color(0xff272c3a),
    cardColor: BrandColors.colorPrimaryDark,
    iconTheme: const IconThemeData(color: BrandColors.colorBrown),
    drawerTheme: const DrawerThemeData(
      backgroundColor: BrandColors.colorTextDark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: BrandColors.colorPrimaryDark,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: BrandColors.colorLightGray,
      unselectedLabelStyle: AppTextStyle().navBarTextStyle,
      labelStyle: AppTextStyle().navBarTextStyle,
      labelColor: BrandColors.colorLightGray,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: const EdgeInsets.all(5),
      indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: BrandColors.colorLightGray,
            width: 3,
            style: BorderStyle.solid,
          ),
          insets: EdgeInsets.all(5)),
    ),
    // bottomAppBarColor:
    bottomAppBarTheme: const BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      color: BrandColors.colorPrimaryDark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: BrandColors.colorPrimaryDark,
      elevation: 5,
      selectedItemColor: BrandColors.colorGreen,
      unselectedItemColor: BrandColors.colorLightGray,
      selectedLabelStyle: AppTextStyle().navBarTextStyle,
      unselectedLabelStyle: AppTextStyle().navBarTextStyle,
    ),
    highlightColor: BrandColors.colorTextLight,
    // canvasColor: ColorConstant.shapeColorDarkBg,
    textTheme: darkTextTheme(ThemeData.dark().textTheme),
  );

//! LIGHT THEME
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: BrandColors.colorBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: BrandColors.colorBrown,
      titleTextStyle: AppTextStyle().appBarTextStyle,
    ),
    cardColor: BrandColors.colorBrown,
    drawerTheme: const DrawerThemeData(
      backgroundColor: BrandColors.colorBackground,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: BrandColors.colorBrown,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    highlightColor: BrandColors.colorTextLight,

    tabBarTheme: TabBarTheme(
      unselectedLabelColor: BrandColors.colorLightGray,
      unselectedLabelStyle: AppTextStyle().navBarTextStyle,
      labelStyle: AppTextStyle().navBarTextStyle,
      labelColor: BrandColors.colorLightGray,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: BrandColors.colorLightGray,
            width: 3,
            style: BorderStyle.solid,
          ),
          insets: EdgeInsets.all(5)),
    ),
    // bottomAppBarColor:
    bottomAppBarTheme: const BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      color: BrandColors.colorBrown,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: BrandColors.colorBrown,
        elevation: 5,
        selectedItemColor: BrandColors.colorPrimaryDark,
        unselectedItemColor: BrandColors.colorLightGray,
        selectedLabelStyle: AppTextStyle().navBarTextStyle,
        unselectedLabelStyle: AppTextStyle().navBarTextStyle),
    // highlightColor: Color.fromARGB(255, 4, 30, 31),
    // highlightColor: ColorConstant.shapeColorDarkBg,

    primaryColor: Colors.red,
    iconTheme: const IconThemeData(color: Color(0xff000000), opacity: 0.7),
    // canvasColor: ColorConstant.shapeColorLightBg,
    textTheme: _lightTextTheme(ThemeData.light().textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xff58A4EB),
      selectionHandleColor: Color(0xff58A4EB),
      cursorColor: Color(0xff58A4EB),
    ),
    colorScheme:
        const ColorScheme.light().copyWith(secondary: const Color(0xff858585)),
  );
}
