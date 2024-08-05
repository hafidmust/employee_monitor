import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LaporanScreen extends StatefulWidget {
  const LaporanScreen({super.key});

  @override
  State<LaporanScreen> createState() => _LaporanScreenState();
}

class _LaporanScreenState extends State<LaporanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network('https://lottie.host/2a1fcf5c-8278-4daa-8cbd-3e214f32f8c7/VfQ1FxXqJs.json',width: 300,height: 300),
      ),
    );
  }
}