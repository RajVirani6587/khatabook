import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/controller/cilent_controller.dart';

import '../controller/dbhelpre_cilent.dart';

class AddCustomer_Screen extends StatefulWidget {
  const AddCustomer_Screen({Key? key}) : super(key: key);

  @override
  State<AddCustomer_Screen> createState() => _AddCustomer_ScreenState();
}

class _AddCustomer_ScreenState extends State<AddCustomer_Screen> {

  Cilent_Controller cilent_controller = Get.put(Cilent_Controller());
  TextEditingController txtname =TextEditingController();
  TextEditingController txtmoblie =TextEditingController();
  TextEditingController txtaddress =TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData()async{
    DbHelper db = DbHelper();
    cilent_controller.CilentList.value = await db.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue.shade700,
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon:Icon(Icons.arrow_back)),
            title: Text("Add Customer"),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: txtname,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    label: Text("Name"),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Colors.blue),
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: txtmoblie,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call),
                      prefixText: "+91 ",
                      label: Text("Mobile No"),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color: Colors.blue),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: txtaddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on_rounded),
                      label: Text("Address"),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color: Colors.blue),
                      )
                  ),
                ),
              ),

              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){
                    Get.back();
                  }, child: Text("Cancel"),style: ElevatedButton.styleFrom(primary: Colors.red),),

                  ElevatedButton(onPressed: (){
                    DbHelper  DB = DbHelper();
                    DB.insertData(txtname.text,txtaddress.text,txtmoblie.text);
                    getData();
                    Get.back();
                    }, child: Text("ADD"),style: ElevatedButton.styleFrom(primary: Colors.blue),),
                ],
              )
            ],
          ),
        )
    );
  }
}
