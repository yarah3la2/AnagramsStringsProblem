import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_task/Utilties/AppConstants.dart';
import 'package:flutter_ui_task/Utilties/UtilitiesWidgets.dart';
import 'package:flutter_ui_task/Utilties/UtilityMethods.dart';
import 'package:flutter_ui_task/model/CartItem.dart';

class MyCartListScreen extends StatefulWidget {
  @override
  _MyCartListScreenState createState() => _MyCartListScreenState();
}

class _MyCartListScreenState extends State<MyCartListScreen> {
  bool isItemsIntiated=false;
  List<CartItem> cartItems=[];
  double totalItemsPrice = 0;

  @override
  Widget build(BuildContext context) {
    if(!isItemsIntiated){
      cartItems = [
        CartItem("Basic", "Black . L", 20.90, 0, BASIC_IMG),
        CartItem("Caps", "Black . L", 10.90, 0, CAPS_IMG),
        CartItem("Kids", "Black . L", 8.40, 0, KIDS_IMG),
        CartItem("Outfit", "Black . L", 12.70, 0, OUTFIT_IMG),
        CartItem("Pants", "Black . L", 20.90, 0, PANTS_IMG),
        CartItem("Dress", "Black . L", 20.90, 0, DRESS_IMG),
        CartItem("Shoes", "Black . L", 20.90, 0, SHOES_IMG),
      ];
      isItemsIntiated=true;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: WHITE,
        appBar: HomeAppBar(context,TEXT_CONST_HOME_LIST_APPBAR_TITLE, true,onAppBarBackIconPressed,AppBarType.appbarWithBack),
        body: MyCartListScreenBody(),
      ),
    );
  }

  // helping widgets
  Widget MyCartListScreenBody() {
    return Column(
      children: <Widget>[
        Expanded(child: MyCartListItems()),
        checkOutButtomCard()
      ],
    );
  }

  Widget MyCartListItems() {
    return Container(
      padding: EdgeInsets.all(7),
      child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, position) =>
              buildCartListItemsCard(context, position)),
    );
  }

  Widget buildCartListItemsCard(BuildContext context, int position) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          getItemImageWidget(position),
          buildItemDetailsWidget(position)
        ],
      ),
    );
  }

  Widget getItemImageWidget(int position) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ROUNDED_CORNER_RADIUS),
      child: Image(
        fit: BoxFit.fill,
        image: Image.asset(cartItems[position].itemImage).image,
        height: getScreenHeight(context) * 0.14,
        width: getScreenHeight(context) * 0.14,
      ),
    );
  }

   Padding buildItemDetailsWidget(int position){
    return  Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 4, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            cartItems[position].itemName,
            style: NORMAL_BLACK_TEXTSTYLE,
          ),
          Text(
            cartItems[position].itemDetails,
            style: NORMAL_GREY_TEXTSTYLE,
          ),
          SizedBox(
            height: getScreenHeight(context) * 0.025,
          ),
          Container(
            width: getScreenWidth(context) * 0.61,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  DOLLAR_SIGN + '${cartItems[position].itemPrice}',
                  style: NORMAL_BOLD_TEXTSTYLE,
                ),
                getItemsQuantityWidget(position)
              ],
            ),
          )
        ],
      ),
    );
   }

  Widget getItemsQuantityWidget(int position) {
    return Row(
      children: <Widget>[
        incremantDecrementWidget(DECREMENT_OPERATION, position),
        Container(
          width: getScreenWidth(context) * 0.09,
          padding: EdgeInsets.only(top: 1, bottom: 1),
          color: LIGHT_GREY,
          child: Center(child: Text('${cartItems[position].itemQuantity}')),
        ),
        incremantDecrementWidget(INCREMENT_OPERATION, position),
      ],
    );
  }

  Widget incremantDecrementWidget(String operation, int position) {
    return Container(
        width: getScreenWidth(context) * 0.07,
        child: GestureDetector(
            onTap: () => onQuantityOperationTapped(operation, position),
            child: Center(
              child: Text(
                operation,
                style: NORMAL_BLACK_TEXTSTYLE,
              ),
            )));
  }

  Widget checkOutButtomCard() {
    return Padding(
      padding:const EdgeInsets.fromLTRB(18.0, 10, 25, 10),
      child: Container(
        height: getScreenHeight(context) * 0.11,
        color: WHITE,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  Text_TOTAL_CHECKOUT_CARD,
                  style: NORMAL_GREY_TEXTSTYLE,
                ),
                Text(
                  DOLLAR_SIGN + "$totalItemsPrice",
                  style: NORMAL_BOLD_TEXTSTYLE,
                )
              ],
            ),
            SizedBox(
              height: getScreenHeight(context) * 0.008,
            ),
            roundedGradientBlueButton(context,BUTTON_CHECKOUT,null),
          ],
        ),
      ),
    );
  }

// helping methods
  onQuantityOperationTapped(String operation, int position) {
    switch (operation) {
      case DECREMENT_OPERATION:
        setState(() {
          (cartItems[position].itemQuantity > 0)
              ? cartItems[position].itemQuantity--
              : null;
        });
        calculateTotalItemsPrice();  //////
        break;
      case INCREMENT_OPERATION:
        setState(() {
          cartItems[position].itemQuantity++;
        });
        calculateTotalItemsPrice(); //////////////
    }
  }
  calculateTotalItemsPrice() {
    totalItemsPrice = 0;
    cartItems.forEach((item) {
      setState(() {
        totalItemsPrice += item.itemPrice * item.itemQuantity;
      });
    });
  }
  onAppBarBackIconPressed() {
    exit(0);
  }

}
