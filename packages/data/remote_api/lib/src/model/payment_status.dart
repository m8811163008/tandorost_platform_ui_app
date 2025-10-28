import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum PaymentStatus {
  pendingSettle,
  pendingTransfer,
  failed,
  completed,
  refund;

  bool get isNotPaid =>
      this == PaymentStatus.pendingSettle ||
      this == PaymentStatus.pendingTransfer;
}
