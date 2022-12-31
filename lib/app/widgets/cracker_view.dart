import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class FireworkAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FireworkAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  State<FireworkAnimation> createState() => _FireworkAnimationState();
}

class _FireworkAnimationState extends State<FireworkAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value * 200),
          child: child,
        );
      },
    );
  }
}
