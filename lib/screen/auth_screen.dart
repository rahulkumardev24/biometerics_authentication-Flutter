import 'package:biometeric_auth/screen/home_screen.dart';
import 'package:biometeric_auth/service/auth_service.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Auth screen")),
      body: Center(
        child: IconButton(
          onPressed: () async {
            bool check = await AuthService().authenticationLocally();
            if (check) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            }
          },

          icon: Icon(Icons.fingerprint, size: 100),
        ),
      ),
    );
  }
}
