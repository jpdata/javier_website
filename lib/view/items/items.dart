

import 'package:flutter/material.dart';

class Item1Page extends StatelessWidget {
  const Item1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enviar email'),
      ),
      body: const Center(
        child: Text('This is the Item 1 Page'),
      ),
    );
  }
}

class Item2Page extends StatelessWidget {
  const Item2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item 2 Page'),
      ),
      body: const Center(
        child: Text('This is the Item 2 Page'),
      ),
    );
  }
}
