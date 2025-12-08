import 'package:flutter/material.dart';
import '../data/ice.dart';

class IceCreamWidget extends StatelessWidget {
  final Ice ice;

  const IceCreamWidget({super.key, required this.ice});

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
        ],
      )
    );
  }
}