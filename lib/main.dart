import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 모든 것은 위젯이다. 블록처럼 위젯에 위젯을 쌓아가며 앱을 만드는 것.
// class를 위젯으로 만들기 위해서는 상속이 필요함

// StatefulWidget은 두가지 부분으로 나뉨
// 그냥 위젯을 가진 부분
class MyApp extends StatefulWidget {
  // 상수화 시켜서 컴파일하기 편하게 만들기
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

// 상태를 가진 부분
// 상태는 class의 property임 별게 아님
class _MyAppState extends State<MyApp> {
  // 상태 선언
  List<int> numbers = [];
  // 반드시 setState 함수를 통해 프로퍼티를 변경시켜야만 ui가 리렌더링됨.
  // 정확히는 build 메서드를 재실행 하는것
  void onClick() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  // 모든 위젯은 build 메서드를 사용해야 한다
  @override
  Widget build(BuildContext context) {
    // 앱의 기본 디자인 정하기
    // CupertinoApp -> ios
    // MaterialApp -> android
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "click",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              // for collection (like js map)
              for (var number in numbers) Text("$number"),
              IconButton(
                onPressed: onClick,
                icon: Icon(Icons.add_box_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}
