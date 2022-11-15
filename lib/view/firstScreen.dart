import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/controller/product_conttroller.dart';
import 'package:khatabook/model/data_Model.dart';
import 'package:khatabook/view/add%20_customer_Screen.dart';
import 'package:khatabook/view/detile_screen.dart';
import 'package:khatabook/view/filterData_screen.dart';
import '../controller/cilent_controller.dart';
import '../controller/dbhelpre_cilent.dart';

class First_Screen extends StatefulWidget {
  const First_Screen({Key? key}) : super(key: key);

  @override
  State<First_Screen> createState() => _First_ScreenState();
}

class _First_ScreenState extends State<First_Screen> {

  Cilent_Controller cilent_controller = Get.put(Cilent_Controller());
  Product_Controller product_controller = Get.put(Product_Controller());

  TextEditingController utxtaddress =TextEditingController();
  TextEditingController utxtname =TextEditingController();
  TextEditingController utxtmoblie =TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData()async{
    DbHelper db = DbHelper();
    cilent_controller.CilentList.value = await db.readData();
    product_controller.ProductList.value = await db.ProreadData();
    product_controller.addition();
    product_controller.topaddition();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top:5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade700,
              ),
              height: 60,
              width: MediaQuery.of(context).size.width*0.97,
              child: Expanded(
                child: ListTile(
                  leading: Icon(Icons.dehaze_outlined,color: Colors.white,),
                  title: Text("Khatabook",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  trailing: InkWell(onTap: (){
                         Get.to(FilterDate_Screen());
                  },child: Icon(Icons.date_range,color: Colors.white,)),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              height: 170,
              width: MediaQuery.of(context).size.width*0.98,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade700,
              ),
              child: Center(
                  child: Container(
                    height: 153,
                    width: MediaQuery.of(context).size.width*0.93,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("Paymet Done"),
                                SizedBox(height:15,),
                                Obx(()=>
                                    Text("₹ ${product_controller.maindoneSum.value}",
                                      style: TextStyle(color: Colors.green,
                                          fontWeight: FontWeight.bold,fontSize: 25),)),
                              ],
                            ),
                            Container(height: 50,width: 0.5,color: Colors.black,),
                            Column(
                              children: [
                                Text("Paymet Remaind"),
                                SizedBox(height: 15,),
                                Obx(()=> Text("₹ ${product_controller.mainpandingSum.value}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 25),)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Container(
                          height: 0.5,
                          width: MediaQuery.of(context).size.width*1,
                          color: Colors.black,
                        ),
                        SizedBox(height: 10,),
                        Text("VIEW HISTORY >",style: TextStyle(color: Colors.indigoAccent,fontSize: 20,fontWeight: FontWeight.bold),),


                      ],
                    ),
                  ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount:cilent_controller.CilentList.value.length,
                itemBuilder: (Context,index){
                  return InkWell(onTap: (){
                    cilent_controller.Datapick = Data_Model(
                      name: cilent_controller.CilentList.value[index]['name'],
                      address: cilent_controller.CilentList.value[index]['address'],
                      mobile: cilent_controller.CilentList.value[index]['mobile'],
                      id:cilent_controller.CilentList.value[index]['id'].toString(),
                    );
                    Get.to(Detile_Screen());
                  },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black12,
                        ),
                        child: ListTile(
                          leading: Text("🙍‍",style:TextStyle(fontSize: 30,),),
                          title: Text("${cilent_controller.CilentList.value[index]['name']}",style: TextStyle(color: Colors.black),),
                          subtitle: Text("${cilent_controller.CilentList.value[index]['mobile']}",),
                          trailing: PopupMenuButton(itemBuilder: (context) => [
                            PopupMenuItem(child: InkWell(onTap: (){

                              utxtname =TextEditingController(text: "${cilent_controller.CilentList.value[index]['name']}");
                              utxtmoblie =TextEditingController(text: "${cilent_controller.CilentList.value[index]['mobile']}");
                              utxtaddress =TextEditingController(text: "${cilent_controller.CilentList.value[index]['address']}");

                              Get.defaultDialog(
                                content: Column(
                                  children: [
                                    TextField(
                                      controller: utxtname,decoration: InputDecoration(hintText: "Name",),),
                                    TextField(
                                      controller: utxtmoblie,decoration: InputDecoration(hintText: "Moblie", prefixText: "+91 ",),),
                                    TextField(
                                      controller: utxtaddress,decoration: InputDecoration(hintText: "address",),),
                                    SizedBox(height: 10,),
                                    ElevatedButton(onPressed: (){
                                      DbHelper dp = DbHelper();
                                      dp.updatedata("${cilent_controller.CilentList.value[index]['id']}",utxtname.text, utxtmoblie.text,utxtaddress.text);
                                      getData();
                                    },child:Text("update")),
                                  ],
                                ),
                              );

                              },child: Text('update'))),
                            PopupMenuItem(child: InkWell(onTap: (){
                              DbHelper dp = DbHelper();
                              dp.deletedata("${cilent_controller.CilentList.value[index]['id']}");
                              getData();
                              },child: Text('Delete'))),
                          ],)
                        ),
                      ),
                    ),
                  );
                },
              )),
            ),

          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue.shade700,
          label:Row(
            children: [
              Icon(Icons.add),
              Text(" ADD CUSTOMER"),
            ],
          ),
          onPressed: (){
            Get.to(AddCustomer_Screen());
          },
        ),
      ),
    );
  }
}
