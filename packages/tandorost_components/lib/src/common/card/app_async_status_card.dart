import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppAsyncStatusCard extends StatelessWidget {
  const AppAsyncStatusCard.inital({super.key})
    : _status = AsyncProcessingStatus.inital;
  const AppAsyncStatusCard.loading({super.key})
    : _status = AsyncProcessingStatus.loading;
  const AppAsyncStatusCard.serverError({super.key})
    : _status = AsyncProcessingStatus.serverConnectionError;
  const AppAsyncStatusCard.internetConnectionError({super.key})
    : _status = AsyncProcessingStatus.internetConnectionError;
  const AppAsyncStatusCard.notFound({super.key})
    : _status = AsyncProcessingStatus.success;
  final AsyncProcessingStatus _status;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Center(
        child: Builder(
          builder:
              (context) => switch (_status) {
                AsyncProcessingStatus.loading => CircularProgressIndicator(),
                _ => Text(context.l10n.appAsyncCardStatusText(_status.name)),
              },
        ),
      ),
    );
  }
}
