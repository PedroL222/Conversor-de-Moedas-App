import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/currency_box.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<CurrencyModel> currencies = [
    CurrencyModel("Real", 1, 0.19, 0.18, 0.000011),
    CurrencyModel("Dolar", 5.28, 1, 0.18, 0.000060),
    CurrencyModel("Euro", 5.64, 1.07, 1, 0.000064),
    CurrencyModel("Bitcoin", 87623.39, 16603.20, 15549.70, 1),
  ];

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  TextEditingController toText = TextEditingController();
  TextEditingController fromText = TextEditingController();

  final dropasasopcoes = ["Real", "Dolar", "Euro", "Bitcoin"];
  final dropValue2 = ValueNotifier("");

  final dropasasopcoes2 = ["Real", "Dolar", "Euro", "Bitcoin"];
  final dropValue3 = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 100, bottom: 20),
              child: Column(
                children: [
                  Image.asset(
                    "assents/imagens/logo1.png",
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                      flex: 1,
                      child: ValueListenableBuilder(
                          valueListenable: dropValue2,
                          builder: (BuildContext context, value2, _) {
                            return SizedBox(
                              height: 55,
                              child: DropdownButtonFormField(
                                iconEnabledColor: Colors.amber,
                                isExpanded: true,
                                hint: Text(
                                  "Moeda",
                                  style: TextStyle(fontSize: 20),
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 7, 44, 255)),
                                  ),
                                ),
                                value: (value2.isEmpty) ? null : value2,
                                onChanged: (escolha) =>
                                    dropValue2.value = escolha.toString(),
                                onTap: () {
                                  value2 = dropValue2.value;
                                },
                                items: dropasasopcoes
                                    .map(
                                      (op) => DropdownMenuItem(
                                        value: op,
                                        child: Text(op),
                                      ),
                                    )
                                    .toList(),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: toText,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 30,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                      flex: 1,
                      child: ValueListenableBuilder(
                          valueListenable: dropValue3,
                          builder: (BuildContext context, value3, _) {
                            return SizedBox(
                              height: 55,
                              child: DropdownButtonFormField(
                                iconEnabledColor: Colors.amber,
                                isExpanded: true,
                                hint: Text(
                                  "Moeda",
                                  style: TextStyle(fontSize: 20),
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 7, 44, 255)),
                                  ),
                                ),
                                value: (value3.isEmpty) ? null : value3,
                                onChanged: (escolha) =>
                                    dropValue3.value = escolha.toString(),
                                onTap: () {
                                  value3 = dropValue3.value;
                                },
                                items: dropasasopcoes2
                                    .map(
                                      (op) => DropdownMenuItem(
                                        value: op,
                                        child: Text(op),
                                      ),
                                    )
                                    .toList(),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: fromText,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      String text = toText.text;
                      double valor =
                          double.tryParse(text.replaceAll(",", ".")) ?? 1.0;
                      double returnValue = 0;

                      returnValue = valor * currencies[0].real;
                      fromText.text = returnValue.toStringAsFixed(2);

                      for (CurrencyModel i in currencies) {
                        if (i.nome == dropValue2.value && i.nome == "Real") {
                          if (dropValue3.value == "Real") {
                            returnValue = valor * i.real;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          } else if (dropValue3.value == "Dolar") {
                            returnValue = valor * i.dolar;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          } else if (dropValue3.value == "Euro") {
                            returnValue = valor * i.euro;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          } else if (dropValue3.value == "Bitcoin") {
                            returnValue = valor * i.bitcoin;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          }
                        } else if (i.nome == dropValue2.value &&
                            i.nome == "Dolar") {
                          if (dropValue3.value == "Real") {
                            returnValue = valor * i.real;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          } else if (dropValue3.value == "Dolar") {
                            returnValue = valor * i.dolar;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          } else if (dropValue3.value == "Euro") {
                            returnValue = valor * i.euro;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          } else if (dropValue3.value == "Bitcoin") {
                            returnValue = valor * i.bitcoin;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          }
                        } else if (i.nome == dropValue2.value &&
                            i.nome == "Euro") {
                          if (dropValue3.value == "Real") {
                            returnValue = valor * i.real;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          } else if (dropValue3.value == "Dolar") {
                            returnValue = valor * i.dolar;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          } else if (dropValue3.value == "Euro") {
                            returnValue = valor * i.euro;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          } else if (dropValue3.value == "Bitcoin") {
                            returnValue = valor * i.bitcoin;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          }
                        } else if (i.nome == dropValue2.value &&
                            i.nome == "Bitcoin") {
                          if (dropValue3.value == "Real") {
                            returnValue = valor * i.real;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          } else if (dropValue3.value == "Dolar") {
                            returnValue = valor * i.dolar;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          } else if (dropValue3.value == "Euro") {
                            returnValue = valor * i.euro;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          } else if (dropValue3.value == "Bitcoin") {
                            returnValue = valor * i.bitcoin;
                            fromText.text = returnValue.toStringAsFixed(2);
                            print(fromText.text);
                          }
                        }
                      }
                      ;
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        width: 150,
                        height: 60,
                        color: Color.fromARGB(255, 126, 146, 12),
                        child: Center(
                          child: Text(
                            "CONVERTER",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
