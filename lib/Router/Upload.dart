import 'dart:convert';
//import 'dart:html';
import 'package:hackathon/Router/Saving.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hackathon/Router/SelectWho.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

String ?filePath;

class Upload extends StatelessWidget {
  Upload({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 300,
                          child: DefaultTextStyle(
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                              child: Text(
                                  'Upload the chat data to analyze the tone :')),
                        ),
                        Container(
                          height: 70,
                          width: 100,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFF000000)),
                            ),
                            child: Icon(Icons.share, color: Colors.white),
                            onPressed: () async {
                              await pickFile(nameController.text, emailController.text, context);
                            },
                          ),
                        ),

                      ],
                    ),
                    Container(
                      width: 400,
                      padding: const EdgeInsets.only(top: 15),
                      child: TextField(
                        controller: nameController,
                        style: const TextStyle(color: Colors.white), // 텍스트 색상
                        decoration: const InputDecoration(
                          label: DefaultTextStyle(
                            style: TextStyle(fontSize: 17, color: Colors.white),
                            child: Text('Name the person here'),
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
                      width: 400,
                      padding: const EdgeInsets.only(top: 15),
                      child: TextField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.white), // 텍스트 색상
                        decoration: const InputDecoration(
                          label: DefaultTextStyle(
                            style: TextStyle(fontSize: 17, color: Colors.white),
                            child: Text('Person\'s e-mail'),
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
                          child: Text('NEXT'),
                        ),
                        onPressed: () {
                          uploadFile(nameController.text, emailController.text, context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
  Future<void> pickFile(String name, String email, BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      filePath = result.files.single.path!;
      //await uploadFile(name, email, filePath, context); // 파일 선택 후 업로드 호출
    } else {
      // User canceled the picker
    }
  }

  void uploadFile(String name, String email, BuildContext context) async {
    const String url = "http://10.0.2.2:5000/fishing/add_partner";
    final Uri uri = Uri.parse(url);
    var token = await getToken();

    var multipartRequest = http.MultipartRequest('POST', uri);
    multipartRequest.headers['Content-Type'] = 'multipart/form-data';
    multipartRequest.headers['Authorization'] = 'Bearer $token'; // Authorization 헤더 추가

    // 필드 추가
    multipartRequest.fields['data'] = '{"partner_name": "$name", "partner_email": "$email"}';
    multipartRequest.files.add(await http.MultipartFile.fromPath('file', filePath!));

    // 요청 보내기
    final response = await multipartRequest.send();

    // 응답 처리
    if (response.statusCode == 201) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      print(jsonDecode(responseString));
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('파일 업로드 성공!')));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => Saving(),
        ),
      );
    } else {
      print('Request failed with status: ${response.statusCode}.');
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      print('Response body: $responseString');
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('파일 업로드 실패!')));
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                backgroundColor: Colors.black,
                title: const DefaultTextStyle(
                  style:
                  TextStyle(fontSize: 25, color: Color(0xFFFFFFFF)),
                  child: Text('FAIL'),
                ),
                content: const DefaultTextStyle(
                  style:
                  TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
                  child: Text('Fail to upload'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const DefaultTextStyle(
                      style:
                      TextStyle(fontSize: 17, color: Color(0xFFFFFFFF)),
                      child: Text('CHECK'),
                    ),)
                ]);
          });
    }
  }
  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token') ?? '';
  }
}