import 'package:get/get.dart';
import 'package:khatabook/model/producte_model.dart';

import 'cilent_controller.dart';
import 'dbhelpre_cilent.dart';

class Product_Controller extends GetxController{

  Cilent_Controller cilent_controller = Get.put(Cilent_Controller());
  RxList<Map>ProductList = <Map>[].obs;
  RxString utxtRadio= "Done".obs;

  RxInt pandingSum =0.obs;
  RxInt doneSum = 0.obs;
  void addition(){
    int i= 0;
    doneSum.value=0;
    pandingSum.value=0;
    for(i=0;i<ProductList.length;i++)
    {
      ProductList[i]['payment_status']==1?
      doneSum.value = int.parse(ProductList[i]['price']) + doneSum.value:
      pandingSum.value=int.parse(ProductList[i]['price']) + pandingSum.value;
    }
  }

  RxList<Map>ProductList2 = <Map>[].obs;
  RxInt mainpandingSum = 0.obs;
  RxInt maindoneSum = 0.obs;


  void topaddition() async{
    DbHelper db = DbHelper();
    ProductList2.value = await db.ProreadData();

    int v = 0;

    mainpandingSum.value=0;
    maindoneSum.value=0;

    for(v=0;v<ProductList2.length;v++){

      ProductList2[v]['payment_status'] == 1?
      maindoneSum.value =  int.parse(ProductList2[v]['price']) + maindoneSum.value :
      mainpandingSum.value =  int.parse(ProductList2[v]['price']) + mainpandingSum.value;

        }
      }

      Producte_Model ? Datapick2;

  RxString FilterDate = "".obs;

  var Date = DateTime.now();

  void getData(dynamic date1)
  {
    Date = date1;
  }

}
