// // import 'dart:convert';
// // import 'dart:html';
// // import 'package:test/test.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   final String URL = "http://127.0.0.1:5000/auth/login";
// //   final request = Uri.parse(URL);
// //
// //   Future<dynamic> fetch() async {
// //     //final response = await http.get(request);
// //     final response = await http.post(
// //       request,
// //       headers: {'Content-Type' : 'multipart/form-data'},
// //       body : jsonEncode({
// //         "user_name" : "바보",
// //         "password": "1234"
// //       }),
// //     );
// //     if (response.statusCode == 200) {
// //       // JSON 응답을 성공적으로 받았을 때
// //       print(jsonDecode(response.body));
// //       //print(response.body);
// //     } else {
// //       // 오류 발생 시 상태 코드와 응답 본문 출력
// //       print('Request failed with status: ${response.statusCode}.');
// //       print('Response body: ${response.body}');
// //     }
// //   }
// //
// //   test("API GET 테스트", () async {
// //     await fetch();
// //   });
// //
// //   // runApp(const MyApp()); // UI 테스트가 필요하지 않다면 주석 처리
// // }
//
// // import 'dart:convert';
// // import 'dart:html';
// // import 'package:test/test.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   final String URL = "http://127.0.0.1:5000/auth/login";
// //   final Uri uri = Uri.parse(URL); // Uri 객체의 이름을 uri로 변경
// //
// //   Future<dynamic> fetch() async {
// //     // MultipartRequest를 사용하여 multipart/form-data 형식으로 요청 생성
// //     var multipartRequest = http.MultipartRequest('POST', uri); // 변수 이름 변경
// //     multipartRequest.headers['Content-Type'] = 'multipart/form-data';
// //
// //     // 필드 추가
// //     //multipartRequest.fields['user_name'] = '바보';
// //     //multipartRequest.fields['password'] = '1234';
// //     multipartRequest.fields['data'] = '{"user_name": "바보", "password":"1234"}';
// //
// //     // 요청 보내기
// //     final response = await multipartRequest.send(); // multipartRequest 사용
// //
// //     // 응답 처리
// //     if (response.statusCode == 200) {
// //       // JSON 응답을 성공적으로 받았을 때
// //       final responseData = await response.stream.toBytes();
// //       final responseString = String.fromCharCodes(responseData);
// //       print(jsonDecode(responseString));
// //     } else {
// //       // 오류 발생 시 상태 코드와 응답 본문 출력
// //       print('Request failed with status: ${response.statusCode}.');
// //       final responseData = await response.stream.toBytes();
// //       final responseString = String.fromCharCodes(responseData);
// //       print('Response body: $responseString');
// //     }
// //   }
// //
// //   test("API POST 테스트", () async {
// //     await fetch();
// //   });
// //
// //   // runApp(const MyApp()); // UI 테스트가 필요하지 않다면 주석 처리
// // }
//
// import 'dart:convert';
// //import 'dart:html';
// import 'package:test/test.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'dart:io';
// //
// // const filePath = 'assets/api.txt'; // 현재 디렉토리의 api.txt 파일
// //
// // void main() {
// //   final String URL = "http://10.0.2.2:5000/fishing/add_partner";
// //   final Uri uri = Uri.parse(URL); // Uri 객체의 이름을 uri로 변경
// //
// //   Future<dynamic> fetch() async {
// //     // MultipartRequest를 사용하여 multipart/form-data 형식으로 요청 생성
// //     var multipartRequest = http.MultipartRequest('POST', uri); // 변수 이름 변경
// //     multipartRequest.headers['Content-Type'] = 'multipart/form-data';
// //
// //     // 필드 추가
// //     //multipartRequest.fields['user_name'] = '바보';
// //     //multipartRequest.fields['password'] = '1234';
// //     multipartRequest.fields['data'] = '{"user_name": "바보", "password":"1234"}';
// //     multipartRequest.files
// //         .add(await http.MultipartFile.fromPath('file', filePath));
// //
// //     // 요청 보내기
// //     final response = await multipartRequest.send(); // multipartRequest 사용
// //
// //     // 응답 처리
// //     if (response.statusCode == 200) {
// //       // JSON 응답을 성공적으로 받았을 때
// //       final responseData = await response.stream.toBytes();
// //       final responseString = String.fromCharCodes(responseData);
// //       print(jsonDecode(responseString));
// //     } else {
// //       // 오류 발생 시 상태 코드와 응답 본문 출력
// //       print('Request failed with status: ${response.statusCode}.');
// //       final responseData = await response.stream.toBytes();
// //       final responseString = String.fromCharCodes(responseData);
// //       print('Response body: $responseString');
// //     }
// //   }
// //
// //   test("API POST 테스트", () async {
// //     await fetch();
// //   });
// //
// //   runApp(const MyApp()); // UI 테스트가 필요하지 않다면 주석 처리
// // }
//

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//

