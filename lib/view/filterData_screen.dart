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

  void getData()  async{
    product_controller.ProductList.value = await db.ProreadData();
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
            "History",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: MediaQuery.of(context).size.width*0.99,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date/Time",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 65,
                          ),
                          Text(
                            "Remark",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.002,),

                    Container(
                      width: MediaQuery.of(context).size.width*0.38,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(width: MediaQuery.of(context).size.width*0.18,
                              child: Center(child: Text("You Gave",style: TextStyle(fontSize: 13),))),
                          Container(height: 20,width: 0.7,color: Colors.black,),
                          Container(width: MediaQuery.of(context).size.width*0.18,
                              child: Center(child: Text("You Got",style: TextStyle(fontSize: 13),))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() =>
                Expanded(
                child: ListView.builder(
                  itemCount:product_controller.ProductList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width*0.99,
                        color: Colors.black12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width*0.55,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "${product_controller.ProductList[index]['purchase_date']}",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        "${product_controller.ProductList[index]['quantity']}",
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${product_controller.ProductList[index]['product_name']}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.19,
                                  alignment: Alignment.center,
                                  color: Colors.red,
                                  child: product_controller.ProductList[index]['payment_status'] == 0 ?
                                  Text("${product_controller.ProductList[index]['price']}", style: TextStyle(color: Colors.white),):
                                  Text("₹ 0",style: TextStyle(color: Colors.white),),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.19,
                                  alignment: Alignment.center,
                                  color: Colors.green,
                                  child: product_controller.ProductList[index]['payment_status'] == 1 ?
                                  Text("${product_controller.ProductList[index]['price']}", style: TextStyle(color: Colors.white),) :
                                  Text("₹ 0",style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
