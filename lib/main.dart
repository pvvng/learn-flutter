import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 모든 것은 위젯이다. 블록처럼 위젯에 위젯을 쌓아가며 앱을 만드는 것.
// class를 위젯으로 만들기 위해서는 상속이 필요함
class MyApp extends StatelessWidget {
  // 상수화 시켜서 컴파일하기 편하게 만들기
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
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
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
                              fontSize: 24,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Wellcome Back",
                          style: TextStyle(
                            color: Colors.white.withAlpha(180),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    color: Colors.white.withAlpha(200),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "\$5 194 382",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 38),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF2B33A),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 40,
                        ),
                        child: Text(
                          "transfer",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
