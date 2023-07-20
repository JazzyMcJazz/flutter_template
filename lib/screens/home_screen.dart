import 'package:flutter/material.dart';
import 'package:flutter_routing/router/route_utils.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    void handleNavigate() {
      context.pushNamed(
        AppScreen.subscreen.toName, 
        pathParameters: { 'id': '24' }
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Router App"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: handleNavigate, 
          child: const Text("Push next screen")
        ),
      ),
    );
  }
}