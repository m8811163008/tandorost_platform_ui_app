import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/common/package_name.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size});
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Image.asset('assets/images/logo_main.png', package: packageName),
    );
  }
}
