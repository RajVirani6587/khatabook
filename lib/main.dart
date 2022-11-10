import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/view/add%20_customer_Screen.dart';
import 'package:khatabook/view/firstScreen.dart';

void main(){
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>First_Screen(),
        'add':(context)=>AddCustomer_Screen(),
      },
    )
  );
}