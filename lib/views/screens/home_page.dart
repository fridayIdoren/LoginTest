import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_oct/controllers/HomePageController.dart';
import 'package:interview_oct/model/products_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/product_bg2.jpg'), // Replace with your image asset path
              fit: BoxFit
                  .cover, // You can use BoxFit.fill, BoxFit.fit, or other values
            ),
          ),
        child: Obx(
          () => homePageController.loading.value
              ? const Expanded(
                  flex: 3,
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.redAccent,
                      valueColor: AlwaysStoppedAnimation(Colors.green),
                      strokeWidth: 10,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: homePageController.resultList.length,
                          itemBuilder: (_, index) {
                            ResultList result =
                            homePageController.resultList[index];
                            return Container(
                              height: 100,
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              width: double.infinity,
                              color: Colors.black26,
                              child:Row(
                                children: [
                                  Expanded(
                                    flex:3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          result.accountType,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child:Container(
                                      height: 50,
                                      width: 79,
                                      decoration:BoxDecoration(
                                        border:Border.all(color:Colors.green,width:1),
                                        borderRadius:BorderRadius.circular(5,)

                                      ),
                                      child:Center(
                                        child: Text(
                                          result.signedUp
                                              ? "LAUNCH"
                                              : "SIGN-UP",
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
