import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:glaces/view/ice_cream_widget.dart';
import '../repository/stock_repository.dart';

class StockWidget extends StatefulWidget {
  const StockWidget({super.key});

  @override
  State<StockWidget> createState() => _StockWidgetState();
}

enum RadioType { fillColor, backgroundColor, side, innerRadius }

class _StockWidgetState extends State<StockWidget> {
  bool onlyMissingIcecream = false;
  bool whippedCream = false;
  bool hazelnuts = false;
  var _price;
  double price = 0.0 ;
  int quantityCream = 0;
  String maximum = "Maximum 5";

  @override
  Widget build(BuildContext context) {

    final stockRepository = GetIt.instance<StockRepository>();
    final icecream = onlyMissingIcecream
        ? stockRepository.icecream
        .where((ice) => ice.quantity == 0)
        .toList()
        : stockRepository.icecream;
    return Scaffold(
        appBar: AppBar(
            title: const Text("Ice cream")
        ),
        body: Column(children: [
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(child :
                Text("Scoops Flavours")
              ),
              const SizedBox(width: 16),
              Text(maximum),
              const SizedBox(width: 16),
            ],),
          Row(children: [
            Checkbox(
              value: onlyMissingIcecream,
              onChanged: (bool? value) {
                setState(() {
                  onlyMissingIcecream = value!;
                });
              },
            ),
            const SizedBox(width: 16),
            const Expanded(child: Text("Show only missing products"))
          ]),
          const SizedBox(height: 16),
          Expanded(child:
                ListView.builder(
                  itemCount: icecream.length,
                  itemBuilder: (BuildContext contex, int index){
                    return IceCreamWidget(ice: icecream[index],
                    shiftQuantity: (shift) {
                      setState(() {
                        quantityCream = 0;
                        for (int i = 0; i < icecream.length; i++){
                          quantityCream += icecream[i].quantity;
                        }
                        if (shift > 0 && quantityCream >4){
                          maximum = "too many scoop selected";
                        }else {
                          icecream[index].quantity += shift;
                          maximum = "Maximum 5";
                        }
                      });
                    });
                  }
                ),
          ),
          Row(children: [
            Text("Cone or Cup"),
            const SizedBox(width: 16),
            const SizedBox(width: 16),
            const SizedBox(width: 16),

          ],),
          RadioGroup<double>(
            groupValue: _price,
            onChanged: (double? value) {
              setState(() {
                _price = value;
                if(value == 1.0) {
                  price = 1.0 + price;
                }else{
                  price = price -1;
                }
              });
            },
          child: const Column(
          children: [
          ListTile(
            title: Text('Cone'),
            leading: Radio<double>(value: 1.0),
          ),
          Text("1€"),
          ListTile(
            title: Text('Cup'),
            leading: Radio<double>(value: 0.0),
          ),
            Text("free"),],
          ),
          ),
          Row(children: [
            Text("Extras"),
          ],),
          Row(children: [
            Checkbox(
              value: whippedCream,
              onChanged: (bool? value) {
                setState(() {
                  whippedCream = value!;
                  if (value == true) {
                    price = price + 0.95;
                  }else{
                    price = price - 0.95;
                  }
                });
              },
            ),
            const SizedBox(width: 16),
            const Expanded(child: Text("Whipped cream")),
            Text("0.95€"),
            const SizedBox(width: 16),
          ]),
          Row(children: [
            Checkbox(
              value: hazelnuts,
              onChanged: (bool? value) {
                setState(() {
                  hazelnuts = value!;
                  if (value == true) {
                    price = price + 1.30;
                  }else{
                    price = price - 1.30;
                  }
                });
              },
            ),
            const SizedBox(width: 16),
            const Expanded(child: Text("Hazelnuts")),
            Text("1.30€"),
            const SizedBox(width: 16),
          ]),


          Row(children: [
            Text("Price"),
          ],),
          Row(children: [
            Text(price.toString()),
            const SizedBox(width: 16),
            const SizedBox(width: 16),
            const SizedBox(width: 16),

          ],),
          Row(children: [
            Text("   "),
          ],),
          Row(children: [
            Text("   "),
          ],),
          Row(children: [
            Text("   "),
          ],),


        ]));
  }


}