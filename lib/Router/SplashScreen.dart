import 'dart:convert';
//import 'dart:html';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: DefaultTextStyle(
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      child: Text('Welcome to PhishGuard')),
                ),
                Image.asset(
                  'assets/icon-shield.png',
                  width: 100,
                  scale: 1.3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}