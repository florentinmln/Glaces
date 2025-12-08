import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:glaces/view/ice_cream_widget.dart';
import '../repository/stock_repository.dart';

class StockWidget extends StatelessWidget {
  const StockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool onlyMissingIcecream = true;
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
        Row(children: [
          Checkbox(value: onlyMissingIcecream,
              onChanged: (bool? value) {
                onlyMissingIcecream = value!;
              },
          ),
          const SizedBox(width: 16),
          const Expanded(child: Text("Show only missing products"))
        ]),
        const SizedBox(height: 16),
        Expanded(
            child: ListView.builder(
                itemCount: icecream.length,
                itemBuilder: (BuildContext contex, int index){
                  return IceCreamWidget(ice: icecream[index]);
                }))

      ]));
  }
}