import 'package:flutter/material.dart';

class BlinkText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  const BlinkText({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);

  @override
  State<BlinkText> createState() => _BlinkTextState();
}

class _BlinkTextState extends State<BlinkText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    setState(() {});
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: Text(
        widget.text,
        style: widget.style,
      ),
    );
  }
}
