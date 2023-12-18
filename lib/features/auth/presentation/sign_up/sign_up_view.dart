import 'package:dandia/core/constants/app_assets.dart';
import 'package:dandia/features/auth/presentation/sign_up/bloc/signup_bloc.dart';
import 'package:dandia/shared/app_input_decoration.dart';
import 'package:dandia/shared/app_text_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
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
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      return AppTextValidators.validateUserName(value);
                    },
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration:
                        const AppInputDecoration(labelString: "User Name"),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 22.h),
                  TextFormField(
                    validator: (value) {
                      return AppTextValidators.validateEmail(value);
                    },
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const AppInputDecoration(labelString: "Email"),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 22.h),
                  TextFormField(
                    validator: (value) {
                      return AppTextValidators.validatePassword(value);
                    },
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration:
                        const AppInputDecoration(labelString: "Password"),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 22.h),
                  TextFormField(
                    controller: _phoneController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration:
                        const AppInputDecoration(labelString: "Phone Number"),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 22.h),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<SignupBloc>().add(SignupWithEmailEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                              username: _usernameController.text,
                              phone: _phoneController.text,
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 80.w, vertical: 10.h),
                        backgroundColor: Colors.purple),
                    child: const Text("Sign Up"),
                  ),
                  SizedBox(height: 22.h),
                  TextButton(
                      onPressed: () {
                        context.read<SignupBloc>().add(NavigateToSigninEvent());
                      },
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
      ),
    ));
  }
}
