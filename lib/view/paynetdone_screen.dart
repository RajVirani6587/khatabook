import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cilent_controller.dart';
import '../controller/dbhelpre_cilent.dart';

class PaymetDone_Screen extends StatefulWidget {
  const PaymetDone_Screen({Key? key}) : super(key: key);

  @override
  State<PaymetDone_Screen> createState() => _PaymetDone_ScreenState();
}

class _PaymetDone_ScreenState extends State<PaymetDone_Screen> {

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
    cilent_controller.CilentList.value = await pdb.ProreadData();
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
                child: TextField(
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
                      label: Text("Purchase Date"),
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
                DbHelper PDB = DbHelper();
                PDB.ProtwoinsertData(txtproductname.text,txtquantity.text,txtprice.text,txtpurchasedate.text);
                getDataPro();
                Get.back();
              }, child: Text("SAVE"),style: ElevatedButton.styleFrom(primary: Colors.blue.shade700),),
            ],
          ),
        ),
      ),
    );
  }
}
