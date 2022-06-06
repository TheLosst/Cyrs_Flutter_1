import 'package:cyrs_1/buttons/finishingPayButton.dart';
import 'package:cyrs_1/custom%20classes/customAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transparent_image_button/transparent_image_button.dart';

class OrderPayment extends StatefulWidget {
  const OrderPayment({Key? key}) : super(key: key);

  @override
  State<OrderPayment> createState() => _OrderPaymentState();
}

class _OrderPaymentState extends State<OrderPayment> {
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
      appBar: MyUltraCoolAppBar(
          controller, "Оплата", const Color.fromRGBO(144, 205, 249, 1), true),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: 180,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      color: const Color.fromRGBO(144, 205, 249, 1),
                    ))),
            TransparentImageButton.assets(
              "assets/images/Gpay.png",
              width: 200,
              onTapInside: () {},
              onTapOutside: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 220, top: 5),
              child: TransparentImageButton.assets(
                "assets/images/visaCard.png",
                width: 200,
                onTapInside: () {},
                onTapOutside: () {},
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 200,),
                child: AmazingFinishPay(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
