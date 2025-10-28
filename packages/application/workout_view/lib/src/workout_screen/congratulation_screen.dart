import 'package:flutter/material.dart';
// Assuming Tandorost components are available for AppScaffold, etc.
import 'package:tandorost_components/tandorost_components.dart';
// Assuming you have a file that provides localizations (context.l10n)
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays a congratulatory message when the entire workout is complete.
class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({
    super.key,
    this.onResetTap, // Used for back button/exit
    required this.title,
    this.onDoneTap, // Used for the main action (e.g., navigate home/finish)
  });

  final VoidCallback? onResetTap;
  final String title;
  final VoidCallback? onDoneTap;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // The Congrats screen typically doesn't need a back button,
      // as the workout is finished, but we include it for consistency.
      appBar: AppBar(
        leading: BackButton(onPressed: onDoneTap),
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events, color: Colors.amber, size: 120),
              const SizedBox(height: 32),

              Text(
                context.l10n.congratulationScreenTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              Text(
                context.l10n.congratulationScreenSubtitle,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 64),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onDoneTap,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    context.l10n.congratulationScreenFinishButtonLabel,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: context.sizeExtenstion.medium),
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: onResetTap,
                  icon: Icon(Icons.restart_alt),
                  label: Text(
                    context.l10n.congratulationScreenFinishResetButtonLabel,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
