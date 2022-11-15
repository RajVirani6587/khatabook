import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khatabook/view/detile_screen.dart';

import '../controller/cilent_controller.dart';
import '../controller/dbhelpre_cilent.dart';
import '../controller/product_conttroller.dart';

class PaymetDone_Screen extends StatefulWidget {
  const PaymetDone_Screen({Key? key}) : super(key: key);

  @override
  State<PaymetDone_Screen> createState() => _PaymetDone_ScreenState();
}

class _PaymetDone_ScreenState extends State<PaymetDone_Screen> {

  Product_Controller product_controller = Get.put(Product_Controller());
  Cilent_Controller cilent_controller = Get.put(Cilent_Controller());

  TextEditingController txtproductname  =TextEditingController();
  TextEditingController txtquantity     =TextEditingController();
  TextEditingController txtprice        =TextEditingController();
  TextEditingController txtpurchasedate =TextEditingController();

  var txtkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData()async{
    DbHelper pdb = DbHelper();
    cilent_controller.CilentList.value = await pdb.readData();
    product_controller.addition();
    product_controller.topaddition();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(

            backgroundColor: Colors.blue.shade700,
            leading: IconButton(onPressed: (){
              Get.off(Detile_Screen());
            }, icon:Icon(Icons.arrow_back)),
            centerTitle: false,
            title: Text("Add Payment"),
            actions: [
              IconButton(onPressed: (){
                txtproductname.clear();
                txtquantity.clear();
                txtprice.clear();
                txtpurchasedate.clear();
              }, icon: Icon(Icons.refresh)),
            ],
          ),
          body: WillPopScope(onWillPop: dialog,
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
                        keyboardType: TextInputType.numberWithOptions(),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: TextField(
                        keyboardType: TextInputType.numberWithOptions(),
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
                        keyboardType: TextInputType.numberWithOptions(),
                        readOnly: true,
                        onTap: () {
                          datepick();
                        },
                        controller: txtpurchasedate,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.date_range),
                            label: Text("Purchase Date"),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
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
                          1);
                      getData();

                    },
                    child: Text("SAVE",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(primary: Colors.blue.shade700),
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
      firstDate: DateTime(2020), lastDate: DateTime(2999),
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
