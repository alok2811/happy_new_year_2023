import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/blink_text.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Happy New Year'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Lottie.asset('assets/json/new_fireworks.json'),
              Lottie.asset('assets/json/season-fireworks.json'),
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                backgroundImage:
                    AssetImage('assets/images/yfxLU9UE_400x400.jpeg'),
              ),
            ],
          ),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Teko',
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                WavyAnimatedText('HAPPY NEW YEAR'),
                WavyAnimatedText('2023'),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const BlinkText(
            text: "Follow me @flutter_coding_",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
