import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/controller/cilent_controller.dart';

class Detile_Screen extends StatefulWidget {
  const Detile_Screen({Key? key}) : super(key: key);

  @override
  State<Detile_Screen> createState() => _Detile_ScreenState();
}

class _Detile_ScreenState extends State<Detile_Screen> {
  Cilent_Controller cilent_controller = Get.put(Cilent_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700,
          elevation: 0,
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon:Icon(Icons.arrow_back)),
          title: Text("🙍‍ ${cilent_controller.Datapick!.name}"),
          actions: [
            IconButton(onPressed: (){}, icon:Icon(Icons.call)),
          ],
        ),
          body: Column(
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width*1,
                color: Colors.blue.shade700,
                child: Center(
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width*0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
