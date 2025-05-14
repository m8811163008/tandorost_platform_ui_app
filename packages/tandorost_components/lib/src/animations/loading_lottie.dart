import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/loading_lottie.json',
      package: 'tandorost_components',
      backgroundLoading: false,
      repeat: true,
    );
  }
}
