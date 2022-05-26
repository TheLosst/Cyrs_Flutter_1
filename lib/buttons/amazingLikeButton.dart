import 'package:cyrs_1/globals/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmazingLikeButton extends StatefulWidget {
  const AmazingLikeButton({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<AmazingLikeButton> createState() => _AmazingLikeButtonState();
}


class _AmazingLikeButtonState extends State<AmazingLikeButton> {

  late bool toggle;

  @override
  void initState() {
    super.initState();
    if(like[int.parse(widget.id)-1]){
      toggle = true;
    }
    else
      {
        toggle = false;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            border: Border.all(
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Transform.scale(
          scale: 3,
          child: IconButton(
            splashColor: Colors.transparent,
            splashRadius: 1,
            icon: Icon(
              (toggle == false) ? Icons.favorite_border : Icons.favorite,
              size: 6,
            ),
            tooltip: null,
            onPressed: () {
              setState(() {
                if (!like[int.parse(widget.id)-1]) {
                  toggle = !toggle;
                  like[int.parse(widget.id)-1] = true;
                } else {
                  toggle = !toggle;
                  like[int.parse(widget.id)-1] = false;
                }
                print(like[int.parse(widget.id)-1]);
              });
            }, //TODO: Добавить смену иконки при нажатии и отправлять пост запрос на добавление id в бд для избранного и корзины
          ),
        ));
  }
}
