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
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  // 모든 위젯은 build 메서드를 사용해야 한다
  @override
  Widget build(BuildContext context) {
    // 앱의 기본 디자인 정하기
    // CupertinoApp -> ios
    // MaterialApp -> android
    return MaterialApp(
      // 앱의 레이아웃 정의하는 느낌?
      // 폰트나 배경색 등을 미리 정의
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? MyLargeTitle() : Text("noting.."),
              IconButton(
                onPressed: toggleTitle,
                icon: Icon(
                  Icons.add_box,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 분리한 위젯에서 부모(App)에서 정의한 theme을 사용하는 것이 목적
class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

/// Widget Life Cycle
// 아래 위젯 렌더링 시
// flutter: state init
// flutter: build
// 아래 위젯 화면에서 제거 시
// flutter: dispoesed
class _MyLargeTitleState extends State<MyLargeTitle> {
  // state 초기화를 위한 메서드
  // 항상 여기서 상태 초기화 할 필요는 없음. 보통 property로 초기화함
  // 또한, initstate는 build 보다 항상 먼저 실행되어야 함
  // 예시) API 업데이트 구독
  // api 상태를 먼저 받고 build(렌더링) 하니까 잘 되는거인듯
  @override
  void initState() {
    super.initState();
    print("state init");
  }

  // 위젯이 스크린에서 제거될 때 호출되는 메서드
  // 예시) API 구독 해지
  @override
  void dispose() {
    super.dispose();
    print("dispoesed");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    // context는 상위 요소(부모)들에 대한 정보가 담김
    // 즉, 위젯트리에 대한 정보가 담긴 것임
    // context를 통해 부모의 상태에는 접근이 불가능함.
    return Text(
      "MyLargeTitle",
      style: TextStyle(
        fontSize: 30,
        // 부모로 접근하는 방법
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
