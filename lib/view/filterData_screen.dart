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
            "History",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  datepickerdialog();
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
                child: Row(
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
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "You Gave | You Got",
                      style: TextStyle(),
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
                        height: 70,
                        width: double.infinity,
                        color: Colors.grey.shade900,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 110,
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${product_controller.ProductList[index]['purchase_date']}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "${product_controller.ProductList[index]['quantity']}",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 70,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${product_controller.ProductList[index]['product_name']}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    alignment: Alignment.center,
                                    color: Colors.red,
                                    child: product_controller.ProductList[index]['payment_status'] == 1 ?
                                    Text("${product_controller.ProductList[index]['price']}", style: TextStyle(color: Colors.white),):
                                    Text(""),
                                  ),
                                  Container(
                                    width: 70,
                                    alignment: Alignment.center,
                                    color: Colors.green,
                                    child: product_controller.ProductList[index]
                                    ['payment_status'] ==
                                        0
                                        ? Text(
                                      "${product_controller.ProductList[index]['price']}",
                                      style:
                                      TextStyle(color: Colors.white),
                                    )
                                        : Text(""),
                                  ),
                                ],
                              )
                            ],
                          ),
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
