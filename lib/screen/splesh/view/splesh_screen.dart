import 'dart:math';
import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Transform.rotate(
            angle: pi*animationController!.value,
            child: Image.network(
              "https://img.freepik.com/premium-vector/planet-logo_269830-1180.jpg",
              height: 150,
              width: 150,
            ),
          ),
        ),
      ),
    );
  }
}
