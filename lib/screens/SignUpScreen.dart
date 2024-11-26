import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SignUPScreen extends StatelessWidget {
  const SignUPScreen({Key? key}) : super(key: key);

  Future<void> _sendSignUpData(String email, String login, String password) async {
    final dio = Dio();
    const url = 'https://qwerty.requestcatcher.com/';
    try {
      await dio.post(url, data: {'email': email, 'login': login, 'password': password});
    } catch (e) {
      print("Error sending sign-up data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String email = '';
    String login = '';
    String password = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo2.jpeg', width: 150, height: 150),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email', hintText: 'Enter your email'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email cannot be empty';
                  String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                  RegExp regExp = RegExp(pattern);
                  if (!regExp.hasMatch(value)) return 'Please enter a valid email';
                  return null;
                },
                onSaved: (value) => email = value!,
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Login', hintText: 'Enter your login'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Login cannot be empty';
                  return null;
                },
                onSaved: (value) => login = value!,
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password', hintText: 'Enter your password'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Password cannot be empty';
                  if (value.length < 7) return 'Password must be at least 7 characters long';
                  return null;
                },
                onSaved: (value) => password = value!,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _sendSignUpData(email, login, password); // Надсилаємо дані
                    showDialog(
                      context: context,
                      builder: (ctx) => const AlertDialog(
                        title: Text('Success'),
                        content: Text('Registration successful!'),
                      ),
                    );
                  }
                },
                child: const Text("Sign Up"),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
