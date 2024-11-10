import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingScreen extends StatefulWidget {
  const loadingScreen({super.key});

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3a3f54),
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
