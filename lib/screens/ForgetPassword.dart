import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

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

              // Email Field
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

              // Reset Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    showDialog(
                      context: context,
                      builder: (ctx) =>  AlertDialog(
                        title: Text('Success'),
                        content: Text('Password reset link sent to $email'),
                      ),
                    );
                  }
                },
                child: const Text("Reset Password"),
              ),

              // Back Button
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
