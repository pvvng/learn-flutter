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
    // 앱의 기본 디자인 정하기
    // CupertinoApp -> ios
    // MaterialApp -> android
    return MaterialApp(
      // 위젯은 Scaffold(건물 뼈대 너낌)를 가진다.
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        // Column -> 상하로 쌓기
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                // Row -> 좌우로 정렬
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textDirection: TextDirection.ltr, // 텍스트 방향 설정
                      children: [
                        Text(
                          "Hey Kim",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Wellcome Back",
                          style: TextStyle(
                            color: Colors.white.withAlpha(180),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
