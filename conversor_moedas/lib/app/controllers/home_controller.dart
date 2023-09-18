/*import 'package:conversor_moedas/app/components/currency_box.dart';
import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  

  HomeController(this.toText, this.fromText) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(",", ".")) ?? 1.0;
    double returnValue = 0;

    if (value2 == "Real") {
      returnValue = value * toCurrency.real;
    } else if (value2 == "Dolar") {
      returnValue = value * toCurrency.dolar;
    } else if (value2 == "Euro") {
      returnValue = value * toCurrency.euro;
    } else if (value2 == "Bitcoin") {
      returnValue = value * toCurrency.bitcoin;
    } else {}

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
*/
