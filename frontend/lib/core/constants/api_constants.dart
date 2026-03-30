import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/features/auth/presentation/pages/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const String BASE_URL = "https://collab-backend-hp3t.onrender.com";
const String VALIDATE_MAIL = "/auth/validate-email";
const String LOGIN_ENDPOINT = "/auth/login";
const String REGISTER_ENDPOINT = "/auth/register";
const String REQUEST_OTP = "/auth/forgot-password/request-otp";
const String VERIFY_OTP = "/auth/forgot-password/verify-otp";
const String REPLACE_PASSWORD = "/auth/forgot-password/reset";
