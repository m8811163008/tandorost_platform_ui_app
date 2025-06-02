import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/common/package_name.dart';

class PaymentBackground extends StatelessWidget {
  const PaymentBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/payment_background.jpg',
      package: packageName,
      fit: BoxFit.fitWidth,
    );
  }
}
