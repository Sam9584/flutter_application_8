import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_8/Screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/Background2.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Center(
              child: Form(
                key: _formkey, // Assigning _formkey to the Form widget
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign up to your account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SF-Pro',
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    // Form fields for first name, last name, email, and password
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
                          prefixIcon: Icon(Icons.person, color: Colors.black),
                          hintText: 'first name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelText: 'first name',
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Last name is required';
                          } else if (value.length < 5) {
                            return 'Last name must be more than 5 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.black),
                          hintText: 'last name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelText: 'last name',
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
                            return 'Password must be more than 5 characters';
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
                          print("Validation Successful");
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
      ),
    );
  }
}
