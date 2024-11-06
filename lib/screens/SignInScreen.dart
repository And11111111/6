import 'package:flutter/material.dart';
import 'package:lab6/screens/ForgetPassword.dart';
import 'package:lab6/screens/SignUPScreen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const _MainScreen(),
    );
  }
}

class _MainScreen extends StatelessWidget {
  const _MainScreen();

  @override
  Widget build(BuildContext context) {

    void goToForgetPassword() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
        ),
      );
    }

    void goToSignUpScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  SignUPScreen(),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
        title: const Text('Sign In'), // Заголовок AppBar
    centerTitle: true, // Центрує заголовок
    backgroundColor: Colors.deepPurple,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(
            'assets/logo2.jpeg',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
            const SizedBox(height: 30,),

            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  hintText: 'Enter your login...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  labelText: 'Login',
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 15),



            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: TextField(
                obscureText: true, // *******
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  hintText: 'Enter your password...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  labelText: 'Password',
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 15),



            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return const AlertDialog(
                      title: Text('Message'),
                      content: Text("Need to implement"),
                    );
                  },
                );
              },
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: goToSignUpScreen,
              child: const Text(
                'Sign Up',
                style: TextStyle(),
              ),
            ),
            TextButton(
              onPressed: goToForgetPassword,
              child: const Text(
                'Forgot Password?',
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

