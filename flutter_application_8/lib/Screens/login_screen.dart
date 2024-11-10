import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_8/Screens/home_screen.dart';
import 'package:flutter_application_8/Screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Background2.png',
            fit: BoxFit.cover, // khalt el sora kolha wakhda el screen
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign in to you account',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SF-Pro',
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'First time here?',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  RegisterScreen(), //Registerscreen
                            ),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username is required';
                        } else if (value.length < 5) {
                          return 'Username must be more than 5 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        } else if (value.length < 5) {
                          return 'Email must be more than 5 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 5) {
                          return 'Username must be more than 5 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.key, color: Colors.black),
                        hintText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => homeScreen(),
                          ),
                        );
                      }
                    },
                    style:
                        FilledButton.styleFrom(backgroundColor: Colors.black),
                    child: Text('Get Started'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
