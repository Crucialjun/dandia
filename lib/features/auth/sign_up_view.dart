

import 'package:dandia/core/constants/app_assets.dart';
import 'package:dandia/shared/app_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign_up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(AppAssets.logo),
            const Text(
              "Create a User's Account",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(children: [
                TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  decoration:
                      const AppInputDecoration(labelString: "User Name"),
                  style: const TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 22.h),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const AppInputDecoration(labelString: "Email"),
                  style: const TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 22.h),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration:
                      const AppInputDecoration(labelString: "User Name"),
                  style: const TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 22.h),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 80.w, vertical: 10.h),
                      backgroundColor: Colors.purple),
                  child: const Text("Sign Up"),
                ),
                SizedBox(height: 22.h),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Already have an account? Sign In",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ))
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
