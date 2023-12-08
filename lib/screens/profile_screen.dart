
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('This is Profile Screen',style: TextStyle(fontSize: 24),),
      ),
    );
  }
}
