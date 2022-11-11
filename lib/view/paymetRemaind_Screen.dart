import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cilent_controller.dart';
import '../controller/dbhelpre_cilent.dart';
import 'detile_screen.dart';

class paymetRemaind_Screen extends StatefulWidget {
  const paymetRemaind_Screen({Key? key}) : super(key: key);

  @override
  State<paymetRemaind_Screen> createState() => _paymetRemaind_ScreenState();
}

class _paymetRemaind_ScreenState extends State<paymetRemaind_Screen> {


  Cilent_Controller cilent_controller = Get.put(Cilent_Controller());

  TextEditingController txtproductname  =TextEditingController();
  TextEditingController txtquantity     =TextEditingController();
  TextEditingController txtprice        =TextEditingController();
  TextEditingController txtpurchasedate =TextEditingController();
  TextEditingController txtpendingdate  =TextEditingController();

  @override
  void initState() {
    super.initState();
    getDataPro();
  }

  void getDataPro()async{
    DbHelper pdb = DbHelper();
    cilent_controller.CilentList.value = await pdb.ProreadData();
  }

  var txtkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.shade700,
              leading: IconButton(onPressed: (){
                Get.back();
              }, icon:Icon(Icons.arrow_back)),
              centerTitle: false,
              title: Text("Add Payment"),
              actions: [
                IconButton(onPressed: (){
                  txtproductname.clear();
                  txtquantity.clear();
                  txtprice.clear();
                  txtpurchasedate.clear();
                  txtpendingdate.clear();
                }, icon: Icon(Icons.refresh)),
              ],
            ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: txtproductname,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        label: Text("Customer Product"),
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
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Emter Amout';
                      }
                      else{
                        return null;
                      }
                    },
                    controller: txtprice,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.currency_rupee),
                        label: Text("Amout"),
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
                    controller: txtquantity,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.queue_rounded),
                        label: Text("Quantity"),
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
                    controller: txtpurchasedate,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.date_range),
                        label: Text("Purchasedate"),
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
                    controller: txtpendingdate,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.date_range),
                        label: Text("Pendingdate"),
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


                ElevatedButton(onPressed: (){
                  if(txtkey.currentState!.validate() == true){
                    Get.to(Detile_Screen());
                  }
                  DbHelper PDB = DbHelper();
                  PDB.ProinsertData(txtproductname.text,txtquantity.text,txtprice.text,txtpurchasedate.text,txtpendingdate.text);
                  getDataPro();
                  // Get.back();
                }, child: Text("SAVE"),style: ElevatedButton.styleFrom(primary: Colors.blue.shade700),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
