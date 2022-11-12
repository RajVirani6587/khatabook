import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/controller/product_conttroller.dart';

import '../controller/cilent_controller.dart';
import '../controller/dbhelpre_cilent.dart';
import 'detile_screen.dart';

class paymetRemaind_Screen extends StatefulWidget {
  const paymetRemaind_Screen({Key? key}) : super(key: key);

  @override
  State<paymetRemaind_Screen> createState() => _paymetRemaind_ScreenState();
}

class _paymetRemaind_ScreenState extends State<paymetRemaind_Screen> {


  Product_Controller product_controller = Get.put(Product_Controller());
  Cilent_Controller cilent_controller = Get.put(Cilent_Controller());

  TextEditingController txtproductname  =TextEditingController();
  TextEditingController txtquantity     =TextEditingController();
  TextEditingController txtprice        =TextEditingController();
  TextEditingController txtpurchasedate =TextEditingController();

  @override
  void initState() {
    super.initState();
    getDataPro();
  }

  void getDataPro()async{
    DbHelper pdb = DbHelper();
    product_controller.ProductList.value = await pdb.readData();
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
                  },
                    icon: Icon(Icons.refresh)),
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
                    textInputAction: TextInputAction.next,
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
                        return 'Enter Amout';
                      }
                      else{
                        return null;
                      }
                    },

                    controller: txtprice,
                    textInputAction: TextInputAction.next,
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
                Text("* Required",style: TextStyle(color: Colors.red),),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    textInputAction: TextInputAction.next,
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
                    textInputAction: TextInputAction.next,
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


                SizedBox(height: 10,),


                ElevatedButton(onPressed: (){
                  if(txtkey.currentState!.validate() == true){
                    Get.to(Detile_Screen());
                  }
                  DbHelper PDB = DbHelper();
                  PDB.ProinsertData(txtproductname.text,txtquantity.text,txtprice.text,txtpurchasedate.text,int.parse(cilent_controller.Datapick!.id!),0);
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
