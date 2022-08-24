import 'package:flutter/material.dart';

//ref : https://dev.to/rohanjsh/custom-swatch-for-material-app-theme-primaryswatch-3kic
class Palette {
  static const MaterialColor primaryColor = MaterialColor(
    0xff264653, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff223f4b), //10%
      100: Color(0xff1e3842), //20%
      200: Color(0xff1b313a), //30%
      300: Color(0xff172a32), //40%
      400: Color(0xff13232a), //50%
      500: Color(0xff13232a), //60%
      600: Color(0xff0b1519), //70%
      700: Color(0xff080e11), //80%
      800: Color(0xff040708), //90%
      900: Color(0xff000000), //100%
    },
  );
}
