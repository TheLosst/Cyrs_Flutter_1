import 'package:cyrs_1/pages/payPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmazingBuyButton extends StatefulWidget {
  const AmazingBuyButton({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<StatefulWidget> createState() => _AmazingBuyButtonState();
}

class _AmazingBuyButtonState extends State<AmazingBuyButton> {
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
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PayPage(),
        ));
      },
      child: const Text ("Перейти к оформлению"),
    );
  }
}
