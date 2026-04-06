import 'package:flutter/material.dart';
import 'package:frontend/core/constants/common_style.dart';
import 'package:frontend/core/network/api_client.dart';
import 'package:frontend/features/auth/presentation/pages/login.dart';
import 'package:frontend/features/home/presentation/pages/home_page.dart';

class Replaceforgottenpassword extends StatefulWidget {
  final String userMail;
  const Replaceforgottenpassword({super.key, required this.userMail});

  @override
  State<Replaceforgottenpassword> createState() =>
      _ReplaceforgottenpasswordState();
}

class _ReplaceforgottenpasswordState extends State<Replaceforgottenpassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                'Enter your new password',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              /// Password Field
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
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

              /// Confirm Password Field
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
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
              //Change with new password button

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
                    print("Confirm your new password");
                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Passwords do not match.'),
                        ),
                      );
                      return;
                    }

                    if (_passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a password.'),
                        ),
                      );
                      return;
                    }

                    if (_confirmPasswordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a password.'),
                        ),
                      );
                      return;
                    }

                    final response =
                        await ApiClient.replaceforgottenpasswordAPICall(
                      email: widget.userMail,
                      new_password: _passwordController.text,
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
                            builder: (context) => LoginScreen(),
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
                  child: Text('Reset Password', style: AppTextStyles.button),
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
