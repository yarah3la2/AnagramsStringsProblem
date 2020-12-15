
import 'package:flutter/material.dart';
import 'package:flutter_ui_task/Utilties/AppConstants.dart';
import 'package:flutter_ui_task/Utilties/UtilityMethods.dart';
enum AppBarType{
  appbarWithBack,
  appbarWithoutBack
}
Widget HomeAppBar(BuildContext context,String appBarTitle , bool withBack ,Function onIconPressed,AppBarType appBarType ) {
  return AppBar(
    title: Text(
      appBarTitle,
      style: APPBAR_TEXTSTYLE,
    ),
    backgroundColor: WHITE,
    elevation: 0,
    automaticallyImplyLeading: appBarType == AppBarType.appbarWithBack,
    leading: appBarType == AppBarType.appbarWithBack ? backIcon(context,onIconPressed) : null,
  );
}

Widget backIcon(context,Function onBackIconPressed) {
  return GestureDetector(
      onTap: () => onBackIconPressed,
      child: Align(
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: BLACK,
          ),
          iconSize: 30,
        ),
      ));
}

Widget roundedGradientBlueButton(BuildContext context,String buttonText,Function onPressed){
  return Container(
    height: getScreenHeight(context) * 0.065,
    width: getScreenWidth(context) * 0.9,
    decoration: ShapeDecoration(
      shape: buildButtonDecoration(),
      gradient: LinearGradient(
        colors: [LIGHT_BLUE, DARK_BLUE],
      ),
    ),
    child: MaterialButton(
      elevation: 1,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: buildButtonDecoration(),
      child: Text(
        buttonText,
        style: BUTTON_NORMAL_WHITE_TEXTSTYLE,
      ),
      onPressed: null,
    ),
  );
}