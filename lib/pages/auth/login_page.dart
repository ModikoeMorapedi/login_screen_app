import 'package:flutter/material.dart';
import 'package:login_screen_app/pages/home_page.dart';
import 'package:login_screen_app/theme/m_color.dart';

import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.sizeOf(context).width;
    final buttonHight = MediaQuery.sizeOf(context).height / 14;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MColor.redAccentColor,
        title: const Text(
          "Momentum",
          style: TextStyle(
            color: MColor.whiteColor,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Log in",
                style: TextStyle(
                  color: MColor.redColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
                validator: (value) => validateEmail(value),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
                validator: (value) => validatePassword(value),
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MColor.redAccentColor,
                  fixedSize: Size(buttonWidth, buttonHight),
                ),
                onPressed: () {
                  final isValid = _formKey.currentState?.validate() ?? true;
                  if (isValid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomePage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill input'),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: MColor.whiteColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MColor.redAccentColor,
                  fixedSize: Size(
                    buttonWidth,
                    buttonHight,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const RegisterPage(),
                    ),
                  );
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                    color: MColor.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    return null;
  }

  validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }
}