//

//


//

//

//

//

//

//

//
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:hackathon/Router/Analyzing.dart';
import 'package:hackathon/Router/Calculating.dart';
import 'package:hackathon/Router/Complete.dart';
import 'package:hackathon/Router/Login.dart';
import 'package:hackathon/Router/PMessage.dart';
import 'package:hackathon/Router/Register.dart';
import 'package:hackathon/Router/Saving.dart';
import 'package:hackathon/Router/SelectWho.dart';
import 'package:hackathon/Router/SplashScreen.dart';
import 'package:hackathon/Router/StartScreen.dart';
import 'package:hackathon/Router/Upload.dart';
import 'package:hackathon/Router/Result.dart';

class MyApp extends StatelessWidget {
    const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'PhishGuard',
        debugShowCheckedModeBanner: false,
        home : StartScreen(key : key)
      //SplashScreen, StartScreen, Register, Upload, PMessage, SelectWho
    );
  }
}




void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'File Upload Example',
//       home: FileUploadExample(),
//     );
//   }
// }
//
// class FileUploadExample extends StatefulWidget {
//   @override
//   _FileUploadExampleState createState() => _FileUploadExampleState();
// }
//
// class _FileUploadExampleState extends State<FileUploadExample> {
//   String? filePath;
//
//   Future<void> pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       setState(() {
//         filePath = result.files.single.path;
//       });
//       await uploadFile(filePath!); // 파일 선택 후 업로드 호출
//     } else {
//       // User canceled the picker
//     }
//   }
//
//   Future<void> uploadFile(String filePath) async {
//     final String url = "http://10.0.2.2:5000/fishing/add_partner";
//     final Uri uri = Uri.parse(url);
//
//     var multipartRequest = http.MultipartRequest('POST', uri);
//     multipartRequest.headers['Content-Type'] = 'multipart/form-data';
//
//     // 필드 추가
//     multipartRequest.fields['data'] = '{"partner_name": "멍청이", "partner_email":"12345@naver.com"}';
//     multipartRequest.files.add(await http.MultipartFile.fromPath('file', filePath));
//
//     // 요청 보내기
//     final response = await multipartRequest.send();
//
//     // 응답 처리
//     if (response.statusCode == 201) {
//       final responseData = await response.stream.toBytes();
//       final responseString = String.fromCharCodes(responseData);
//       print(jsonDecode(responseString));
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('파일 업로드 성공!')));
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//       final responseData = await response.stream.toBytes();
//       final responseString = String.fromCharCodes(responseData);
//       print('Response body: $responseString');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('파일 업로드 실패!')));
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Upload Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: pickFile,
//               child: Text('파일 선택하기'),
//             ),
//             SizedBox(height: 20),
//             if (filePath != null) ...[
//               Text('선택한 파일 경로:'),
//               SizedBox(height: 10),
//               Text(filePath!),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
