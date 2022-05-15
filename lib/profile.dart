import 'dart:convert';

import 'package:cyrs_1/iconsCustom.dart';
import 'package:cyrs_1/main.dart';
import 'package:cyrs_1/register.dart';
import 'package:cyrs_1/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:crypto/crypto.dart';
import 'globals.dart' as globals;
import 'globals.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

final TextEditingController emailField =
    TextEditingController(text: user.email);

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 12, left: 18, right: 18),
                child: Stack(
                  children: [
                    Image.asset("assets/images/profileBackGround.png"),
                    Padding(
                      padding: EdgeInsets.all(80),
                      child: Container(
                        child: Image.asset("assets/images/profileTemplate.png"),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(144, 205, 249, 1),
                            border: Border.all(
                              color: const Color.fromRGBO(144, 205, 249, 1),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(500))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 280),
                      child: Center(
                        child: Text(
                          user.username,
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
                child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: emailField,
                      enabled: false,
                      readOnly: true,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        labelText: "email:",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Center(
              child:SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(144, 205, 249, 1))),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                        (Route<dynamic> route) => false,
                  );
                  }, child: Text("Выход из аккаунта ${user.username}."),
                ),
              )
              )
            )
          ],
        ),
    );
  }
}
