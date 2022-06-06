import 'package:cyrs_1/custom%20classes/customAppBar.dart';
import 'package:cyrs_1/registartation%20&%20login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../globals/globals.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController controller = TextEditingController();

  Future sendLikeAndCard() async {
    String likes = "";
    String card = "";
    var apiUrl = "$connIp/AddToCardAndLIked.php";
    for (int i = 0; i < like.length; i++) {
      if (like[i]) {
        likes += "1";
      } else {
        likes += "0";
      }
    }
    for (int i = 0; i < shoppingCard.length; i++) {
      if (shoppingCard[i]) {
        card += "1";
      } else {
        card += "0";
      }
    }
    print("$likes  $card");
    var response = await http.post(Uri.parse(apiUrl),
        body: {"username": user.username, "liked": likes, "card": card});
    print(user.username);
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailField = TextEditingController(text: user.email);
    sendLikeAndCard();
    return Scaffold(
      appBar: MyUltraCoolAppBar(
          controller, 'Профиль', const Color.fromRGBO(144, 205, 249, 1), false),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12, left: 18, right: 18),
              child: Stack(
                children: [
                  Image.asset("assets/images/profileBackGround.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(144, 205, 249, 1),
                            border: Border.all(
                              color: const Color.fromRGBO(144, 205, 249, 1),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(500))),
                        child: Image.asset("assets/images/profileTemplate.png"),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: Text(
                        user.username,
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
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
          ),
          Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                  child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(144, 205, 249, 1))),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text("Выход из аккаунта ${user.username}."),
                ),
              ))),
        ],
      ),
    );
  }
}
