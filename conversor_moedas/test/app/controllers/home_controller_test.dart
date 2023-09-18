import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main(){

   final TextEditingController toText = TextEditingController();
   final TextEditingController fromText = TextEditingController();

  final homeController = HomeController(toText,fromText);

  test("Vai converter de real para dolar com virgula", (() {
    toText.text = "2,0";
    homeController.convert();
    expect(fromText.text, 0.38);
  }));

  test("Vai converter de dolar para real com ponto", (() {
    toText.text = "1.0";
    homeController.toCurrency = CurrencyModel(
      "Dolar",5.28 , 1, 0.18, 0.000060
    );
    homeController.fromCurrency = CurrencyModel(
      "Real", 1, 0.19 , 0.18, 0.000011
    );
    homeController.convert();

    expect(fromText.text, 5.28);
  }));

}