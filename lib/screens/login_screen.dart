import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goals_app/widgets/input.dart';

import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  const LoginForm({ super.key });

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  String username = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Input(
                  fillColor: Colors.white,
                  placeholder: 'Username',
                  onChanged: (String value) => username = value,
                  validator: (String? value) => value == null || value.isEmpty ? 'We need your username to validate' : null,
                ),
                SizedBox(height: 20),
                Input(
                  fillColor: Colors.white,
                  placeholder: 'Password',
                  obscureText: true,
                  validator: (String? value) => value == null || value.isEmpty ? 'We need your password to validate' : null,
                  onChanged: (value) => password = value,
                ),
                SizedBox(height: 50),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => login(),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                    ),
                    child: Text("Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        )
      )
    );
  }

  Future login() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(Uri.parse('http://localhost:8080/login'),
        headers: {
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password
        })
      );

      if (response.statusCode == 200) {
        context.go('/home');
      }
    }
  }

}