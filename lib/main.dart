import 'dart:convert';

import 'package:cyrs_1/navigationBar.dart';
import 'package:cyrs_1/iconsCustom.dart';
import 'package:cyrs_1/register.dart';
import 'package:cyrs_1/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'globals.dart' as globals;
import 'package:crypto/crypto.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CyrsApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(title: 'Cyrs'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  get cursorColor => cursorColor(const Color(0x00000000));

  Future login(User user) async {
    var apiUrl = "http://10.100.25.103:80/login.php";
    String securePassword = md5.convert(utf8.encode(user.password)).toString();
    var response = await http.post(Uri.parse(apiUrl), body: {
      "username": user.username,
      "password": securePassword,
    });
    //print(response.body);
    var data = json.decode(response.body);
    //print(data.toString());
    if (data == "Success") {
      print("\n\nSUCCESSFUL LOGIN, NICE :)");
      globals.user.setName(user.username);
      globals.user.setPassword(user.password);
      globals.user.setEmail(user.email);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Catalog()),
            (Route<dynamic> route) => false,
      );
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard(),),);
    } else {
      Fluttertoast.showToast(
          msg: "Ошибка входа, логин и/или пароль неверны!",
          toastLength: Toast.LENGTH_LONG,
          fontSize: 26,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.transparent,
          textColor: Colors.white
      );
      print("\n\nERROR: WRONG PASSWORD OR USERNAME YOU IDIOT");
    }
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                  width: 420,
                  height: 350,
                  margin: const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(144, 205, 249, 1),
                      border: Border.all(
                    color: const Color.fromRGBO(144, 205, 249, 1),
                  ),
                      borderRadius: const BorderRadius.all(Radius.circular(20))
                  ),
                child: const Padding(
                padding: EdgeInsets.only(top: 170),
                  child: Center(
                    child: Text(
                      "Вход",
                      style: TextStyle(fontSize: 45,color: Colors.white),
                    ),
                  ),
                  ),
                ),
              ),
            const SizedBox(
              width: double.infinity,
              height:25,
            ),
            SizedBox(
              width: 350,
              height: 75,
              child: TextFormField(
                controller: usernameController,
                maxLength: 16,
                decoration: const InputDecoration(
                   prefixIcon: Icon(Icons.account_box),
                  border: OutlineInputBorder(),
                  hintText: "Введите логин",
                  labelText: "Логин"
              ),
              validator: (String? input){
                return (input != null) ? 'Login incorrect' : null;
                },
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height:25,
            ),
            SizedBox(
              width: 350,
              height: 75,
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
              height:25,
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(144, 205, 249, 1))),
                onPressed: () {
                  User user = User(username: usernameController.text, password: passwdController.text, email: "");
                  login(user);


                },
                child: const Text('Войти'),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height:30,
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(144, 205, 249, 1))),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Registration()),
                        (Route<dynamic> route) => true,
                  );

                },
                child: const Text('Создать аккаунт'),
              ),
            ),
          ],
          ),
          ),
        );















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
  }
}