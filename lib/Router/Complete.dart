import 'dart:convert';
//import 'dart:html';
import 'package:hackathon/Router/SelectWho.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hackathon/Router/SelectWho.dart';

class Complete extends StatelessWidget {
  Complete({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color(0xff000000),
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => SelectWho(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))),
            body: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Center(
                child: Column(
                  children: [
                     const Expanded(
                       flex: 3,
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultTextStyle(
                                  style: TextStyle(fontSize: 23, color: Colors.white),
                                  child: Text('Complete!')),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.only(top: 100, left: 30),
                        height: 30,
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
                              child: Text('GO HOME')),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) => SelectWho(),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}