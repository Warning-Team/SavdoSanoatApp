
import 'package:flutter/material.dart';

abstract class PhoneSize{
  
 static  screenHeight(context){
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double screenHeight = screenSize.height;
    return screenHeight;
  }
 static screenWidth(context){
     MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double screenWidth = screenSize.width;
    return screenWidth;
  }
}