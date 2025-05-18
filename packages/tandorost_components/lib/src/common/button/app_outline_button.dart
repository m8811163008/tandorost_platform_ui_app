import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:tandorost_theme/tandorost_theme.dart';

class AppOutLineButton extends StatelessWidget {
  const AppOutLineButton({super.key, this.onTap, required this.label})
    : _isLoading = false;

  const AppOutLineButton.loading({super.key, this.onTap, required this.label})
    : _isLoading = true;
  final bool _isLoading;
  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? OutlinedButton.icon(
          onPressed: onTap,
          label: Text(label),
          icon: LoadingLottie(size: context.sizeExtenstion.appButton),
        )
        : OutlinedButton(onPressed: onTap, child: Text(label));
  }
}