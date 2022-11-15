import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khatabook/controller/product_conttroller.dart';
import 'package:khatabook/view/firstScreen.dart';

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

  TextEditingController txtproductname = TextEditingController();
  TextEditingController txtquantity = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtpurchasedate = TextEditingController();



  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    DbHelper db = DbHelper();
    product_controller.ProductList.value = await db.readData();
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
            leading: IconButton(
                onPressed: () {
                  Get.off(Detile_Screen());
                },
                icon: Icon(Icons.arrow_back)),
            centerTitle: false,
            title: Text("Add Payment"),
            actions: [
              IconButton(
                  onPressed: () {
                    txtproductname.clear();
                    txtquantity.clear();
                    txtprice.clear();
                    txtpurchasedate.clear();
                  },
                  icon: Icon(Icons.refresh)),
            ],
          ),
          body: WillPopScope(
            onWillPop: dialog,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: txtproductname,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            label: Text("Customer Product"),
                           ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Amout';
                          } else {
                            return null;
                          }
                        },
                        controller: txtprice,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.currency_rupee),
                            label: Text("Amout"),
                         ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "* Required",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Card(
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: txtquantity,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.queue_rounded),
                            label: Text("Quantity"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: TextField(
                        readOnly: true,
                        onTap: () {
                          datepick();
                        },
                        controller: txtpurchasedate,
                        cursorColor: Color(0xff000000),
                        style: TextStyle(color: Color(0xff000000)),
                        decoration: InputDecoration(
                          label: Text("Purchasedate"),
                          prefixIcon: Icon(
                            Icons.date_range_sharp,
                            color: Color(0xff919191),
                          ),
                          focusColor: Color(0xff000000),
                          fillColor: Color(0xff000000),
                          hintStyle: TextStyle(color: Color(0xff919191)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      if (txtkey.currentState!.validate() == true) {
                        Get.off(Detile_Screen());
                      }
                      DbHelper pdb = DbHelper();
                      pdb.ProinsertData(
                          txtproductname.text,
                          txtquantity.text,
                          txtprice.text,
                          txtpurchasedate.text,
                          int.parse(cilent_controller.Datapick!.id!),
                          0);
                      getData();
                    },
                    child: Text("SAVE",style: TextStyle(color: Colors.white),),
                    style:
                        ElevatedButton.styleFrom(primary: Colors.blue.shade700),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> dialog() async {
    back();
    return await false;
  }

  void back(){
    Get.off(Detile_Screen());
  }


  void datepick() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      //get today's date
      firstDate: DateTime(2020),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2999),
    );
    if(pickedDate != null ){
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {

        txtpurchasedate = TextEditingController(text: "$formattedDate");
      });
    }else{
      print("Date is not selected");
    }

  }
}
