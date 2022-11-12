import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/controller/cilent_controller.dart';
import 'package:khatabook/view/paymetRemaind_Screen.dart';
import 'package:khatabook/view/paynetdone_screen.dart';

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
          }, icon:Icon(Icons.arrow_back,size: 30,)),
          title: Text("🙍‍ ${cilent_controller.Datapick!.name}",style: TextStyle(fontSize: 30),),
          actions: [
            IconButton(onPressed: (){}, icon:Icon(Icons.call,size: 30,)),
          ],
        ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
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
                                 child: Text("Date/Time"),
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
                  ListView.builder(
                    itemCount:.length,
                    itemBuilder: (context,index){return },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                      Text("9-11-2022"),
                                      Text("6",)
                                    ],
                                  ),
                                  Text("suger"),
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),

                            Container(
                              height: 60,
                              width:MediaQuery.of(context).size.width*0.19,
                              color: Colors.red.shade200,
                              child: Center(
                                child: Text("₹ 909",style: TextStyle(color: Colors.red),),
                              ),
                            ),
                            Container(
                              height: 60,
                              width:MediaQuery.of(context).size.width*0.19,
                              color: Colors.greenAccent,
                              child: Center(
                                child: Text("₹ 10100",style: TextStyle(color: Colors.green),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),


                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: (){
                      Get.to(paymetRemaind_Screen(),);
                      },
                      child:Text("Paymet Remaind ₹",
                        style: TextStyle(color: Colors.white,fontSize: 16),),
                          style: ElevatedButton.styleFrom(primary: Colors.red,minimumSize: Size(MediaQuery.of(context).size.width*0.4,MediaQuery.of(context).size.width*0.13)),),
                    ElevatedButton(onPressed: (){
                      Get.to(PaymetDone_Screen());
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
