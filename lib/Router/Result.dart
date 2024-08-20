import 'dart:convert';
//import 'dart:html';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hackathon/Router/SelectWho.dart';

class Result extends StatelessWidget {
  final double speechSimilarity;
  final double contentScore;
  final String similarFishingMsg;
  final String inputSentence;


  Result({
    required this.speechSimilarity,
    required this.contentScore,
    required this.similarFishingMsg,
    required this.inputSentence,
  });

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
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DefaultTextStyle(
                          style: TextStyle(fontSize: 30, color: Colors.white),
                          child: Text('Complete!')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DefaultTextStyle(
                          style: TextStyle(fontSize: 23, color: Colors.white),
                          child: Text('Result :')),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width : 80,
                                  child: DefaultTextStyle(
                                      style: TextStyle(fontSize: 17, color: Colors.white),
                                      child: Text('Similarity of tone')),
                                ),
                                Container(
                                  width: 110,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFFFFFFFF), // 외곽선 색상
                                      width: 2.0, // 외곽선 두께
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                                    child: DefaultTextStyle(
                                      style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF)), // 텍스트 스타일
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0), // 텍스트와 외곽선 사이의 여백
                                        child: Text('${speechSimilarity*100}% '), // 텍스트
                                      ),
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width : 90,
                                child: DefaultTextStyle(
                                    style: TextStyle(fontSize: 17, color: Colors.white),
                                    child: Text('Probability of Phishing Text')),
                              ),
                              Container(
                                width: 110,
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFFFFFFF), // 외곽선 색상
                                    width: 2.0, // 외곽선 두께
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                                  child: DefaultTextStyle(
                                    style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF)), // 텍스트 스타일
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0), // 텍스트와 외곽선 사이의 여백
                                      child: Text('${contentScore*100}%'), // 텍스트
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DefaultTextStyle(
                          style: TextStyle(fontSize: 23, color: Colors.white),
                          child: Text('Analyzed Text :')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left : 20.0, right: 20.0),
                      child: Container(
                        width: 600,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFFFFFFF), // 외곽선 색상
                            width: 2.0, // 외곽선 두께
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: DefaultTextStyle(
                            style: TextStyle(fontSize: 17, color: Color(0xFFFFFFFF)), // 텍스트 스타일
                            child: Padding(
                              padding: const EdgeInsets.all(8.0), // 텍스트와 외곽선 사이의 여백
                              child: Text('$inputSentence'), // 텍스트
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DefaultTextStyle(
                          style: TextStyle(fontSize: 23, color: Colors.white),
                          child: Text('Similar Actual Phisihing Text Cases :')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left : 20.0, right: 20.0),
                      child: Container(
                        width: 380,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFFFFFFF), // 외곽선 색상
                            width: 2.0, // 외곽선 두께
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3.0, left: 3.0),
                          child: DefaultTextStyle(
                            style: TextStyle(fontSize: 17, color: Color(0xFFFFFFFF)), // 텍스트 스타일
                            child: Padding(
                              padding: const EdgeInsets.all(8.0), // 텍스트와 외곽선 사이의 여백
                              child: Text('$similarFishingMsg'), // 텍스트
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.only(left : 20.0, right: 20.0, top: 20.0),
                    //   child: Container(
                    //     width: 600,
                    //     height: 40,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(
                    //         color: Color(0xFFFFFFFF), // 외곽선 색상
                    //         width: 2.0, // 외곽선 두께
                    //       ),
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(top: 3.0, left: 3.0),
                    //       child: DefaultTextStyle(
                    //         style: TextStyle(fontSize: 17, color: Color(0xFFFFFFFF)), // 텍스트 스타일
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0), // 텍스트와 외곽선 사이의 여백
                    //           child: Text('mom i need money, send it to xxxx-xxxx'), // 텍스트
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),


                  ],
                ),
              )
            )));
  }
}