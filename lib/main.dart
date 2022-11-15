import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/view/add%20_customer_Screen.dart';
import 'package:khatabook/view/detile_screen.dart';
import 'package:khatabook/view/filterData_screen.dart';
import 'package:khatabook/view/firstScreen.dart';
import 'package:khatabook/view/paymetRemaind_Screen.dart';
import 'package:khatabook/view/paynetdone_screen.dart';

void main(){
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>First_Screen(),
        'add':(context)=>AddCustomer_Screen(),
        'detile':(context)=>Detile_Screen(),
        'remaind':(context)=>paymetRemaind_Screen(),
        'done':(context)=>PaymetDone_Screen(),
        'filter':(context)=>FilterDate_Screen(),
      },
    )
  );
}