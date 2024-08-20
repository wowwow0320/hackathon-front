import 'dart:convert';
//import 'dart:html';
import 'package:hackathon/Router/StartScreen.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hackathon/Router/Upload.dart';
import 'package:hackathon/Router/PMessage.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class SelectWho extends StatelessWidget {
  SelectWho({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                title: const DefaultTextStyle(
                    style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF)),
                    child: Text('HOME')),
                backgroundColor: const Color(0xff000000),
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => StartScreen(),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 400,
                      child: DefaultTextStyle(
                          style: TextStyle(fontSize: 23, color: Colors.white),
                          child: Text(
                              'Select who the message is pretending to be? :')),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: DropdownMenu(
                          textStyle: const TextStyle(color: Colors.white),
                          label: const DefaultTextStyle(
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                              child: Text('Select the person here')),
                          width: 400,
                          dropdownMenuEntries: list
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: value,
                            );
                          }).toList(),
                          inputDecorationTheme: const InputDecorationTheme(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            )),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      height: 70,
                      width: 400,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E90FF),
                          side: const BorderSide(
                              width: 1, color: Color(0xFF1E90FF)),
                          shape: const RoundedRectangleBorder(
                            // 모서리 모양 설정
                            borderRadius: BorderRadius.zero, // 직각 모서리
                          ),
                        ),
                        child: const DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 17, color: Color(0xFFFFFFFF)),
                          child: Text('OR ADD NEW PERSON'),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Upload(),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      height: 70,
                      width: 400,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E90FF),
                          side: const BorderSide(
                              width: 1, color: Color(0xFF1E90FF)),
                          shape: const RoundedRectangleBorder(
                            // 모서리 모양 설정
                            borderRadius: BorderRadius.zero, // 직각 모서리
                          ),
                        ),
                        child: const DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 17, color: Color(0xFFFFFFFF)),
                          child: Text('NEXT'),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) => PMessage(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}