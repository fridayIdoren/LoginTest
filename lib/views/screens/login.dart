import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/AuthenticateController.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? editingControllerName, password;
  AuthencateController authencateController = Get.put(AuthencateController());

  @override
  void initState() {
    editingControllerName = TextEditingController();
    password = TextEditingController();
  }

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
                'assets/images/login_bg1.jpg'), // Replace with your image asset path
            fit: BoxFit
                .cover, // You can use BoxFit.fill, BoxFit.fit, or other values
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TextInput Full Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: size.width,
                  height: 50,
                  padding: EdgeInsets.only(top: 8, left: 8, bottom: 6),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.grey[400]!, width: 1)),
                  child: Center(
                    child: TextField(
                      controller: editingControllerName,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (text) {},
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Full Name",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  )),
            ),
            //TextInput Full Name

            const SizedBox(
              height: 10,
            ),

            //TextInput Full Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: size.width,
                  height: 50,
                  padding: EdgeInsets.only(top: 8, left: 8, bottom: 6),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.grey[400]!, width: 1)),
                  child: Center(
                    child: TextField(
                      controller: password,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (text) {},
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Full Name",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  )),
            ),
            //TextInput Full Name

            Container(
              height: 50,
              width: size.width,
              decoration: BoxDecoration(),
            ),

            Material(
              child: InkWell(
                onTap: () async {
                  await authencateController.AuthenticateUser(
                      email: editingControllerName!.text,
                      password: password!.text);
                  Get.to(() => const HomePage());
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
