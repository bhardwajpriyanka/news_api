import 'dart:async';
import 'package:flutter/material.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  State<LogoScreen> createState() => _SplseScreenState();
}

class _SplseScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context,'new' );
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "News",style: TextStyle(fontWeight:FontWeight.w800,color: Colors.white,fontSize: 90),
              )
            ],
          ),
        ),
      ),
    );
  }
}