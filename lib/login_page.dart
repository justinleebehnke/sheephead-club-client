import 'package:flutter/material.dart';
import 'package:sheephead_client/widgets/card_widget.dart';
import 'package:sheephead_client/widgets/player_widget.dart';
import 'signup_page.dart'; // You'll create this in the next step.

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              child: const Text('Don’t have an account? Sign up'),
            ),
            const Row(
              children: [CardWidget('QC'), CardWidget('QH')],
            ),
            Row(children: [
              PlayerWidget(
                username: 'Jesse',
                score: 10,
                isPicker: false,
                isDealer: true,
                isTheirTurn: true,
                isChopped: false,
              ),
              PlayerWidget(
                username: 'John',
                score: 14,
                isPicker: true,
                isDealer: true,
                isTheirTurn: true,
                isChopped: true,
              ),
              PlayerWidget(
                username: 'Jose De Maria Izazaga',
                score: 14,
                isPicker: true,
                isDealer: false,
                isTheirTurn: false,
                isChopped: false,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
