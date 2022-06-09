import 'dart:convert';

import 'package:cyrs_1/globals/globals.dart';
import 'package:cyrs_1/navigationBar.dart';
import 'package:cyrs_1/registartation%20&%20login/register.dart';
import 'package:cyrs_1/custom%20classes/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../globals/globals.dart' as globals;
import 'package:crypto/crypto.dart';

void main() {
  runApp(const Login());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
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
    var apiUrl = "$connIp/login.php"; //Устанавливаем ссылку на php скрипт для работы с базой данных
    var profilepage = "$connIp/wtf.php";
    String securePassword = md5.convert(utf8.encode(user.password)).toString();
    var response = await http.post(Uri.parse(apiUrl), body: {
      "username": user.username,
      "password": securePassword,
    });
    var responseProfile = await http.post(Uri.parse(profilepage), body: {
      "username": user.username,
    });
    //print(response.body);
    var data = json.decode(response.body);
    var profileEmail = json.decode(responseProfile.body);
    String tempProfile = profileEmail.toString();
    tempProfile = tempProfile.replaceFirst('[{email: ', '').replaceFirst('}]', '');
    print(tempProfile);
    if (data == "Success") {
      print("\n\nSUCCESSFUL LOGIN, NICE :)");
      globals.user.setName(user.username);
      globals.user.setPassword(" ");
      globals.user.setEmail(tempProfile);
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
      print("ERROR: WRONG PASSWORD OR USERNAME");
    }
  }
  Future getNudes(User user) async {
    var apiUrl = "$connIp/GetLikeAndCard.php";
    var response = await http.post(Uri.parse(apiUrl), body: {
      "username": user.username,
    });
    List<String> data = response.body.replaceAll(RegExp('[^0-9]'), '').split("");
    for(int i=0;i < (like.length + shoppingCard.length)-1;i++){
      if(i<like.length){
        if (int.parse(data[i]) == 0){
          like[i] = false;
        }else{
          like[i] = true;
        }
        // +
      }
      else{
        if (int.parse(data[i]) == 0){
          shoppingCard[i-like.length] = false;
        }else{
          shoppingCard[i-like.length] = true;
        }
        // shoppingCard[i-5] = int.parse(data[i]) as bool;
      }
    }
  }

  @override
  void initState() {
    super.initState();

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
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
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
                  getNudes(user);


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
  }
}