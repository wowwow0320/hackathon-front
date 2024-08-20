import 'dart:convert';
//import 'dart:html';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hackathon/Router/Complete.dart'; // Complete 페이지 import
import 'package:hackathon/Router/SelectWho.dart';

class Saving extends StatelessWidget {
  Saving({super.key});

  @override
  Widget build(BuildContext context) {
    // 5초 후에 Complete 페이지로 이동
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => Complete(), // Complete 페이지로 이동
        ),
      );
    });

    return Scaffold(
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
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: TextStyle(fontSize: 23, color: Colors.white),
                  child: Text('Saving Data...'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
