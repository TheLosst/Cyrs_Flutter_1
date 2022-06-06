import 'package:cyrs_1/buttons/amazingTransferOrderButton.dart';
import 'package:cyrs_1/custom%20classes/customAppBar.dart';
import 'package:cyrs_1/custom%20classes/shoppingCardListView.dart';
import 'package:cyrs_1/globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PayPage extends StatefulWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  State<PayPage> createState() => _PayPageState();
}


class _PayPageState extends State<PayPage> {
  late TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    int summ = 0;
    int sizeOfCard = 0;
    for(int i = 0; i < test.length; i++){
      if(shoppingCard[i])
      {
        summ += test[i].cost;
        sizeOfCard++;
      }
    }
    void reload(){
      setState((){});
    }

    return Scaffold(
      appBar: MyUltraCoolAppBar(controller, "Оформление заказа",
          const Color.fromRGBO(144, 205, 249, 1), true),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: 410,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      ShoppingCardListView(context, index, reload),
                  itemCount: shoppingCard.length,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 450),
              child: Container(
                width: double.infinity,
                height: 200,
                color: const Color.fromRGBO(144, 205, 249, 1),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 480, left: 30),
                      child: Text(
                        "Итого : ",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 480,left: 150),
                      child: Text("$summ руб.",style: const TextStyle(fontSize: 25),),
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.only(top: 0,right: 240),child: Text("Всего $sizeOfCard товаров."),),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: AmazingTransferOrderButton(id: "lol"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
