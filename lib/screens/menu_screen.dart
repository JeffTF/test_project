import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Menu'),
      ),
      body: const Center(
        child: Text('This is Menu Screen',style: TextStyle(fontSize: 24),),
      ),
    );
  }
}
