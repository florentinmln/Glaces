import 'package:flutter/material.dart';
import '../data/ice.dart';

class IceCreamWidget extends StatelessWidget {
  final Ice ice;
  final void Function(int shift) shiftQuantity;

  const IceCreamWidget({super.key, required this.ice, required this.shiftQuantity});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(child: Text(ice.name)),
          const SizedBox(width: 16),
          Text("${ice.quantity}"),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: ice.quantity > 0
                ? () {
              shiftQuantity(-1);
            } : null,
              child: const Text("-")),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              shiftQuantity(1);
            },
            child: const Text("+")),
        ],
      )
    );
  }
}