import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  final Widget child;
  final double offest;
  final Duration duration;
  final Axis axis;

  const ShakeTransition({
    Key key,
    this.offest = -140.0,
    this.duration = const Duration(milliseconds: 900),
    this.axis = Axis.horizontal,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      child: child,
      curve: Curves.easeOutQuint,
      tween: Tween(begin: 1.0, end: 0.0),
      duration: duration,
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(value * offest, 0.0)
              : Offset(0.0, value * offest),
          child: child,
        );
      },
    );
  }
}

class ShakeListTransition extends StatelessWidget {
  final Duration duration;
  final Axis axis;
  final Widget child;
  final double offset;
  const ShakeListTransition({
    Key key,
    this.axis = Axis.horizontal,
    this.child,
    this.duration = const Duration(milliseconds: 900),
    this.offset = 140,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      curve: Curves.ease,
      duration: Duration(milliseconds: 900),
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(value * offset, 0.0)
              : Offset(0.0, value * offset),
          child: child,
        );
      },
    );
  }
}
