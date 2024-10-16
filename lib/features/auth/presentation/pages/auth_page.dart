import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 2) + 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 85, 206, 93),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(100, 100),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2 + 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
