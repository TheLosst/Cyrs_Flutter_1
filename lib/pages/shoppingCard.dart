
import 'package:cyrs_1/buttons/amazingBuyButton.dart';
import 'package:cyrs_1/custom%20classes/customAppBar.dart';
import 'package:cyrs_1/custom%20classes/shoppingCardListView.dart';
import 'package:cyrs_1/globals/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShoppingCard extends StatefulWidget {
  const ShoppingCard({Key? key}) : super(key: key);

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

//TODO: Сделеать кнопку Перейти к формлению!!!
class _ShoppingCardState extends State<ShoppingCard> {
  void reload(){
    setState((){});
  }
  late TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyUltraCoolAppBar(controller,"Корзина", Colors.black, false),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 12),
        child: Stack(
          children: [
            ListView.builder(itemBuilder: (BuildContext context, int index) => ShoppingCardListView(context, index, reload), itemCount: shoppingCard.length,),
            const Center(child: Padding(
              padding: EdgeInsets.only(top: 480),
              child: AmazingBuyButton(id: 'none',),
            ))
          ],
        ),
      ),
    );
  }
}

