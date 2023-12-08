import 'package:flutter/material.dart';

class PointScreen extends StatelessWidget {
  const PointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Point'),
      ),
      body: const Center(
        child: Text('This is Point Screen',style: TextStyle(fontSize: 24),),
      ),
    );
  }
}
