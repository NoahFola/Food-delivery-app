import 'package:flutter/material.dart';
import 'package:food_app/core/routes/routes.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Logo
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/logo.png', fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Login",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Add your details to login",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 30),
              const AuthTextField(
                hintText: "Your Email",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              const AuthTextField(
                hintText: "Password",
                icon: Icons.lock,
                isObscure: true,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  },
                  child: const Text("Login"),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Forgot password logic (optional/mock)
                },
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 30),
              const Text("or Login With"),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    icon: Icons.facebook,
                    color: const Color(0xFF3b5998),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                  SocialButton(
                    icon: Icons.g_mobiledata, // Using generic icon for Google
                    color: const Color(0xFFDB4437),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                  SocialButton(
                    icon: Icons.apple,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an Account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signup);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF2196F3),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
