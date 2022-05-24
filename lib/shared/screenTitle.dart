import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      duration: const Duration(seconds: 1),
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOut,
      builder: (context, double tweenValue, widget) {
        return Opacity(
          opacity: tweenValue,
          child: Padding(
            padding: EdgeInsets.only(top: tweenValue * 30),
            child: widget,
          ),
        );
      },
    );
  }
}
