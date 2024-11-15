import 'package:flutter/material.dart';
import 'ForgetPassword.dart';
import 'SignUPScreen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String login = '';
    String password = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
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
                    showDialog(
                      context: context,
                      builder: (ctx) => const AlertDialog(
                        title: Text('Success'),
                        content: Text('Login successful!'),
                      ),
                    );
                  }
                },
                child: const Text("Login"),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUPScreen()),
                ),
                child: const Text('Sign Up'),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()),
                ),
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
