import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/orderPayment.dart';

class AmazingTransferOrderButton extends StatefulWidget {
  const AmazingTransferOrderButton({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<StatefulWidget> createState() => _AmazingTransferOrderButtonState();
}

class _AmazingTransferOrderButtonState extends State<AmazingTransferOrderButton> {
  late bool isPressed = false;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(195, 0, 70, 1))),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OrderPayment(),
          ));
        },
        child: const Text ("Перейти к оплате"),
      ),
    );
  }
}