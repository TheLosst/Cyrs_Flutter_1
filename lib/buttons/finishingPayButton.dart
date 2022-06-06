import 'package:cyrs_1/navigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmazingFinishPay extends StatefulWidget {
  const AmazingFinishPay({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AmazingFinishPayState();
}

class _AmazingFinishPayState extends State<AmazingFinishPay> {
  late bool isPressed = false;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(195, 0, 70, 1))),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Catalog()),
              (Route<dynamic> route) => false,
        );
      },
      child: const Text ("Оплатить"),
    );
  }
}
