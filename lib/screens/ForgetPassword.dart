import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  Future<void> _sendResetData(String email) async {
    final dio = Dio();
    final url = 'https://qwerty.requestcatcher.com/';
    try {
      await dio.post(url, data: {'email': email});
    } catch (e) {
      print("Error sending reset password data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String email = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _sendResetData(email); // Надсилаємо дані
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Success'),
                        content: Text('Password reset link sent to $email'),
                      ),
                    );
                  }
                },
                child: const Text("Reset Password"),
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
