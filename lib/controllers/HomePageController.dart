import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import '../model/products_model.dart';
import '../services/HomePageService.dart';

class HomePageController extends GetxController {
  List<ResultList> resultList = <ResultList>[].obs;
  var loading = false.obs;
   void isLoading({bool? isLoading}) {
    loading.value = isLoading!;
    print("This is loading ${loading.value}");
  }

  @override
  void onInit() {
    getAllProducts();
  }

   void getAllProducts() async {
    try {
      isLoading(isLoading:true);
      resultList = await HomePageServcies.getProducts();
      print("This is length of list $resultList");
    }catch(err){
      isLoading(isLoading:false);
      if(kDebugMode){
        print(err);
      }
    }
  }

}
