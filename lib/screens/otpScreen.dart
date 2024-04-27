import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class OTPScreen extends StatefulWidget {
  final String phoneNumber;

  const OTPScreen({required this.phoneNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();

  late Timer _resendTimer;
  int _resendTimerDuration = 120; // 2 minutes in seconds
  bool _timerActive = false;

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  @override
  void dispose() {
    _resendTimer.cancel();
    super.dispose();
  }

  void startResendTimer() {
    _resendTimer = Timer.periodic(const Duration(seconds: 0), (timer) {
      setState(() {
        _resendTimerDuration--;
      });
      if (_resendTimerDuration <= 0) {
        _resendTimer.cancel();
        _timerActive = false;
      }
    });
  }

  void resetTimer() {
    setState(() {
      _resendTimerDuration = 120;
    });
    startResendTimer();
  }

  Future<void> verifyOTP() async {
    const url = 'http://devapiv3.dealsdray.com/api/v2/user/otp/verification';
    final otp = _otpController1.text +
        _otpController2.text +
        _otpController3.text +
        _otpController4.text;

    try {
      final response = await http.post(Uri.parse(url),
          body: {'phoneNumber': widget.phoneNumber, 'otp': otp});

      if (response.statusCode == 200) {
        // OTP verification successful
        // Navigate back to the home screen
        Navigator.pop(context);
      } else {
        // OTP verification failed
        // Handle failure scenario
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP verification failed. Please try again.'),
          ),
        );
        // Reset the timer when OTP verification fails
        resetTimer();
      }
    } catch (e) {
      // Handle network errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to connect to the server. Please try again.'),
        ),
      );
      // Reset the timer on network errors
      resetTimer();
    }
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('OTP Verification'),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.all(30.0),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 buildOtpField(_otpController1),
  //                 buildOtpField(_otpController2),
  //                 buildOtpField(_otpController3),
  //                 buildOtpField(_otpController4),
  //               ],
  //             ),
  //           ),
  //           if (_resendTimerDuration <= 0 && !_timerActive)
  //             TextButton(
  //               onPressed: () {
  //                 // Resend OTP logic goes here
  //                 // Set _timerActive to true to prevent multiple taps
  //                 _timerActive = true;
  //                 // Reset the timer
  //                 resetTimer();
  //               },
  //               child: const Text('Resend OTP'),
  //             )
  //           else if (_resendTimerDuration > 0)
  //             Text(
  //               'Resend OTP in $_resendTimerDuration seconds',
  //               style: const TextStyle(color: Colors.black),
  //             )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                child: Image.asset(
                  'assets/sms.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'OTP Verification',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'We have to sent a unique OTP Number  ',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Text(
                      '  to your mobile ',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: buildOtpField(_otpController1)),
                        Flexible(child: buildOtpField(_otpController2)),
                        Flexible(child: buildOtpField(_otpController3)),
                        Flexible(child: buildOtpField(_otpController4)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _resendTimerDuration <= 0
                              ? 'Resend OTP in 0 seconds'
                              : 'Resend OTP in $_resendTimerDuration seconds',
                          style: TextStyle(
                            color: _resendTimerDuration <= 0
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                        _resendTimerDuration <= 0 && !_timerActive
                            ? TextButton(
                                onPressed: () {
                                  _timerActive = true;
                                  resetTimer();
                                },
                                child: const Text('Resend OTP'),
                              )
                            : const SizedBox(), // Hide the button if the timer is active
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildOtpField(TextEditingController controller) {
    return Container(
      height: 68,
      width: 64,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Set your desired color here
          width: 1.0, // Set the width of the border
        ),
        borderRadius:
            BorderRadius.circular(15.0), // Set border radius if needed
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            if (value.length == 1) {
              // Move focus to the next field
              FocusScope.of(context).nextFocus();
            }
          },
          decoration: const InputDecoration(
            border:
                InputBorder.none, // Remove the default border of TextFormField
          ),
        ),
      ),
    );
  }
}
