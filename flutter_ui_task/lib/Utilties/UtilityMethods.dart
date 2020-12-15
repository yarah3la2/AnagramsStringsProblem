import 'package:flutter/material.dart';
import 'package:flutter_ui_task/Utilties/AppConstants.dart';
//get screen size methods
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// decoration helping methods
RoundedRectangleBorder buildButtonDecoration(){
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(ROUNDED_CORNER_RADIUS),
  );
}
