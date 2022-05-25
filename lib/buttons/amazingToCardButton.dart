import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../globals/globals.dart';

class AmazingShopButton extends StatelessWidget {
  const AmazingShopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(195, 0, 70, 1))),
      onPressed: () {},
      //TODO: Добавить пост запрос на добавление ид в бд при нажатии на кнопку
      child: const Text("В корзину"),
    );
  }
}
