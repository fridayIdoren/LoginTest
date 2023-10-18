import 'package:http/http.dart' as http;
import 'package:interview_oct/controllers/HomePageController.dart';
import 'package:get/get.dart';
import '../model/products_model.dart';

class HomePageServcies {
  static var client = http.Client();

  static Future<List<ResultList>> getProducts() async {
    var response = await client.get(
        Uri.parse("https://test.renecv.com/products?contactId=523452355"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "2352352352578895689"
        });
    var jsonString = response.body;
    HomePageController homePageController = Get.put(HomePageController());
    homePageController.isLoading(isLoading:false);
    print("Home Response String $jsonString");
    if (response.statusCode == 200) {
      return productsFromJson(jsonString).resultList;
    } else {
      return [];
    }
  }
}
