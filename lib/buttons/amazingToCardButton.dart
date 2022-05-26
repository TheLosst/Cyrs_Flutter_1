import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../globals/globals.dart';

class AmazingShopButton extends StatefulWidget {
  const AmazingShopButton({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<StatefulWidget> createState() => _AmazingShopButtonState();
}

class _AmazingShopButtonState extends State<AmazingShopButton> {
  late bool isPressed = false;
  List<String> textOnButton = ["В корзину","В корзине"];
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
        setState(() {
          if (index == 0){
            index = 1;
            shoppingCard[int.parse(widget.id)-1] = true;
            print(shoppingCard[int.parse(widget.id)-1]);
          }
          else {
            index = 0;
            //TODO: Добавить увеличение счетчика в корзине, если товар уже там
          }
        });

      },
      child: Text (textOnButton[index]),
    );
  }
}
