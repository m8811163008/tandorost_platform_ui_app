import 'package:flutter/material.dart';

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
          icon: Transform.scale(scale: 0.7, child: CircularProgressIndicator()),
        )
        : TextButton(onPressed: onTap, child: Text(label));
  }
}
