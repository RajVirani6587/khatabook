import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/view/firstScreen.dart';

void main(){
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>First_Screen(),
      },
    )
  );
}