
import 'package:flutter/material.dart';

class Mediaquery{
  
  screenHeight(context){
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double screenHeight = screenSize.height;
    return screenHeight;
  }
  screenWidth(context){
     MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double screenWidth = screenSize.width;
    return screenWidth;
  }
}