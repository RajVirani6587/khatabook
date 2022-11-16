import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splesh_Screen extends StatefulWidget {
  const splesh_Screen({Key? key}) : super(key: key);

  @override
  State<splesh_Screen> createState() => _splesh_ScreenState();
}

class _splesh_ScreenState extends State<splesh_Screen> {
  @override
  Widget build(BuildContext context) {
    isLogin();
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/video/11793-books-stack.json",fit: BoxFit.fill),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("K",style: TextStyle(fontSize: 30,color: Colors.blue.shade50,fontWeight: FontWeight.bold),),
                    Text("h",style: TextStyle(fontSize: 30,color: Colors.blue.shade100,fontWeight: FontWeight.bold),),
                    Text("a",style: TextStyle(fontSize: 30,color: Colors.blue.shade200,fontWeight: FontWeight.bold),),
                    Text("t",style: TextStyle(fontSize: 30,color: Colors.blue.shade300,fontWeight: FontWeight.bold),),
                    Text("a",style: TextStyle(fontSize: 30,color: Colors.blue.shade400,fontWeight: FontWeight.bold),),
                    Text("B",style: TextStyle(fontSize: 30,color: Colors.blue.shade500,fontWeight: FontWeight.bold),),
                    Text("o",style: TextStyle(fontSize: 30,color: Colors.blue.shade600,fontWeight: FontWeight.bold),),
                    Text("o",style: TextStyle(fontSize: 30,color: Colors.blue.shade700,fontWeight: FontWeight.bold),),
                    Text("k",style: TextStyle(fontSize: 30,color: Colors.blue.shade800,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
  void isLogin()async {
    Timer(Duration(seconds: 6),
          () => Get.offAllNamed('first'),
    );
  }

}