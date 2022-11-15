import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khatabook/controller/product_conttroller.dart';

import '../controller/dbhelpre_cilent.dart';

class FilterDate_Screen extends StatefulWidget {
  const FilterDate_Screen({Key? key}) : super(key: key);

  @override
  State<FilterDate_Screen> createState() => _FilterDate_ScreenState();
}

class _FilterDate_ScreenState extends State<FilterDate_Screen> {
  Product_Controller product_controller = Get.put(Product_Controller());

  DbHelper db = DbHelper();

  void getData() async {
    product_controller.ProductList.value =
    await db.ProductFilterreaddata(product_controller.FilterDate.value);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700,
          elevation: 0,
          title: Text(
            "Data",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  datepickerdialog ();
                  //print(homeController.filterdate.value);
                  getData();
                },
                icon: Icon(Icons.filter_alt)),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
            child: Container(
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
            ),


            Obx(()=>
                ListView.builder(
                  itemCount:product_controller.ProductList.length,
                  itemBuilder: (context,index){
                    return   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
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
            // Obx(
            //       () => Expanded(
            //     child: ListView.builder(
            //       itemCount: product_controller.ProductList.length,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.all(10),
            //           child: Container(
            //             height: 70,
            //             width:  MediaQuery.of(context).size.width*0.99,
            //             color: Colors.grey.shade900,
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Row(
            //                     children: [
            //                       Container(
            //                         width:  MediaQuery.of(context).size.width*0.,
            //                         alignment: Alignment.centerLeft,
            //                         child: Column(
            //                           mainAxisAlignment:
            //                           MainAxisAlignment.center,
            //                           children: [
            //                             Text(
            //                               "${product_controller.ProductList[index]['date']}",
            //                               style: TextStyle(color: Colors.white),
            //                             ),
            //                             Text(
            //                               "${product_controller.ProductList[index]['time']}",
            //                               style: TextStyle(color: Colors.grey),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                       Container(
            //                         width: 70,
            //                         alignment: Alignment.center,
            //                         child: Text(
            //                           "${product_controller.ProductList[index]['name']}",
            //                           style: TextStyle(color: Colors.white),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                   Row(
            //                     children: [
            //                       Container(
            //                         width: 70,
            //                         alignment: Alignment.center,
            //                         color: Colors.red,
            //                         child: product_controller.ProductList[index]
            //                         ['payment_status'] ==
            //                             1
            //                             ? Text(
            //                           "${product_controller.ProductList[index]['amount']}",
            //                           style:
            //                           TextStyle(color: Colors.white),
            //                         )
            //                             : Text(""),
            //                       ),
            //                       Container(
            //                         width: 70,
            //                         alignment: Alignment.center,
            //                         color: Colors.green,
            //                         child:product_controller.ProductList[index]
            //                         ['payment_status'] ==
            //                             0
            //                             ? Text(
            //                           "${product_controller.ProductList[index]['amount']}",
            //                           style:
            //                           TextStyle(color: Colors.white),
            //                         )
            //                             : Text(""),
            //                       ),
            //                     ],
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void datepickerdialog () async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2001),
        lastDate: DateTime(3000));
    product_controller.getData(date);
    if (date != null) {
      product_controller.FilterDate.value = DateFormat('dd-MM-yyyy').format(date);
    }
  }
}
