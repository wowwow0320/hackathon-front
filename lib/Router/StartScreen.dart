import 'dart:convert';
//import 'dart:html';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hackathon/Router/Login.dart';
import 'package:hackathon/Router/Register.dart';


class StartScreen extends StatelessWidget {
  StartScreen({super.key});


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
              children: [
                Expanded(
                  flex: 3,
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
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: DefaultTextStyle(
                            style: TextStyle(fontSize: 13, color: Colors.white),
                            child: Text('Identify phishing message with AI')),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10, left: 30),
                        height: 60,
                        width: 400,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFF1E90FF),
                            side: const BorderSide(
                                width: 1.0, color: Color(0xFF1E90FF)),
                            shape: const RoundedRectangleBorder(
                              // 모서리 모양 설정
                              borderRadius: BorderRadius.zero, // 직각 모서리
                            ),
                          ),
                          child: const DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xFFFFFFFF)),
                              child: Text('LOGIN')),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) => Login(),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10, left: 30),
                        height: 60,
                        width: 400,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFF1E90FF),
                            side: const BorderSide(
                                width: 0.7, color: Color(0xFF1E90FF)),
                            shape: const RoundedRectangleBorder(
                              // 모서리 모양 설정
                              borderRadius: BorderRadius.zero, // 직각 모서리
                            ),
                          ),
                          child: const DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xFFFFFFFF)),
                              child: Text('Register')),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) => Register(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}