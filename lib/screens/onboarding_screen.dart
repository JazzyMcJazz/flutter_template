import 'package:flutter/material.dart';
import 'package:flutter_routing/router/route_utils.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppScreen.onboarding.toTitle)),
      body: const Center(
        child: Text('Onboarding...'),
      )
    );
  }
}