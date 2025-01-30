import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int twentyFiveMinutes = 1500;

  int totalSeconds = twentyFiveMinutes;
  // 타이머 실행 상태 감시하는 플래그 상태
  bool isRunning = false;
  int totalPomodorods = 0;
  // timer property
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodorods += 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  // 실행 버튼 클릭시 실행되는 메서드
  void onStartPressed() {
    // 1초의 주기로 onTick 메서드(콜백) 실행
    timer = Timer.periodic(
      Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRunning = true;
    });
  }

  // 일시정지 버튼 클릭시
  void onPausePressed() {
    // 타이머 정지
    timer.cancel();

    setState(() {
      isRunning = false;
    });
  }

  void onRefreshPressed() {
    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
    });

    timer.cancel();
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    var [_, minute, second] = duration.toString().split(".").first.split(":");

    return "$minute:$second";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          // Flexible -> width 비율에 기반한 ui 생성을 위한 위젯
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  icon: Icon(
                    isRunning
                        ? Icons.pause_circle_outline_outlined
                        : Icons.play_circle_outlined,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: onRefreshPressed,
                      child: Text(
                        "🔄 refresh?",
                        style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                // width 100% 차지하도록 하는 위젯
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "pomodoros",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          "$totalPomodorods",
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
