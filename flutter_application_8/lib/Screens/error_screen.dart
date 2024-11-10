import 'package:flutter/material.dart';

class errorScreen extends StatefulWidget {
  const errorScreen({super.key, required this.onpressed});
  final void Function() onpressed;

  @override
  State<errorScreen> createState() => _errorScreenState();
}

class _errorScreenState extends State<errorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3a3f54),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Something Went Wrong!!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23.0,
                fontFamily: 'SF-Pro',
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Loacation is disabled',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23.0,
                fontFamily: 'SF-Pro',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            FilledButton(
              onPressed: widget.onpressed,
              child: Text('please Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
