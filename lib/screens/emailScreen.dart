import 'dart:convert';
import 'package:assignment/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmailLoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final String email = emailController.text;
    final String password = passwordController.text;
    final String referralCode = referralCodeController.text;

    // Make API call for authentication
    final response = await http.post(
      Uri.parse('http://devapiv3.dealsdray.com/api/v2/user/email/referral'),
      body: jsonEncode({
        'email': email,
        'password': password,
        'referral_code': referralCode,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        // Instantiate the new page
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Handle errors
      // You might want to show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            // Wrap SingleChildScrollView with a Container
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height, // Set minimum height
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Let\'s Begin!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: referralCodeController,
                    decoration: const InputDecoration(
                      labelText: 'Referral Code (optional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // Other email login related fields
                Container(
                  height: 50,
                  width: 70,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(left: 250, top: 100),
                  child: SizedBox(
                    height: 50,
                    width: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Background color
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        // Instantiate the new page
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      ),
                      child: const Icon(
                        Icons.arrow_right_alt_outlined,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
