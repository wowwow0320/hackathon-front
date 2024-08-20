import 'dart:convert';
//import 'dart:html';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hackathon/Router/Result.dart';
import 'package:hackathon/Router/SelectWho.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PMessage extends StatefulWidget {
  PMessage({super.key});

  @override
  _PMessageState createState() => _PMessageState();
}

class _PMessageState extends State<PMessage> {
  final phishingController = TextEditingController();
  bool isLoading = false; // 로딩 상태 변수 추가

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 400,
                      child: DefaultTextStyle(
                          style: TextStyle(fontSize: 25, color: Colors.white),
                          child: Text(
                              'Enter text to identify phishing message : ')),
                    ),
                    Container(
                      width: 400,
                      padding: const EdgeInsets.only(top: 15),
                      child: TextField(
                        controller: phishingController,
                        style: const TextStyle(color: Colors.white), // 텍스트 색상
                        decoration: const InputDecoration(
                          label: DefaultTextStyle(
                            style: TextStyle(fontSize: 17, color: Colors.white),
                            child: Text('Paste your text here'),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          hintText: 'Enter your text here', // 힌트 텍스트
                          hintStyle:
                          TextStyle(color: Colors.white54), // 힌트 텍스트 색상
                        ),
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
                          child: Text('ANALYZE'),
                        ),
                        onPressed: () {
                          // 로딩 상태를 true로 설정
                          setState(() {
                            isLoading = true;
                          });
                          pMessage(phishingController.text, context);
                        },
                      ),
                    ),
                    if (isLoading) // 로딩 스피너 표시
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                  ],
                ),
              ),
            )));
  }
  void pMessage(String phishing, BuildContext context) async {
    const String URL = "http://10.0.2.2:5000/fishing/determine_fishing";
    final request = Uri.parse(URL);
    var token = await getToken();


    final response = await http.post(
      request,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token', // Authorization 헤더 추가
      },
      body: jsonEncode({
        "msg": phishing,
      }),
    );
    // 요청이 완료된 후 로딩 상태를 false로 설정
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 201) {
      // JSON 응답을 성공적으로 받았을 때
      print(jsonDecode(response.body));
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      double speechSimilarity = responseData["speech_similarity"];
      double contentScore = responseData["content_score"];
      String similarFishingMsg = responseData["similar_fishing_msg"];
      String inputSentence = responseData["input_sentence"];


      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => Result(
            speechSimilarity: speechSimilarity,
            contentScore: contentScore,
            similarFishingMsg: similarFishingMsg,
            inputSentence : inputSentence,
          ),
        ),
      );
    } else {
      // 오류 발생 시 상태 코드와 응답 본문 출력
      print('Request failed with status: ${response.statusCode}.');
      print('Response body: ${response.body}');
    }
    // Call the fetch function to execute the request
    //await fetch();
  }
  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token') ?? '';
  }

}