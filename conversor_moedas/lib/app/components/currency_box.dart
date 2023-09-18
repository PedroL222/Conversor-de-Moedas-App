import 'dart:math';

import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class moedaComponetizada extends StatelessWidget {

  final List<CurrencyModel> items;
  final TextEditingController controller;
  
  
  final String value2;
 
  
  final dropasasopcoes = ["Real", "Dolar", "Euro", "Biticoin"];
  final dropValue2 = ValueNotifier("");

  moedaComponetizada({super.key, required this.items, required this.controller, required this.value2,});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 7, 44, 255)),
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
          controller: controller,
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
    ]);
  }
}
