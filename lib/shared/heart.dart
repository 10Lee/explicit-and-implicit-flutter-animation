import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _animateColor;
  late Animation<double> _scaleTransition;
  late Animation<double> _curveSlowMiddle;
  bool isFav = false;

  void animateHeartColorPerClicked() {
    _animationController.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          isFav = true;
          break;
        case AnimationStatus.dismissed:
          isFav = false;
          break;
        default:
      }
    });

    _animateColor = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_curveSlowMiddle);
  }

  void animateScaleBackAndForth() {
    List<TweenSequenceItem<double>> listOfSequence = [
      TweenSequenceItem(tween: Tween<double>(begin: 1, end: 2), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 2, end: 1), weight: 50),
    ];

    _scaleTransition = TweenSequence(listOfSequence).animate(_curveSlowMiddle);
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _curveSlowMiddle =
        CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);

    animateHeartColorPerClicked();

    animateScaleBackAndForth();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        return ScaleTransition(
          scale: _scaleTransition,
          child: IconButton(
            icon: Icon(
              Icons.favorite,
              color: _animateColor.value,
            ),
            onPressed: () {
              isFav
                  ? _animationController.reverse()
                  : _animationController.forward();
            },
          ),
        );
      },
    );
  }
}
