import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    void handleLogin() {
      Provider.of<AuthService>(context, listen: false).login();
    }

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: handleLogin, 
          child: const Text('Login'),
        ),
      ),
    );
  }
}