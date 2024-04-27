import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:assignment/screens/otpScreen.dart';

class PhoneLoginForm extends StatefulWidget {
  const PhoneLoginForm({Key? key}) : super(key: key);

  @override
  _PhoneLoginFormState createState() => _PhoneLoginFormState();
}

class _PhoneLoginFormState extends State<PhoneLoginForm> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Glade to see you!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Please provide your Phone number!'),
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Phone Number',
              ),
            ),
          ),
          if (_errorMessage != null)
            Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // Background color
            ),
            onPressed: () {
              // _loginWithPhone(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OTPScreen(phoneNumber: ''),
                ),
              );
            },
            child: const SizedBox(
              width: 200,
              height: 50,
              child: Center(
                child: Text(
                  'Send Code',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loginWithPhone(BuildContext context) async {
    final String phoneNumber = _phoneNumberController.text.trim();
    try {
      final response = await http.post(
        Uri.parse('http://devapiv3.dealsdray.com/api/v2/user/otp'),
        body: json.encode({'phone': phoneNumber}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // If status code is 200, navigate to OTP screen
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(phoneNumber: phoneNumber),
          ),
        );
      } else {
        // If status code is not 200, show error message
        setState(() {
          _errorMessage = 'Failed to send OTP. Please try again later.';
        });
      }
    } catch (error) {
      // Handle network errors
      setState(() {
        _errorMessage = 'Network error occurred. Please check your connection.';
      });
    }
  }
}
