import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 모든 것은 위젯이다. 블록처럼 위젯에 위젯을 쌓아가며 앱을 만드는 것.
// class를 위젯으로 만들기 위해서는 상속이 필요함
class MyApp extends StatelessWidget {
  // 이거 해줘야 함
  const MyApp({super.key});

  // 모든 위젯은 build 메서드를 사용해야 한다
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 위젯은 Scaffold(건물 뼈대 너낌)를 가진다.
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Flutter App",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue[600],
        ),
        body: Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }
}
