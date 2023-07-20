import 'package:flutter/material.dart';

class SubScreen extends StatelessWidget {
  final String id;

  const SubScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub #$id'),
      ),
      body: Center(
        child: Text('Sub #$id'),
      ),
    );
  }
}