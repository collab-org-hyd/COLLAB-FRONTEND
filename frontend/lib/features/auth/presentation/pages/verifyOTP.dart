import 'package:flutter/material.dart';
import 'package:frontend/core/constants/common_style.dart';
import 'package:frontend/core/network/api_client.dart';
import 'package:frontend/features/home/presentation/pages/home_page.dart';

class VerifyOTP extends StatefulWidget {
  final String userMail;
  const VerifyOTP({super.key, required this.userMail});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  // final String userMail;
  final TextEditingController _OTPController = TextEditingController();

  @override
  void dispose() {
    _OTPController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        backgroundColor: AppColors.scaffold,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              Text(
                'Enter your OTP',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              /// Password Field
              TextField(
                controller: _OTPController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'OTP',
                  labelStyle: AppTextStyles.body,
                  filled: true,
                  fillColor: AppColors.inputFill,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// Login Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () async {
                    // Validate passwords match
                    print("Confirm OTP");

                    if (_OTPController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your OTP.'),
                        ),
                      );
                      return;
                    }

                    final response = await ApiClient.verifyOTP(
                      email: widget.userMail,
                      otp: _OTPController.text,
                    );

                    if (response != null) {
                      final bool success = response['success'] ??
                          response['status'] == true ??
                          response['token'] != null ??
                          false;

                      if (success) {
                        // Navigate to home page with response data
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomePage(responseData: response),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(response['message'] ??
                                'Replacing password failed. Please try again.'),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Replacing password failed. Please try again.'),
                        ),
                      );
                    }
                  },
                  child: Text('Sign Up', style: AppTextStyles.button),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
