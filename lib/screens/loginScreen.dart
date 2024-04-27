// ignore_for_file: file_names

import 'package:assignment/custom/switch.dart';
import 'package:assignment/screens/emailScreen.dart';
import 'package:assignment/screens/phonelLoginScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isEmailLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/unnamed.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            CustomSwitchButton(
              isEmailSelected: isEmailLogin,
              onChanged: (newValue) {
                setState(() {
                  isEmailLogin = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isEmailLogin ? EmailLoginForm() : const PhoneLoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
