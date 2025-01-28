import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String name, amount, code;
  final IconData icon;
  final bool isInverted;

  // _ =>private
  final _blackColor = const Color(0xFF1F2123);

  const MyCard({
    super.key,
    required this.name,
    required this.amount,
    required this.code,
    required this.icon,
    this.isInverted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // overflow controll
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : _blackColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 28,
                    color: isInverted ? _blackColor : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        color: isInverted ? _blackColor : Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      code,
                      style: TextStyle(
                        color: isInverted
                            ? _blackColor.withAlpha(200)
                            : Colors.white.withAlpha(200),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Transform.scale(
              scale: 2.2,
              child: Transform.translate(
                offset: Offset(-5, 12),
                child: Icon(
                  icon,
                  color: isInverted ? _blackColor : Colors.white,
                  // 아이콘 크기는 고정,
                  // transform으로 아이콘 사이즈 변경하여 카드 크기 유지
                  size: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
