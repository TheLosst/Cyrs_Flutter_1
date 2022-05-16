import 'dart:convert';

import 'package:cyrs_1/globals.dart';
import 'package:cyrs_1/iconsCustom.dart';
import 'package:cyrs_1/main.dart';
import 'package:cyrs_1/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:crypto/crypto.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CyrsApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegistrarionPage(title: 'Cyrs'),
    );
  }
}

class RegistrarionPage extends StatefulWidget {
  const RegistrarionPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RegistrarionPage> createState() => _RegistrarionPageState();
}

class _RegistrarionPageState extends State<RegistrarionPage> {
  get cursorColor => cursorColor(const Color(0x00000000));

  register(User user) async {
    var apiUrl = "$connIp/register.php";
    String securePassword = md5.convert(utf8.encode(user.password)).toString();
    var response = await http.post(
      Uri.parse(apiUrl),
      body: {
        "username": user.username,
        "password": securePassword,
        "email": user.email,
      },
    );
    print("aaaaaaaaaaaaaa \n\n${response.body}\n\n aaaaaaaaaaaa");
    var data = json.decode(response.body);

    switch (data) {
      case ("Error"):
        Fluttertoast.showToast(
            msg: "Ошибка регистрации",
            toastLength: Toast.LENGTH_LONG,
            fontSize: 26,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.transparent,
            textColor: Colors.white);
        print("\n\nERROR MUDAK\nUSER ALREADY EXISTS: ${user.username}");
        break;
      case ("Success"):
        print("\n\nSUCCESS\nUSER ADDED: ${user.username}");
        Fluttertoast.showToast(
            msg: "Регистрация пользователя "
                "${usernameController.text}"
                " успешна",
            toastLength: Toast.LENGTH_SHORT,
            fontSize: 15,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.transparent,
            textColor: Colors.white);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginPage(
                    title: '',
                  )),
          (Route<dynamic> route) => false,
        );
        break;
      default:
        Fluttertoast.showToast(
            msg: "Нет соеденения с сервером",
            toastLength: Toast.LENGTH_LONG,
            fontSize: 26,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.transparent,
            textColor: Colors.white);
        break;
    }

    // if (data == "Error") {
    //
    //   return "E";
    // } else {
    //
    //   return "S";
    // }
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwdController = TextEditingController();
  final TextEditingController passwdRepeatController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 420,
                height: 350,
                margin:
                    const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 0),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(144, 205, 249, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(144, 205, 249, 1),
                    ),
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                child: const Padding(
                  padding: EdgeInsets.only(top: 170),
                  child: Center(
                    child: Text(
                      "Регистрация",
                      style: TextStyle(fontSize: 45, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 25,
            ),
            SizedBox(
              width: 350,
              height: 65,
              child: TextFormField(
                controller: usernameController,
                maxLength: 16,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.account_box),
                    border: OutlineInputBorder(),
                    hintText: "Введите логин",
                    labelText: "Логин"),
                validator: (String? input) {
                  return (input != null) ? 'Login incorrect' : null;
                },
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 15,
            ),
            SizedBox(
              width: 350,
              height: 65,
              child: TextFormField(
                controller: emailController,
                maxLength: 32,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone_android),
                  border: OutlineInputBorder(),
                  hintText: "Введите Email",
                  labelText: "Email",
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 15,
            ),
            SizedBox(
              width: 350,
              height: 65,
              child: TextFormField(
                controller: passwdController,
                maxLength: 32,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_open),
                  border: OutlineInputBorder(),
                  hintText: "Введите пароль",
                  labelText: "Пароль",
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 15,
            ),
            SizedBox(
              width: 350,
              height: 65,
              child: TextFormField(
                controller: passwdRepeatController,
                maxLength: 32,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_open),
                  border: OutlineInputBorder(),
                  hintText: "Повторите пароль",
                  labelText: "Повтрите пароль",
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 15,
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(const Color.fromRGBO(144, 205, 249, 1))),
                onPressed: () {
                  User user = User(
                      username: usernameController.text,
                      password: passwdController.text,
                      email: emailController.text
                      );
                      register(user);

                },
                child: const Text('Зарегистрироваться'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// floatingActionButton: FloatingActionButton(
//   onPressed: _incrementCounter,
//   tooltip: 'Increment',
//   child: const Icon(Icons.add),
// ), // This trailing comma makes auto-formatting nicer for build methods.
//   ),
//   );onPressed: (){
//   User user = User(phone: "phone", username: "username", password: "password");
//   register(user);
// }
