import 'dart:convert';
//import 'dart:html';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hackathon/Router/SelectWho.dart';
import 'package:hackathon/Router/StartScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final emailController = TextEditingController();
  final pwdController = TextEditingController();

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
                          builder: (BuildContext context) => StartScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))),
            body: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 30),
                    child: DefaultTextStyle(
                        style: TextStyle(fontSize: 30, color: Colors.white),
                        child: Text('Login')),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30, left: 30),
                    height: 100,
                    width: 400,
                    child: TextField(
                      controller : emailController,
                      style: const TextStyle(color: Color(0xFFffffff)),
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.white),
                          ),
                          labelText: 'Jane@example.com',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xFFffffff)))),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 30),
                    height: 90,
                    width: 400,
                    child:  TextField(
                      controller: pwdController,
                      obscureText: true,
                      style: const TextStyle(color: Color(0xFFffffff)),
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.white),
                          ),
                          labelText: '**********',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xFFffffff)))),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    height: 50,
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
                        child: Text('LOGIN'),
                      ),
                      onPressed: () {
                        login(emailController.text, pwdController.text, context);
                      },
                    ),
                  )
                ],
              ),
            )));
  }

  void login(String email, String pwd, BuildContext context) async {
    const String URL = "http://10.0.2.2:5000/auth/login";
    final request = Uri.parse(URL);


    final response = await http.post(
      request,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        "user_name": email,
        "password": pwd
      }),
    );
    if (response.statusCode == 200) {
      // JSON 응답을 성공적으로 받았을 때
      print(jsonDecode(response.body));
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      String accessToken = responseData['access_token']; // JWT 토큰 추출

      // JWT 토큰을 SharedPreferences에 저장
      await saveToken(accessToken);

      print('Login successful! Token: $accessToken');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => SelectWho(),
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
  // JWT 토큰을 SharedPreferences에 저장하는 함수
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', token);
  }


}


