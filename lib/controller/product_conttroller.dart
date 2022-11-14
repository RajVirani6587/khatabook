import 'package:get/get.dart';
import 'package:khatabook/model/producte_model.dart';

class Product_Controller extends GetxController{

  RxList<Map>ProductList = <Map>[].obs;
  RxString utxtRadio= "Done".obs;

   Producte_Model ? Datapick2;
}
