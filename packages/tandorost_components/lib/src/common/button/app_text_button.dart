import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, this.onTap, required this.label})
    : _isLoading = false;

  const AppTextButton.loading({super.key, this.onTap, required this.label})
    : _isLoading = true;
    
  final bool _isLoading;
  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? TextButton.icon(
          onPressed: onTap,
          label: Text(label),
          icon: LoadingLottie(size: context.sizeExtenstion.appButton),
        )
        : TextButton(onPressed: onTap, child: Text(label));
  }
}