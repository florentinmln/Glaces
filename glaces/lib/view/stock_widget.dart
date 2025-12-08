import 'package:flutter/material.dart';

class StockWidget extends StatelessWidget {
  const StockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ice cream")
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Scoops flavours"),
      ),
    );
  }
}