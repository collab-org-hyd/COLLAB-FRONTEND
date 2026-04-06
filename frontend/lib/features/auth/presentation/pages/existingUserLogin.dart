import 'package:flutter/material.dart';
import 'package:frontend/core/constants/common_style.dart';
import 'package:frontend/core/network/api_client.dart';
import 'package:frontend/features/auth/presentation/pages/replaceForgottenPassword.dart';
import 'package:frontend/features/home/presentation/pages/home_page.dart';
import 'package:frontend/features/auth/presentation/pages/verifyOTP.dart';

class ExistingUserLoginScreen extends StatefulWidget {
  final String userMail;
  const ExistingUserLoginScreen({super.key, required this.userMail});

  @override
  State<ExistingUserLoginScreen> createState() =>
      _ExistingUserLoginScreenState();
}

class _ExistingUserLoginScreenState extends State<ExistingUserLoginScreen> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
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

              /// Page Title
              Text('Welcome Back', style: AppTextStyles.heading),

              const SizedBox(height: 8),

              //username
              TextField(
                // controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: widget.userMail,
                  labelStyle: AppTextStyles.body,
                  filled: true,
                  fillColor: AppColors.inputFill,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              Text(
                'Enter your password to continue',
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
                    print('Password: ${_passwordController.text}');
                    final response = await ApiClient.verifyExistingUser(
                        widget.userMail, _passwordController.text);

                    if (response != null) {
                      // Check if login was successful (adjust based on your API response)
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
                        // Show error message
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Center(
                                  child: Text(
                                'Login Failed',
                              )),
                              content: const Text(
                                  'This email is not registered. Would you like to sign up or try again?'),
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .stretch, // Makes buttons full width
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                        ),
                                        child: Text("Try Again",
                                            style: AppTextStyles.button),
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      // API error
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Center(
                                child: Text(
                              'Incorrect Password',
                            )),
                            content: const Text(
                                'This password is incorrect.Would you like to try again?'),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .stretch, // Makes buttons full width
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        _passwordController.clear();
                                        Navigator.of(context).pop();
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                      ),
                                      child: Text("Try Again",
                                          style: AppTextStyles.button),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Login', style: AppTextStyles.button),
                ),
              ),

              const SizedBox(height: 16),

              /// Forgot Password
              TextButton(
                //OTP
                // onPressed: () async {
                //   final response =
                //       await ApiClient.requestOTP(email: widget.userMail);
                //   if (response != null) {
                //     // Check if otp was successfully requested (adjust based on your API response)
                //     final bool success = response['success'] ??
                //         response['status'] == true ??
                //         response['token'] != null ??
                //         false;

                //     if (success) {
                //       // Navigate to home page with response data
                //       Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) =>
                //               VerifyOTP(userMail: widget.userMail),
                //         ),
                //       );
                //     } else {
                //       // Show error message
                //       showDialog(
                //         context: context,
                //         barrierDismissible: false,
                //         builder: (BuildContext context) {
                //           return AlertDialog(
                //             title: const Center(
                //                 child: Text(
                //               'Login Failed',
                //             )),
                //             content: const Text(
                //                 'This email is not registered. Would you like to sign up or try again?'),
                //             actions: [
                //               Padding(
                //                 padding: const EdgeInsets.symmetric(
                //                     horizontal: 16.0, vertical: 8.0),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment
                //                       .stretch, // Makes buttons full width
                //                   children: [
                //                     TextButton(
                //                       onPressed: () {
                //                         Navigator.of(context).pop();
                //                       },
                //                       style: TextButton.styleFrom(
                //                         backgroundColor: Colors.black,
                //                         foregroundColor: Colors.white,
                //                       ),
                //                       child: Text("Try Again",
                //                           style: AppTextStyles.button),
                //                     ),
                //                     const SizedBox(height: 8),
                //                   ],
                //                 ),
                //               )
                //             ],
                //           );
                //         },
                //       );
                //     }
                //   } else {
                //     // API error
                //     showDialog(
                //       context: context,
                //       barrierDismissible: false,
                //       builder: (BuildContext context) {
                //         return AlertDialog(
                //           title: const Center(
                //               child: Text(
                //             'Incorrect Password',
                //           )),
                //           content: const Text(
                //               'This password is incorrect.Would you like to try again?'),
                //           actions: [
                //             Padding(
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: 16.0, vertical: 8.0),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment
                //                     .stretch, // Makes buttons full width
                //                 children: [
                //                   TextButton(
                //                     onPressed: () {
                //                       _passwordController.clear();
                //                       Navigator.of(context).pop();
                //                     },
                //                     style: TextButton.styleFrom(
                //                       backgroundColor: Colors.black,
                //                       foregroundColor: Colors.white,
                //                     ),
                //                     child: Text("Try Again",
                //                         style: AppTextStyles.button),
                //                   ),
                //                   const SizedBox(height: 8),
                //                 ],
                //               ),
                //             )
                //           ],
                //         );
                //       },
                //     );
                //   }
                // },

                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Replaceforgottenpassword(
                        userMail: widget.userMail,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
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
