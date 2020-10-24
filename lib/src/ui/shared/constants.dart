import 'dart:core';
import 'dart:ui';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class AppIcons {
  static const left_arrow_black =
      'lib/src/assets/icons/left_arrow_back_button.png';
  static const menu_black = 'lib/src/assets/icons/menu_app.png';
  static const hamburger = 'lib/src/assets/icons/hamburger.png';
}

class AppImages {
  static const emptyBox = 'img_empty_box.png';
}

class ConstantsNumber {
  static int initialRadiusInMeter = 25;
}

class Colour {
  static const Color primary = Color(0xffccd0d5);
  static const Color secondary = Color(0xffffffff);
  static const Color tertiary = Color(0xff000000);
  static const Color black = Color(0xff000000);
  static const Color boxColor = Color(0xffeeeeee);
  static const Color green = Colors.green;
  static const Color red = Color(0xfffe4a49);
  static const Color lightRed = Color(0xffff7272);
  static const Color silver = Color(0xffbdbdbd);
  static const Color textHint = Color(0xffa1a19e);
  static final Color transparent = Colors.transparent;
  static const Color white = Color(0xffffffff);
  static const Color yellow = Color(0xfffed766);
  static const Color skyBlue = Color(0xff2ab7ca);
  static const Color darkSkyBlue = Color(0xff2ab7ca);
  static const Color blue = Colors.blue;
}

class CustomSize {
  static const content = 14.0;
  static const subContent = 12.0;
  static const heading = 20.0;
  static const subHeading = 16.0;
  static const subTitle = 11.0;
  static const title = 18.0;

  static const h1 = 32.0;
  static const h2 = 24.0;
  static const h3 = 18.72;
  static const h4 = 16.0;
  static const h5 = 13.28;
  static const h6 = 10.72;

  static const avatarSize = 40.0;
  static const avatarSizeLarge = 50.0;
  static const avatarSizeXL = 60.0;

  static const appBarHeight = 50.0;
  static const statusBarHeight = 24.0;
}

class DateTimeHelper{

  static String toDDMMYY(int time){
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(time);

    DateFormat df = DateFormat('dd MMM yyy hh:mm');

//    return "${dt.day} ${} ${dt.year}";
    return df.format(dt);
  }
}

class Url {
  static var baseUrl = 'http://www.gyanos.com/aarti/api/data';

  static final basicDetail = baseUrl + '/basic_detail';
  static final menuList = baseUrl + '/menu_list';
}

class TStyle {
  TextStyle headerStyle = TextStyle(fontWeight: FontWeight.w500);
}

class Constants {
  static String hi = 'हिं';
  static String ta = 'ସ';
  static String or = 'ଓ';
  static String en = 'En';

  static String employeeList = 'Employee list';
  static String editEmployee = 'Edit employee';
  static String addEmployee = 'Add employee';
  static String edit = 'Edit';
  static String save = 'Save';
  static String add = 'Add';
  static String confirm = 'Confirm';
  static String cancel = 'Cancel';
  static String close = 'Close';
}
