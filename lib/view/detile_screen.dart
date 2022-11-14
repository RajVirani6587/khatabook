import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/controller/cilent_controller.dart';
import 'package:khatabook/controller/product_conttroller.dart';
import 'package:khatabook/view/paymetRemaind_Screen.dart';
import 'package:khatabook/view/paynetdone_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/dbhelpre_cilent.dart';

class Detile_Screen extends StatefulWidget {
  const Detile_Screen({Key? key}) : super(key: key);

  @override
  State<Detile_Screen> createState() => _Detile_ScreenState();
}

class _Detile_ScreenState extends State<Detile_Screen> {


  Cilent_Controller cilent_controller = Get.put(Cilent_Controller());
  Product_Controller product_controller = Get.put(Product_Controller());

  TextEditingController utxtproductname = TextEditingController();
  TextEditingController utxtquantity    = TextEditingController();
  TextEditingController utxtprice        = TextEditingController();
  TextEditingController utxtpurchasedate = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData()async{
    DbHelper db = DbHelper();
    cilent_controller.CilentList.value = await db.readData();
    product_controller.ProductList.value = await db.ProreadData(cilent_controller.Datapick!.id!);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700,
          elevation: 0,
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon:Icon(Icons.arrow_back,size: 30,)),
          title: Text("🙍‍ ${cilent_controller.Datapick!.name}",style: TextStyle(fontSize: 30),),
          actions: [
            IconButton(onPressed: () async {
                   await launchUrl(
                     Uri.parse("tel: +91${cilent_controller.Datapick!.mobile}"));
                     }, icon:Icon(Icons.call,size: 30,)),
          ],
        ),
          body: Column(
            children: [
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width*1,
                color: Colors.blue.shade700,
                child: Center(
                  child: Container(
                    height: 105,
                    width: MediaQuery.of(context).size.width*0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("Total Income",style: TextStyle(fontSize: 20),),
                            ),
                            Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: Text("₹ 0",style: TextStyle(fontSize: 20,color: Colors.green),),
                            ),
                          ],
                        ),

                        Container(height: 0.5,width: MediaQuery.of(context).size.width*1,color: Colors.black,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("Total Expense",style: TextStyle(fontSize: 20),),
                            ),
                            Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: Text("₹ 0",style: TextStyle(fontSize: 20,color: Colors.red),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                height: 60,
                width: MediaQuery.of(context).size.width*1,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue,width: 3),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.picture_as_pdf,color: Colors.blue.shade700,size: 35,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.currency_rupee,color: Colors.blue.shade700,size: 35,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.whatsapp,color: Colors.blue.shade700,size: 35,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.sticky_note_2_outlined,color: Colors.blue.shade700,size: 35,)),
                  ],
                ),
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width*0.99,
                child: Row(
                  children: [
                    Container(

                      height: 60,
                      width: MediaQuery.of(context).size.width*0.60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Padding(
                             padding: EdgeInsets.only(left: 10),
                             child: Text("Date/Quantity"),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(right: 5),
                             child: Text("Remark"),
                           ),
                        ],
                      ),
                    ),

                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width*0.35,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Remaind"),
                          SizedBox(width: 10,),
                          Container(height: 15,width: 0.5,color: Colors.black,),
                          SizedBox(width: 10,),
                          Text("Done"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(()=>
                  ListView.builder(
                    itemCount:product_controller.ProductList.length,
                    itemBuilder: (context,index){
                      return   Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: InkWell(
                         onTap: (){


                           utxtproductname  =TextEditingController(text: "${cilent_controller.CilentList.value[index]['product_name']}");
                           utxtquantity     =TextEditingController(text: "${cilent_controller.CilentList.value[index]['quantity']}");
                           utxtprice        =TextEditingController(text: "${cilent_controller.CilentList.value[index]['price']}");
                           utxtpurchasedate =TextEditingController(text: "${cilent_controller.CilentList.value[index]['purchase_date']}");

                           Get.defaultDialog(
                             title: "UpDate/Delete",
                             content: Column(
                               children: [
                                 TextField(
                                   controller:utxtproductname ,decoration: InputDecoration(hintText: "Customer Product",),),
                                 TextField(
                                   controller: utxtquantity,decoration: InputDecoration(hintText: "Quantity",),),
                                 TextField(
                                   controller: utxtprice,decoration: InputDecoration(hintText: "Amout",),),
                                 TextField(
                                   controller: utxtpurchasedate,decoration: InputDecoration(hintText: "Purchase Date",),),
                                 Obx(()=>
                                    Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                       Expanded(
                                         child: RadioListTile(value: "Done",groupValue:product_controller.utxtRadio.value,onChanged: (value){
                                          product_controller.utxtRadio.value = value as String;
                                         },title: Text("Done",style: TextStyle(fontSize: 15)),),
                                       ),

                                       Expanded(
                                         child: RadioListTile(value: "Remaind",groupValue:product_controller.utxtRadio.value,onChanged: (value){
                                           product_controller.utxtRadio.value = value as String;
                                         },title: Text("Remaind",style: TextStyle(fontSize: 12),),),
                                       ),
                                     ],
                                   ),
                                 ),
                                 SizedBox(height: 10,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     ElevatedButton(onPressed: (){
                                       DbHelper dp = DbHelper();
                                       //dp.Proupdatedata("${product_controller.ProductList.value[index]['id']}", utxtproductname.text, utxtquantity.text, utxtprice.text, utxtpurchasedate.text, int.parse(cilent_controller.Datapick!.id!), status)
                                       getData();
                                     },child:Text("update")),
                                     ElevatedButton(
                                         style: ElevatedButton.styleFrom(primary: Colors.red),
                                       onPressed: (){
                                       DbHelper dp = DbHelper();
                                       dp.Prodeletedata("${product_controller.ProductList.value[index]['id']}");
                                       getData();
                                     }, child: Text("Delete")),
                                   ],
                                 ),
                               ],
                             ),
                           );

                         },
                         child: Container(
                          color: Colors.black12,
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.99,
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width*0.55,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("${product_controller.ProductList[index]['purchase_date']}"),
                                        Text("${product_controller.ProductList[index]['quantity']}",)
                                      ],
                                    ),
                                    Text("${product_controller.ProductList[index]['product_name']}"),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                height: 60,
                                width:MediaQuery.of(context).size.width*0.19,
                                color: Colors.red.shade200,
                                child: Center(
                                  child: Text("${product_controller.ProductList[index]['payment_status'] == 1 ? '₹ 0' : '₹ ${product_controller.ProductList[index]['price']}'}",style: TextStyle(color: Colors.red),),
                                ),
                              ),
                              Container(
                                height: 60,
                                width:MediaQuery.of(context).size.width*0.19,
                                color: Colors.greenAccent,
                                child: Center(
                                  child: Text("${product_controller.ProductList[index]['payment_status'] == 0 ? '₹ 0' : '₹ ${product_controller.ProductList[index]['price']}'}",style: TextStyle(color: Colors.green),),
                                ),
                              ),
                            ],
                          ),
                      ),
                       ),
                    );
                      },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: (){
                      Get.off(paymetRemaind_Screen(),);
                      },
                      child:Text("Paymet Remaind ₹",
                        style: TextStyle(color: Colors.white,fontSize: 16),),
                          style: ElevatedButton.styleFrom(primary: Colors.red,minimumSize: Size(MediaQuery.of(context).size.width*0.4,MediaQuery.of(context).size.width*0.13)),),
                    ElevatedButton(onPressed: (){
                      Get.off(PaymetDone_Screen());
                    },
                      child:Text("Paymet Done  ₹",
                        style: TextStyle(color: Colors.white,fontSize: 16),),
                         style: ElevatedButton.styleFrom(primary: Colors.green,minimumSize: Size(MediaQuery.of(context).size.width*0.4,MediaQuery.of(context).size.width*0.13 )),),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
